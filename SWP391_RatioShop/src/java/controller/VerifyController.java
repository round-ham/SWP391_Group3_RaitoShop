/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Accounts;
import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;
import util.Mail;

/**
 *
 * @author Owwl
 */
@WebServlet(name="VerifyController", urlPatterns={"/verify"})
public class VerifyController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String email = request.getParameter("email");
        
        String otp = generateOTP();
        String link = "http://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/verify?otp=" + otp + "&email=" + email;
        new Mail().sendEmail(email, "EMAIL VERTIFICATION", "Your verification code: " + otp);
        
        request.getSession().setAttribute("register_otp_" + email, otp);
        
        request.setAttribute("email", email);
        request.setAttribute("err", "An email was sent");
        request.getRequestDispatcher("verify.jsp").forward(request, response);
        
    } 
    
    public String generateOTP() {
        Random random = new Random();
        return 100000 + random.nextInt(900000) + "";
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String email = (String) request.getParameter("email");
        String otp = (String) request.getParameter("otp");

        String checkOtp = (String) request.getSession().getAttribute("register_otp_" + email);

        if (otp.equals(checkOtp)) {

            Accounts account = (Accounts) request.getSession().getAttribute("register_info_" + email);
            new AccountDAO().addAccount(account);
            
            request.getSession().removeAttribute("register_otp_" + email);

            response.sendRedirect("login?success");

        } else {

            // Wrong otp
            request.setAttribute("err", "Wrong OTP");
            request.setAttribute("email", email);
            request.getRequestDispatcher("verify.jsp").forward(request, response);

        }
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
