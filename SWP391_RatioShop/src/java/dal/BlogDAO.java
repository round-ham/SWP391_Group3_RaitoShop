/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Blog;
import Model.Blog.BlogData;
import Model.Accounts;
import java.sql.CallableStatement;
import java.sql.Timestamp;

/**
 *
 * @author Duc Hung Computer
 */
public class BlogDAO extends DBContext {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private CallableStatement cs = null;
    private ResultSet rs = null;

    public ArrayList<Blog> getListBlog() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Blog> data = new ArrayList<Blog>();
        try {
            String strSQL = "SELECT b.*, a.fullName "
                    + "FROM Blogs b "
                    + "INNER JOIN Accounts a ON b.employeeId = a.accountId";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt("blogId");
                String title = rs.getString("title");
                String blogContent = rs.getString("blogContent");
                String blogImage = rs.getString("blogImage");
                Date createDate = rs.getDate("createDate");
                Date lastUpdate = rs.getDate("lastUpdate");
                int employeeID = rs.getInt("employeeId");
                String employeeFullName = rs.getString("fullName");

                // Tạo đối tượng Blog với thông tin mới lấy từ ResultSet
                Blog b = new Blog(blogID, title, blogContent, blogImage, createDate, lastUpdate, employeeID);
                // Thiết lập fullName của Employee
                b.setEmployeeFullName(employeeFullName);

                data.add(b);
            }
        } catch (Exception e) {
            System.out.println("getListBlog:" + e.getMessage());
        }
        return data;
    }

    public Blog getBlogDetailByID(int id) {
        Blog b = new Blog();
        try {
            String strSQL = "Select b.*,a.fullName\n"
                    + "from Blogs b , Accounts a \n"
                    + "where b.employeeId = a.accountId\n"
                    + "and b.blogId = ?";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                b.setTitle(rs.getNString("title"));
                b.setBlogContent(rs.getNString("blogContent"));
                b.setBlogImage(rs.getString("blogImage"));
                b.setCreateDate(rs.getDate("createDate"));
                b.setLastUpdate(rs.getDate("lastUpdate"));
                Accounts a = new Accounts();
                a.setFullName(rs.getString("fullName"));
                b.setAccounts(a);
            }
        } catch (SQLException e) {
            System.out.println("getBlogDetailByID:" + e.getMessage());
        }
        return b;
    }

    public List<BlogData> getTwoDifferentTitlesAndIds(int id) {
        List<BlogData> blogDataList = new ArrayList<>();
        try {
            String strSQL = "SELECT TOP 2 blogId, title\n"
                    + "FROM Blogs\n"
                    + "WHERE blogId <> ?\n"
                    + "ORDER BY ABS(blogId - ?);";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            stm.setInt(2, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                String title = rs.getNString("title");
                Blog blog = new Blog(); // hoặc sử dụng đối tượng Blog từ nguồn khác
                BlogData blogData = blog.new BlogData(blogId, title);
                blogDataList.add(blogData);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ theo nhu cầu của bạn
        }
        return blogDataList;
    }

    public void updateBlogImage(String imageName, int blogId) {
        PreparedStatement stm = null;
        try {
            String strSQL = "UPDATE Blogs SET blogImage = ? WHERE blogId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setNString(1, imageName);
            stm.setInt(2, blogId);
            stm.executeUpdate();
            System.out.println("updateBlogImage:" + "sucess");
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateBlog(String title, String content, int blogId) {
        PreparedStatement stm = null;
        try {
            String strSQL = "UPDATE Blogs SET title = ?, blogContent = ?, lastUpdate = GETDATE() WHERE blogId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, title);
            stm.setString(2, content);
            stm.setInt(3, blogId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateBlog(String title, String content, String imageName, int blogId) {
        try {
            String strSQL ="UPDATE Blogs SET title = ?, blogContent = ?, blogImage = ?, lastUpdate = GETDATE() WHERE blogId = ?";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setString(1, title);
            stm.setString(2, content);
                stm.setString(3, imageName);
                stm.setInt(4, blogId);
                stm.setInt(3, blogId);
            stm.executeUpdate();
            System.out.println("updateBlog:" + "success");
        } catch (SQLException ex) {
            System.out.println("updateBlog:" + ex);
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Phương thức thêm blog
//    public void addBlog(String title, String content, int userId) {
//        try {
//            String query = "INSERT INTO Blogs (title, blogContent, createDate, lastUpdate, employeeId) VALUES (?, ?, GETDATE(), GETDATE(), ?)";
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, title);
//            ps.setString(2, content);
//            ps.setInt(3, userId);
//            ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            closeResources();
//        }
//    }
//
//    // Phương thức thêm tên ảnh blog vào cơ sở dữ liệu
//    public void addBlogImg(String imageName) {
//        try {
//            Connection conn = getConnection();
//            String query = "INSERT INTO Blogs(blogImage) VALUES (?)";
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setString(1, imageName);
//            ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            closeResources();
//        }
//    }
    public void addBlog(String title, String content, String imageName, int userId) {
        try {
            String query = "INSERT INTO Blogs (title, blogContent, blogImage, createDate, lastUpdate, employeeId) VALUES (?, ?, ?, GETDATE(), GETDATE(), ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, imageName);
            ps.setInt(4, userId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources();
        }
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBlogByID(int id) {
         try {
        String strSQL = "DELETE FROM Blogs WHERE blogId = ?";
        PreparedStatement stm = connection.prepareStatement(strSQL);
        stm.setInt(1, id);
        stm.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

}
