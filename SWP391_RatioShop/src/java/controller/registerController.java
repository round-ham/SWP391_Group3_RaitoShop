/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.AccountDAO;
import Model.Accounts;
import util.PasswordHash;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Random;
import util.Mail;

/**
 *
 * @author Owwl
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve registration form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String fullName = request.getParameter("fullName");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phoneNumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");

        // Check for duplicate email
        if (isDuplicateEmail(email)) {
            request.setAttribute("msg", "Email address is already registered");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Basic form validation
        if (!password.equals(repassword)) {
            request.setAttribute("msg", "Password and Repeat Password must match");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        // Hash the password
        String hashedPassword = new PasswordHash().hashPassword(password);

        // Create a new Accounts object
        Accounts newAccount = new Accounts();
        newAccount.setEmail(email);
        newAccount.setPassword(hashedPassword);
        newAccount.setFullName(fullName);
        newAccount.setGender(gender == 1); // Assuming 1 is for Male and 0 is for Female
        newAccount.setPhone(phoneNumber);
        newAccount.setAddress(address);
        newAccount.setCreateDate(new Date(System.currentTimeMillis())); // Set current date as creation date
        newAccount.setStatus(1);
        
        String otp = generateOTP();
        String link = "http://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/verify?otp=" + otp + "&email=" + email;
        new Mail().sendEmail(email, "EMAIL VERTIFICATION", "Your verification code: " + otp);
        
        request.getSession().setAttribute("register_otp_" + email, otp);
        request.getSession().setAttribute("register_info_" + email, newAccount);

        // Redirect to login page after successful registration
        request.setAttribute("email", email);
        request.getRequestDispatcher("verify.jsp").forward(request, response);
    }

    private boolean isDuplicateEmail(String email) {
        AccountDAO accountDAO = new AccountDAO();
        Accounts existingAccount = accountDAO.getAccountByEmail(email);
        return existingAccount != null;
    }
    
    public String generateOTP() {
        Random random = new Random();
        return 100000 + random.nextInt(900000) + "";
    }

}
