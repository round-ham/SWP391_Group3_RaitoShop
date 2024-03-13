/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Brand;
import Model.Category;
import Model.Color;
import Model.Product;
import Model.Size;
import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ColorDAO;
import dal.ProductDAO;
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
public class UpdateProductServlet extends HttpServlet {
   
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
        String productIdRaw = request.getParameter("pId");
        try {
            int productId = Integer.parseInt(productIdRaw);
            ProductDAO daoP = new ProductDAO();
            Product p = daoP.getProductById(productId);
            request.setAttribute("p", p);
            CategoryDAO cDAO = new CategoryDAO();
            BrandDAO bDAO = new BrandDAO();
            ColorDAO coDAO = new ColorDAO();
            SizeDAO sDAO = new SizeDAO();

            List<Category> listCate = cDAO.getCategories();
            List<Brand> listBr = bDAO.getBrands();
            List<Color> listCo = coDAO.getListColors();
            List<Size> listS = sDAO.getSizes();
            //
            request.setAttribute("listCate", listCate);
            request.setAttribute("listBr", listBr);
            request.setAttribute("listCo", listCo);
            request.setAttribute("listS", listS);
            request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
        } catch (Exception e) {
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
        processRequest(request, response);
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
        //processRequest(request, response);
        int productId = Integer.parseInt(request.getParameter("productId"));
         try {
            ProductDAO pDAO = new ProductDAO();
            
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            String imgGeneral = request.getParameter("productImage");
            int status = Integer.parseInt(request.getParameter("status"));
            int cateId = Integer.parseInt(request.getParameter("cate"));
            int brId= Integer.parseInt(request.getParameter("br"));
            pDAO.updateProduct(productId, cateId, brId, productName, productName, unitPrice, imgGeneral, status);
            response.sendRedirect("update-product?add=1&pId="+productId);
        } catch (Exception e) {
            response.sendRedirect("update-product?add=0&pId="+productId);
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
