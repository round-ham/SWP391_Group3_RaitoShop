/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
//import dal.ProductSaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Accounts;
import model.EmailHandler;
import util.encodePassword;
import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServlet;

/**
 *
 * @author admin
 */
public class registerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String codeEnter = request.getParameter("verify");
        HttpSession session = request.getSession();
        if (codeEnter == null) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repass = request.getParameter("repassword");
            String username = request.getParameter("username");
            String sex = request.getParameter("gender");
            int gender = Integer.parseInt(sex);
            String phone = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            try {
                AccountDAO adao = new AccountDAO();
                if (adao.checkAccountExit(email)) {
                    System.out.println(adao.checkAccountExit(email));
                    request.setAttribute("msg", "Email " + email + " đã tồn tại!");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
                    String verify = EmailHandler.generateCodeVerify();
                    String codeVerify = encodePassword.getMd5(verify);
                    String subject = "Email Varification!";
                    String content = "<!DOCTYPE html>\n"
                            + "<html>\n"
                            + "<head>\n"
                            + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                            + "    <title>Xác thực email</title>\n"
                            + "    <style>\n"
                            + "        .container {\n"
                            + "            margin: 50px 200px;\n"
                            + "            background-color: #F3F3F3;\n"
                            + "            padding: 25px;\n"
                            + "        }\n"
                            + "    </style>\n"
                            + "</head>\n"
                            + "<body style=\"background-color: #b8daff; padding: 20px;\">\n"
                            + "    <div class=\"container\">\n"
                            + "        <h2 style=\"font-size: 30px;\">Xin Chào!!</h2>\n"
                            + "        <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Mã xác thực của bạn là:</p>\n"
                            + "        <h1 style=\"margin-left: 150px; font-size: 38px; color: red;\">" + verify + "</h1>\n"
                            + "        <p>Vui lòng nhập mã này vào trang xác thực trên website của chúng tôi để hoàn tất quá trình đăng ký.</p>\n"
                            + "        <p style=\"font-size: 15px;\"><a href=\"http://localhost:9999/onlineshop/verify.jsp\">Quay lại website của chúng tôi</a></p>\n"
                            + "        <p>Nếu bạn không yêu cầu mã này, vui lòng bỏ qua email này hoặc liên hệ với bộ phận hỗ trợ của chúng tôi.</p>\n"
                            + "        <p>Trân trọng,</p>\n"
                            + "        <h2>FBT Shoes Shop</h2>\n"
                            + "    </div>\n"
                            + "</body>\n"
                            + "</html>";
                    EmailHandler.sendEMail(email, subject, content);
                    Cookie c = new Cookie("codeVerify", codeVerify);
                    c.setMaxAge(60*5);
                    response.addCookie(c);
                    session.setAttribute("authenticationfor", "register");
                    Accounts account = new Accounts(email, password, username);
                    session.setAttribute("accregister", account);

                    request.getRequestDispatcher("verify.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        } else {
            String codeVerify = encodePassword.getMd5(codeEnter);
            Cookie[] arrCookie = request.getCookies();
            String code = "";
            if (arrCookie != null) {
                for (Cookie c : arrCookie) {
                    if (c.getName().equals("codeVerify")) {
                        code += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
            String email = (String) session.getAttribute("email");

            if (!codeVerify.equals(code)) {
                request.setAttribute("err", "Code nhập không đúng");
                request.getRequestDispatcher("verify.jsp").forward(request, response);
            } else {
                AccountDAO adao = new AccountDAO();
                Customers ctm = new Customers();
                //ProductSaleDAO psdao = new ProductSaleDAO();
                Accounts account = (Accounts) session.getAttribute("accregister");
                String pass = encodePassword.getMd5(account.getPassword());
                adao.newAccount(account.getEmail(), pass, account.getUsername());
                Accounts a = adao.getAccountByEmail(account.getEmail());
                //psdao.deleteSaleProductEndTime();
                session.setAttribute("account", a);
                response.sendRedirect("home");
            }

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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        processRequest(request, response);
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
