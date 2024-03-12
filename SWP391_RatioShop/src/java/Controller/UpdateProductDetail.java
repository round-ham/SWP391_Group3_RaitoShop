/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Color;
import Model.Product;
import Model.ProductDetail;
import Model.Size;
import dal.ColorDAO;
import dal.ProductDAO;
import dal.ProductDetailDAO;
import dal.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UpdateProductDetail extends HttpServlet {

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
        try {
            ProductDAO pDAO = new ProductDAO();
            ColorDAO cDAO = new ColorDAO();
            SizeDAO sDAO = new SizeDAO();
            List<Product> listP = pDAO.getProductsOrderbyAlphabet();
            List<Color> listC = cDAO.getListColors();
            List<Size> listS = sDAO.getSizes();
            //
            request.setAttribute("listP", listP);
            request.setAttribute("listC", listC);
            request.setAttribute("listS", listS);
            ProductDetailDAO daoPD = new ProductDetailDAO();
            int productDetailId = Integer.parseInt(request.getParameter("pId"));

            ProductDetail p = daoPD.getProductDetailById(productDetailId);
            request.setAttribute("product", p);
            request.getRequestDispatcher("updateproductdetail.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("homepage");
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
        processRequest(request, response);
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
        int pdId = Integer.parseInt(request.getParameter("productDetailId"));

        try {
            ProductDetailDAO pdAO = new ProductDetailDAO();
            ProductDAO pDAO = new ProductDAO();

            
            int proId = Integer.parseInt(request.getParameter("proId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int colorId = Integer.parseInt(request.getParameter("color"));
            String productImage = request.getParameter("productImage");
            int sizeId = Integer.parseInt(request.getParameter("size"));
            pdAO.updateProductDetails(pdId, proId, sizeId, colorId, quantity, productImage);

            ProductDetail productDetail = pdAO.getProductDetailById(pdId);
            int updateQuantity = productDetail.getQuantity() - quantity;

            pDAO.updateQuantityOfProductById(proId, updateQuantity);
            response.sendRedirect("update-product-detail?ed=1&pId=" + pdId);
        } catch (Exception e) {
            response.sendRedirect("update-product-detail?ed=0&pId=" + pdId);
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
