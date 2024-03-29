/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;
import dal.CategoryDAO;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Hung
 */
public class ManageCategoryServlet extends HttpServlet {

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
            CategoryDAO daoC = new CategoryDAO();
            List<Category> listC = daoC.getCategories();
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("manageCategory.jsp").forward(request, response);
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
       String action = request.getParameter("action");
        if (action.equals("add")) {
            try {
                CategoryDAO bDAO = new CategoryDAO();
                String categoryName = request.getParameter("categoryName");
                String categoryDescription = request.getParameter("categoryDescription");
                String createDate = request.getParameter("createDate");
                String lastUpdate = request.getParameter("lastUpdate");
                bDAO.insertCategory(categoryName, categoryDescription, createDate, lastUpdate);
                response.sendRedirect(request.getContextPath() + "/manage-category?success");

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } if (action.equals("update")) {
            doPut(request, response);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        try {
            CategoryDAO bDAO = new CategoryDAO();
            String categoryName = request.getParameter("categoryName");
            String categoryDescription = request.getParameter("categoryDescription");
            String lastUpdate = request.getParameter("lastUpdate");
            bDAO.updateCategory(categoryId, categoryName, categoryDescription, lastUpdate);
            response.sendRedirect(request.getContextPath() + "/manage-category?success");

        } catch (Exception ex) {
            ex.printStackTrace();
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
