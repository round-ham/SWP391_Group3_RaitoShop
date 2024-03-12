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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.PasswordHash;

/**
 *
 * @author Duc Hung Computer
 */
public class ChangePasswordController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String password = request.getParameter("newPassword");
        if(password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$")){ //Tối thiểu tám ký tự, ít nhất một chữ cái viết hoa, một chữ cái viết thường và một số
            return true;
        }else{
            request.setAttribute("error", "Password must be at least eight characters, at least one uppercase letter, one lowercase letter, and one number.");
            return false;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (processRequest(request, response)) {
        AccountDAO accDao = new AccountDAO();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) request.getParameter("password");
        String hashPassword = (new PasswordHash().hashPassword(password));
            System.out.println(hashPassword);
        String newPassword = (String) request.getParameter("newPassword");
        String con_newPassword = (String)request.getParameter("con_newPassword");
        boolean passwordCorrect = accDao.checkPassword(email, hashPassword);
        if (!passwordCorrect) {
            // Mật khẩu không chính xác, quay lại trang changePassword.jsp
            request.setAttribute("ms2", "Your old password is incorrect. Please check again.");
            Accounts acc = accDao.getAccountByEmail(email);
            request.setAttribute("a", acc);
            request.getRequestDispatcher("views/profile.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới và xác nhận mật khẩu mới
        if (password.equals(newPassword)) {
            // Mật khẩu mới không được trùng với mật khẩu cũ, quay lại trang changePassword.jsp
            request.setAttribute("ms1", "New password cannot be the same as the old password. Please choose a different password.");
            Accounts acc = accDao.getAccountByEmail(email);
            request.setAttribute("a", acc);
            request.getRequestDispatcher("views/profile.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(con_newPassword)) {
            // Xác nhận mật khẩu mới không khớp, quay lại trang changePassword.jsp

            request.setAttribute("ms3", "Confirmed password does not match the new password. Please try again.");
            Accounts acc = accDao.getAccountByEmail(email);
            request.setAttribute("a", acc);
            request.getRequestDispatcher("views/profile.jsp").forward(request, response);
            return;
        }
        String hashNewPassword = PasswordHash.hashPassword(con_newPassword);
        // Thực hiện thay đổi mật khẩu
        boolean passwordChanged = accDao.changePassword(email, hashPassword, con_newPassword);

        if (passwordChanged) {
            // Thay đổi mật khẩu thành công, chuyển hướng đến trang profile.jsp
            request.setAttribute("sc", "Change password success.");
            Accounts acc = accDao.getAccountByEmail(email);
            request.setAttribute("a", acc);
            request.getRequestDispatcher("views/profile.jsp").forward(request, response);
        
        } else {
            // Thay đổi mật khẩu thất bại, quay lại trang changePassword.jsp

            request.setAttribute("ms2", "Your old password is incorrect. Please check again.");
            Accounts acc = accDao.getAccountByEmail(email);
            request.setAttribute("a", acc);
            request.getRequestDispatcher("views/profile.jsp").forward(request, response);
        }
        } else {
            this.doGet(request, response);
        }
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
