/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Blog;
import dal.BlogDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
/**
 *
 * @author Duc Hung Computer
 */
public class AddBlogController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBlogController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("addBlog.jsp").forward(request, response);
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
//        HttpSession session = request.getSession();
//        int userId = (int) request.getSession().getAttribute("userId");
//        BlogDAO blogdao = new BlogDAO();
//        ServletContext context = getServletContext();
//        String projectPath = context.getRealPath("/");
//        String title = request.getParameter("title");
//        String content = request.getParameter("content");
//        Part imagePart = request.getPart("image");
//        if (title == null || title.isEmpty()) {
//            request.setAttribute("titleErrorMessage", "Title không được để trống");
//        }
//
//        // Kiểm tra xem content có dữ liệu không
//        if (content == null || content.isEmpty()) {
//            request.setAttribute("contentErrorMessage", "Content không được để trống");
//        }
//
////         Kiểm tra xem imagePart có dữ liệu không
//        if (imagePart == null || imagePart.getSize() <= 0) {
//            request.setAttribute("imageErrorMessage", "Vui lòng chọn một ảnh");
//        }
//
//        // Nếu có lỗi, chuyển hướng lại trang addBlog.jsp và hiển thị thông báo lỗi
//        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
//            request.getRequestDispatcher("addBlog.jsp").forward(request, response);
//            return; // Kết thúc phương thức sau khi chuyển hướng
//        }
//        // Lưu thông tin blog vào database
//        blogdao.addBlog(title, content,userId);
//        // Thêm ảnh cho blog nếu có
//
//        String imageName = null;
//        if (imagePart != null && imagePart.getSize() > 0) {
//            imageName = imagePart.getSubmittedFileName();
//            String imagePath = "img/blog/" + imageName;
//            imagePart.write(projectPath + imagePath);
//            blogdao.addBlogImg(imageName); // Thêm tên ảnh vào database
//        }
//        request.setAttribute("success", "Add success");
//        response.sendRedirect("manageblog");

        HttpSession session = request.getSession();
        int userId = (int) request.getSession().getAttribute("userId");
        BlogDAO blogdao = new BlogDAO();
        ServletContext context = getServletContext();
        String projectPath = context.getRealPath("/");
        List<Part> Parts = (List<Part>) request.getParts();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        if (title == null || title.isEmpty()) {
            request.setAttribute("titleErrorMessage", "Title không được để trống");
        }

        // Kiểm tra xem content có dữ liệu không
        if (content == null || content.isEmpty()) {
            request.setAttribute("contentErrorMessage", "Content không được để trống");
        }
//           Kiểm tra xem imagePart có dữ liệu không

        // Nếu có lỗi, chuyển hướng lại trang addBlog.jsp và hiển thị thông báo lỗi
        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
            request.getRequestDispatcher("addBlog.jsp").forward(request, response);
            return; // Kết thúc phương thức sau khi chuyển hướng
        }
//        blogdao.addBlog(title, content, userId);
        //add image file
        for (Part part : Parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null) {
                // Cập nhật tên ảnh trong cơ sở dữ liệu
                part.write(projectPath + "img\\blog\\" + fileName);
//                blogdao.addBlogImg(fileName);
                blogdao.addBlog(title, content, fileName, userId);
            }
        }
        //
        request.setAttribute("success", "Add success");
        List<Blog> list = blogdao.getListBlog();
        request.setAttribute("list", list);
        request.getRequestDispatcher("views/blogManagement.jsp").forward(request, response);
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
