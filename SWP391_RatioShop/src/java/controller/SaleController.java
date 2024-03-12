package Controller;

import Model.Sale;
import dal.ProductDAO;
import dal.SaleDAO;
import dal.SaleProgramDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SaleController", urlPatterns = {"/sales"})
public class SaleController extends HttpServlet {

    private SaleDAO saleDAO = new SaleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        List<Sale> sales = saleDAO.getSalesBySaleProgramId(id);
        
        request.setAttribute("id", id);
        request.setAttribute("sales", sales);
        request.setAttribute("saleProgram", new SaleProgramDAO().getSaleProgramById(id));
        request.setAttribute("products", new ProductDAO().getProducts());
        request.getRequestDispatcher("sales.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("add")) {

            Sale sale = new Sale();
            sale.setProductId(Integer.parseInt(request.getParameter("productId")));
            sale.setSalePrgmId(Integer.parseInt(request.getParameter("salePrgmId")));
            sale.setSalePrcnt(Integer.parseInt(request.getParameter("salePrcnt")));

            saleDAO.addSale(sale);

            response.sendRedirect(request.getContextPath() + "/sales?id=" + sale.getSalePrgmId() + "&success");

        } else if (action.equals("update")) {
            doPut(request, response);
        } else {
            doDelete(request, response);
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Sale sale = new Sale();
        sale.setSaleId(Integer.parseInt(request.getParameter("saleId")));
        sale.setProductId(Integer.parseInt(request.getParameter("productId")));
        sale.setSalePrgmId(Integer.parseInt(request.getParameter("salePrgmId")));
        sale.setSalePrcnt(Integer.parseInt(request.getParameter("salePrcnt")));

        saleDAO.updateSale(sale);

        response.sendRedirect(request.getContextPath() + "/sales?id=" + sale.getSalePrgmId() + "&success");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int saleId = Integer.parseInt(request.getParameter("saleId"));
        saleDAO.deleteSale(saleId);

        response.sendRedirect(request.getContextPath() + "/sales?id=" + request.getParameter("salePrgmId") + "&success");
    }

}
