/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Cart;
import Model.Item;
import Model.ProductDetail;
import dal.ProductDetailDAO;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "ProcessControl", urlPatterns = {"/process"})
public class ProcessControl extends HttpServlet {

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
            out.println("<title>Servlet ProcessControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessControl at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
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
        System.out.println(txtCart + "|||||||||||||");
        Cart cart = new Cart(txtCart, listP);

        String num_raw = request.getParameter("num");
        String pId_raw = request.getParameter("pId");
        String sizeId_raw = request.getParameter("sizeId");
        String colorId_raw = request.getParameter("colorId");

        int pId, sizeId, colorId, num = 0;
        try {
            pId = Integer.parseInt(pId_raw);
            System.out.println(pId);
            sizeId = Integer.parseInt(sizeId_raw);
            System.out.println(sizeId);
            colorId = Integer.parseInt(colorId_raw);
            System.out.println(colorId);
            ProductDetail p = daoPD.getProductDetailByIds(pId, sizeId, colorId);
            System.out.println(p.getProduct().getProductName() + "|" + p.getSize().getSize() + "|" + p.getColor().getColor());
            int numStore = p.getQuantity();
            num = Integer.parseInt(num_raw);
            if (num == -1 && (cart.getQuantityById(pId, sizeId, colorId) <= 1)) {
                cart.removeItem(pId, sizeId, colorId);
            } else {
                if (num == 1 && cart.getQuantityById(pId, sizeId, colorId) >= numStore) {
                    num = 0;
                }
                double price = p.getProduct().getUnitPrice();
                Item t = new Item(p, num, price);
                System.out.println(num);
                cart.addItem(t);
            }
        } catch (Exception e) {

        }
        List<Item> items = cart.getItems();
        for (Item i : items) {
            System.out.println(i.getProduct().getProduct().getProductName() + "|" + i.getQuantity() + "___________________");
        }
        txtCart = "";
        if (items.size() > 0) {
            txtCart = items.get(0).getProduct().getProduct().getProductId() + ":"
                    + items.get(0).getProduct().getSize().getSizeId() + ":"
                    + items.get(0).getProduct().getColor().getColorId() + ":"
                    + items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txtCart += "/"
                        + items.get(i).getProduct().getProduct().getProductId() + ":"
                        + items.get(i).getProduct().getSize().getSizeId() + ":"
                        + items.get(i).getProduct().getColor().getColorId() + ":"
                        + items.get(i).getQuantity();
            }
        }
        System.out.println(txtCart + "--------------------");
        PrintWriter out = response.getWriter();
        out.print(txtCart);
//        arr = request.getCookies();
//        if (arr != null) {
//            for (Cookie c : arr) {
//                if (c.getName().equals("cart")) {
//                    c = new Cookie("cart", txtCart);
//                    c.setMaxAge(2 * 24 * 60 * 60);
//                    response.addCookie(c);
//                }
//            }
//        }
//
//        response.sendRedirect("cart");

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
        //processRequest(request, response);
        ProductDetailDAO daoPD = new ProductDetailDAO();
        List<ProductDetail> listP = daoPD.getAllProductDetails();
        Cookie[] arr = request.getCookies();
        String txtCart = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txtCart += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                    break;
                }
            }
        }
        System.out.println(txtCart + "|||||||||||||");
        Cart cart = new Cart(txtCart, listP);

        String pId_raw = request.getParameter("pId");
        String sizeId_raw = request.getParameter("sizeId");
        String colorId_raw = request.getParameter("colorId");

        int pId, sizeId, colorId;
        try {
            pId = Integer.parseInt(pId_raw);
            System.out.println(pId);
            sizeId = Integer.parseInt(sizeId_raw);
            System.out.println(sizeId);
            colorId = Integer.parseInt(colorId_raw);
            System.out.println(colorId);
            ProductDetail p = daoPD.getProductDetailByIds(pId, sizeId, colorId);
            System.out.println(p.getProduct().getProductName() + "|" + p.getSize().getSize() + "|" + p.getColor().getColor());

            cart.removeItem(pId, sizeId, colorId);

        } catch (Exception e) {

        }
        List<Item> items = cart.getItems();

        txtCart = "";
        if (items.size() > 0) {
            txtCart = items.get(0).getProduct().getProduct().getProductId() + ":"
                    + items.get(0).getProduct().getSize().getSizeId() + ":"
                    + items.get(0).getProduct().getColor().getColorId() + ":"
                    + items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txtCart += "/"
                        + items.get(i).getProduct().getProduct().getProductId() + ":"
                        + items.get(i).getProduct().getSize().getSizeId() + ":"
                        + items.get(i).getProduct().getColor().getColorId() + ":"
                        + items.get(i).getQuantity();
            }
        }
        System.out.println(txtCart + "--------------------");
        PrintWriter out = response.getWriter();
        out.print(txtCart);
//        arr = request.getCookies();
//        if (arr != null) {
//            for (Cookie c : arr) {
//                if (c.getName().equals("cart")) {
//                    c = new Cookie("cart", txtCart);
//                    c.setMaxAge(2 * 24 * 60 * 60);
//                    response.addCookie(c);
//                }
//            }
//        }
//
//        response.sendRedirect("cart");
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
