/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;
import dal.BrandDAO;
import Model.Brand;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hung
 */
public class UpdateBrandServlet extends HttpServlet {

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
        String brandIdRaw = request.getParameter("bId");
        try {
            int brandId = Integer.parseInt(brandIdRaw);
            BrandDAO bDAO = new BrandDAO();
            Brand b = bDAO.getBrandById(brandId);
            request.setAttribute("b", b);
            request.getRequestDispatcher("updatebrand.jsp").forward(request, response);

        } catch(Exception e) {
            
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
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        try {
            BrandDAO bDAO = new BrandDAO();
            String brandName = request.getParameter("brandName");
            String brandDescription = request.getParameter("brandDescription");
            String lastUpdate = request.getParameter("lastUpdate");
            boolean check = bDAO.isExist(brandName);
            if(brandName.isEmpty() ) {
                response.sendRedirect("update-brand?add=0&bId="+brandId);

            }
            else if(check==true) {
                response.sendRedirect("update-brand?add=0&bId="+brandId);

            }
            else {
                bDAO.updateBrand(brandId, brandName, brandDescription, lastUpdate);
                response.sendRedirect("update-brand?add=1&bId="+brandId);

            }
        } catch(Exception e) {
            response.sendRedirect("update-brand?add=0&bId="+brandId);

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
