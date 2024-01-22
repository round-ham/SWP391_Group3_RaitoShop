/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
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
    
    
}
