/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Product;
import Model.ProductSize;
import dal.ProductDAO;
import dal.ProductSizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "ProductDetailsServlet", urlPatterns = {"/productdetails"})
public class ProductDetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO pDAO = new ProductDAO();
            ProductSizeDAO psDAO = new ProductSizeDAO();
            
            Product p = pDAO.getProductById(id);
            if (p != null) {
                List<ProductSize> listPS = psDAO.getProductSizeByProductId(id);
                List<Product> listP = pDAO.getRandomProductsExceptProductId(id);
                request.setAttribute("p", p);
                request.setAttribute("listPS", listPS);
                request.setAttribute("listP", listP);
                request.getRequestDispatcher("productdetails.jsp").forward(request, response);
            } else {
                response.sendRedirect("homepage");

            }

        } catch (Exception e) {
            response.sendRedirect("homepage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
