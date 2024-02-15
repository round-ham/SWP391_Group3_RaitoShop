package Controller;

import Model.Brand;
import Model.Category;
import Model.Color;
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

public class AddProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
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
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("homepage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductDAO pDAO = new ProductDAO();
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
            String imgGeneral = request.getParameter("productImage");
            int status = Integer.parseInt(request.getParameter("status"));
            int cateId = Integer.parseInt(request.getParameter("cate"));
            int brId= Integer.parseInt(request.getParameter("br"));
            pDAO.insertNewProduct(cateId, brId, productName, description, unitPrice, imgGeneral, status);
            response.sendRedirect("addproduct?add=1");
        } catch (Exception e) {
            response.sendRedirect("addproduct?add=0");
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
