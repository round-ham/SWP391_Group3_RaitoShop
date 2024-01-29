/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.AccountDAO;
import model.Accounts;
import util.PasswordHash;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author Owwl
 */
@WebServlet(name="LoginController", urlPatterns={"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        String hashedPassword = new PasswordHash().hashPassword(password);

        // Validate login credentials (you may want to implement stronger validation logic)
        if (isValidLogin(email, hashedPassword)) {
            // If login is successful, update lastLogin and redirect to a home page
            updateLastLogin(email);
            response.sendRedirect("home");
        } else {
            // If login fails, set an error message and forward back to the login page
            request.setAttribute("err", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean isValidLogin(String email, String password) {
        // You need to implement your own logic to validate the login credentials
        // For simplicity, let's assume a valid login if email and password are not empty
        return email != null && !email.isEmpty() && password != null && !password.isEmpty();
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
