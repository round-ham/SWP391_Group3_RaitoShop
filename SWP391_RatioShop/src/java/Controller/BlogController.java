/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Blog;
import dal.BlogDAO;
import java.util.Collections;
import static java.util.Collections.list;
import java.util.Comparator;

/**
 *
 * @author Duc Hung Computer
 */
public class BlogController extends HttpServlet {

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
                BlogDAO dao = new BlogDAO();
        List<Blog> list = dao.getListBlog();
         String sortOrder = request.getParameter("order");
        if (sortOrder == null) {
            // Nếu không có giá trị, mặc định sắp xếp từ mới đến cũ
            sortOrder = "NTO";
        }
        if (sortOrder.equals("OTN")) {
            // Sort the list from Old To New
            Collections.sort(list, Comparator.comparing(Blog::getLastUpdate));
        } else {
            // Sort the list from New To Old (default)
            Collections.sort(list, Comparator.comparing(Blog::getLastUpdate).reversed());
        }

        // Gửi yêu cầu lấy danh sách blog với thứ tự sắp xếp đã chọn

        // Lấy các tham số trang từ request
        int itemsPerPage = 6;
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }

        // Tính toán chỉ số bắt đầu và kết thúc của danh sách trên trang hiện tại
        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, list.size());

        // Tạo danh sách blog cho trang hiện tại dựa trên chỉ số bắt đầu và kết thúc
        List<Blog> currentPageBlogs = list.subList(startIndex, endIndex);

        // Tính tổng số trang dựa trên tổng số blog và số blog mỗi trang
        int totalPages = (int) Math.ceil((double) list.size() / itemsPerPage);

        // Đặt các thuộc tính vào request để chuyển đến JSP
        request.setAttribute("list", currentPageBlogs);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Chuyển hướng request và response đến trang BlogList.jsp
        request.getRequestDispatcher("views/blog.jsp").forward(request, response);
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
        processRequest(request, response);
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
