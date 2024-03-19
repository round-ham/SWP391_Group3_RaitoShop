/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Vnpay;

import Model.PayModel;
import Model.Accounts;
import Model.Cart;
import Model.ProductDetail;
import dal.OrderDAO;
import dal.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN-PC
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String grandTotalStr = request.getParameter("total");
    Long grandTotal = Long.parseLong(grandTotalStr);
    PayModel payModel = new PayModel();
    payModel.setVnp_Ammount(grandTotal);
    payModel.vnp_OrderInfo = "Thanh toán đơn hàng";
    payModel.vnp_OrderType = "topup";
    payModel.vnp_TxnRef = System.currentTimeMillis();

    ProductDetailDAO daoPD = new ProductDetailDAO();
    List<ProductDetail> listP = daoPD.getAllProductDetails();
    Cookie[] arr = request.getCookies();
    String txtCart = "";
    if (arr != null) {
        for (Cookie c : arr) {
            if (c.getName().equals("cart")) {
                txtCart += c.getValue();
                c.setValue("");
                c.setMaxAge(0);
                response.addCookie(c);
                break;
            }
        }
    }
    Cart cart = new Cart(txtCart, listP);
    Accounts customer = (Accounts) session.getAttribute("account");
    if (customer == null) {
        Cookie c = new Cookie("cart", txtCart);
        c.setMaxAge(60 * 60 * 24 * 2);
        response.addCookie(c);
        response.sendRedirect("login");
        return; // Return after sendRedirect to stop further execution
    } else {
        OrderDAO daoO = new OrderDAO();
        String address = request.getParameter("address");
        if (address != null && address.trim().length() > 0) {
            customer.setAddress(address);
        }
        daoO.checkOut(customer, cart);
    }
    session.removeAttribute("cart");
    PayService payService = new PayService();
    String paymentUrl = payService.payWithVNPAY(payModel, request);
    response.sendRedirect(paymentUrl);
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
