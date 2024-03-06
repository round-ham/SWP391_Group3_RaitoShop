/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Brand;
import Model.Category;
import Model.Product;
import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int choice = 0;
            String sort = request.getParameter("sort");

            //
            ProductDAO pDAO = new ProductDAO();
            CategoryDAO cDAO = new CategoryDAO();
            BrandDAO bDAO = new BrandDAO();
            List<Product> listP = null;

            if (sort == null) {
                listP = pDAO.getProducts();
                request.setAttribute("isLoad", true);
            } else {
                //format categoryId/brandId - kieu sort
                if (sort.contains("categoryId")) {
                    int sortParse = Integer.parseInt(sort.substring(sort.length() - 1));
                    choice = sortParse;

                    int firstIndex = 10;
                    int secondIndex = sort.indexOf("-");
                    int categoryIdParse = Integer.parseInt(sort.substring(firstIndex, secondIndex));
                    listP = pDAO.getProductsByCategoryIdAndSort(categoryIdParse, sortParse);

                    Category c = cDAO.getCategoryById(categoryIdParse);
                    request.setAttribute("cate", c);

                } else {
                    int sortParse = Integer.parseInt(sort.substring(sort.length() - 1));
                    choice = sortParse;
                    int firstIndex = 7;
                    int secondIndex = sort.indexOf("-");
                    int brandIdParse = Integer.parseInt(sort.substring(firstIndex, secondIndex));
                    listP = pDAO.getProductsByBrandIdAndSort(brandIdParse, sortParse);

                    Brand b = bDAO.getBrandById(brandIdParse);
                    request.setAttribute("br", b);

                }

            }
            List<Category> listC = cDAO.getCategories();
            List<Brand> listB = bDAO.getBrands();
            //
            request.setAttribute("listC", listC);
            request.setAttribute("listB", listB);
            request.setAttribute("listP", listP);
            request.setAttribute("choice", choice);
            request.getRequestDispatcher("product.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("homepage");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String keyword = request.getParameter("keyword");
            ProductDAO pDAO = new ProductDAO();
            CategoryDAO cDAO = new CategoryDAO();
            BrandDAO bDAO = new BrandDAO();
            List<Product> listP = pDAO.getProductsByKeyword(keyword);
            
            //
            List<Category> listC = cDAO.getCategories();
            List<Brand> listB = bDAO.getBrands();
            request.setAttribute("listC", listC);
            request.setAttribute("listB", listB);
            request.setAttribute("listP", listP);
            if (keyword != null && !keyword.isEmpty())
                request.setAttribute("keyword", keyword);

            request.getRequestDispatcher("product.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("homepage");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
