/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Blog;
import Model.Category;
import Model.Product;
import dal.BlogDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List; 

@WebServlet(name = "HomepageServlet", urlPatterns = {"/homepage"})
public class HomepageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomepageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomepageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cDAO = new CategoryDAO();
        ProductDAO pDAO = new ProductDAO();
        BlogDAO bDAO = new BlogDAO();

        List<Category> listC = cDAO.getCategories();
        List<Blog> listB = bDAO.getListBlog();
        List<Product> listP1 = pDAO.getPopularProducts();
        List<Product> listP2 = pDAO.getProducts();
        List<Product> listP3 = pDAO.getRandomProducts();

        request.setAttribute("listC", listC);
        request.setAttribute("listB", listB);
        request.setAttribute("listP1", listP1); //popular
        request.setAttribute("listP2", listP2); //new 
        request.setAttribute("listP3", listP3); //random
        request.setAttribute("saleList", new SaleDAO().getSalesForToday());

        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
