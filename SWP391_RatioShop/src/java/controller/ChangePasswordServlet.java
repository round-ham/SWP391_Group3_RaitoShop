/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Accounts;
import util.encodepassword;

/**
 *
 * @author Steam
 */
@WebServlet(name="ChangePasswordServlet", urlPatterns={"/changepassword"})
public class ChangePasswordServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ChangePasswordServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath () + "</h1>");
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
 HttpSession session = request.getSession();
        Accounts a = (Accounts) session.getAttribute("account");
        request.setAttribute("loginWith", a.getLoginWith());
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);    } 

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
                String currentpass = request.getParameter("currentpass");
        String newpass = request.getParameter("newpass");
        HttpSession session = request.getSession();
        Accounts a = (Accounts) session.getAttribute("account");
        if (a.getLoginWith() == 1) {

            String cpass = encodepassword.getMd5(currentpass);
            if (!cpass.equals(a.getPassword())) {
                request.setAttribute("msg", "Mật khẩu hiện tại không đúng");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else {
                AccountDAO adao = new AccountDAO();
                String pass = encodepassword.getMd5(newpass);
                adao.changePassword(a.getEmail(), pass);
                session.setAttribute("account", adao.getAccountByEmail(a.getEmail()));
                request.setAttribute("msg", "Đổi mật khẩu thành công");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }
        } else {

            AccountDAO adao = new AccountDAO();
            String pass = encodepassword.getMd5(newpass);
            adao.changePassword(a.getEmail(), pass);
            session.setAttribute("account", adao.getAccountByEmail(a.getEmail()));
            request.setAttribute("msg", "Đổi mật khẩu thành công");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
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
