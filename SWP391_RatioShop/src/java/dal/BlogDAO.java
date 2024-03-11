/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
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

/**
 *
 * @author Duc Hung Computer
 */
public class BlogDAO extends DBContext {

    public ArrayList<Blog> getListBlog() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Blog> data = new ArrayList<Blog>();
        try {
            String strSQL = "select top 10 * from Blogs ";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) //vao duoc day tuc la rs.next tra ve true
            {
                int blogID = rs.getInt(1);
                String title = rs.getString(2);
                String blogContent = rs.getString(3);
                String blogImage = rs.getString(4);
                Date createDate = rs.getDate(5);
                Date lastUpdate = rs.getDate(6);
                int employeeID = rs.getInt(7);
                Blog b = new Blog(blogID, title, blogContent, blogImage, createDate, lastUpdate, employeeID);
                data.add(b);
            }
        } catch (Exception e) {
            System.out.println("getListBlog:" + e.getMessage());
        }
        return data;
    }

    public Blog getBlogByID(int id) {
        Blog b = new Blog();
        try {
            String strSQL = "SELECT [blogId]\n"
                    + "      ,[title]\n"
                    + "      ,[blogContent]\n"
                    + "      ,[blogImage]\n"
                    + "      ,[createDate]\n"
                    + "      ,[lastUpdate]\n"
                    + "      ,[employeeId]\n"
                    + "  FROM [dbo].[Blogs]\n"
                    + "  where [blogId] =?";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                b.setTitle(rs.getNString("title"));
                b.setBlogContent(rs.getNString("blogContent"));
                b.setBlogImage(rs.getString("blogImage"));
                b.setCreateDate(rs.getDate("createDate"));
                b.setLastUpdate(rs.getDate("lastUpdate"));
                b.setEmployeeID(rs.getInt("employeeId"));
            }
        } catch (SQLException e) {
            System.out.println("getBlogByID:" + e.getMessage());
        }
        return b;
    }

    public ArrayList<Blog> getTwoNearestBlog(int id) {
        ArrayList<Blog> blogDataList = new ArrayList<>();
        try {
            String strSQL = "SELECT TOP 2 blogId, title\n"
                    + "FROM Blogs\n"
                    + "Where blogId <> ?\n"
                    + "ORDER BY ABS(blogId - ?)";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            stm.setInt(2, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                String title = rs.getNString("title");
                Blog b = new Blog(blogId, title);
                blogDataList.add(b);
            }
        } catch (SQLException e) {
            System.out.println("getTwoNearestBlog:" + e.getMessage());
        }
        return blogDataList;
    }

}
