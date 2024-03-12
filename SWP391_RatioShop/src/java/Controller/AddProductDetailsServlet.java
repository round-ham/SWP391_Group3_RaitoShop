package Controller;

import Model.Color;
import Model.Product;
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

public class AddProductDetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductDetailsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductDetailsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            request.getRequestDispatcher("addproductdetails.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("homepage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductDetailDAO pdAO = new ProductDetailDAO();
            ProductDAO pDAO = new ProductDAO();
            int proId = Integer.parseInt(request.getParameter("proId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int colorId = Integer.parseInt(request.getParameter("color"));
            String productImage = request.getParameter("productImage");        
            int sizeId = Integer.parseInt(request.getParameter("size"));
            pdAO.insertProductDetails(proId, sizeId, colorId, quantity, productImage);
            pDAO.updateQuantityOfProductById(proId, quantity);
            response.sendRedirect("addproductdetails?add=1");
        } catch (Exception e) {
            response.sendRedirect("addproductdetails?add=0");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
