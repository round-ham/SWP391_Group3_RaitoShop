/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.AccountDAO;
import Model.Accounts;
import Model.Product;
import util.PasswordHash;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Owwl
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        // Validate login credentials (you may want to implement stronger validation logic)
        if (isValidLogin(email, password, request)) {
            List<Product> listCartProduct = new ArrayList<>();
            // If login is successful, update lastLogin and redirect to a home page
            request.getSession().setAttribute("listCartProduct", listCartProduct);
            Accounts account = new AccountDAO().getAccountByEmail(email);
            request.getSession().setAttribute("account", account);
            request.getSession().setAttribute("loggedInAccountId", account.getAccountId());
            int userId = new AccountDAO().getUserIdByEmail(email);

            // Lưu userId vào session
            request.getSession().setAttribute("userId", userId);
            session.setAttribute("email", email);
            updateLastLogin(email);
            String returnUrl = request.getParameter("returnUrl");
            if (returnUrl != null) {
                response.sendRedirect(returnUrl);
            } else {
                response.sendRedirect("homepage");
            }
          } else {
            // If login fails, set an error message and forward back to the login page
            request.getAttribute("err");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean isValidLogin(String email, String password, HttpServletRequest request) {

        AccountDAO accountDAO = new AccountDAO();
        Accounts account = accountDAO.getAccountByEmail(email);
        boolean validLogin = account != null && account.getPassword().equals(new PasswordHash().hashPassword(password));
        boolean isBanned = account != null && account.getStatus() == 0;
        if (validLogin && !isBanned) {
            return true;
        } else if (isBanned) {
            request.setAttribute("err", "Your account has been banned. Please contact support for assistance.");
        } else {
            request.setAttribute("err", "Invalid email or password");
        }

        return false;
    }

    private void updateLastLogin(String email) {
        // Retrieve the account by email from the database
        AccountDAO accountDAO = new AccountDAO();
        Accounts account = accountDAO.getAccountByEmail(email);

        // Update the lastLogin field
        if (account != null) {
            account.setLastLogin(new Date(System.currentTimeMillis()));
            // Save the updated account information back to the database
            accountDAO.updateAccount(account);
        }
    }

}
