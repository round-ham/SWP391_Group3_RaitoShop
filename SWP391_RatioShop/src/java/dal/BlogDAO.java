/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84338
 */
public class BlogDAO extends DBContext{
    public List<Blog> getBlogs() {
      
        String sql = "select * from Blogs order by lastUpdate desc";
        List<Blog> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                Blog b = new Blog();
                b.setBlogId(rs.getInt("blogId"));
                b.setTitle(rs.getString("title"));
                b.setBlogImage(rs.getString("blogImage"));
                b.setBlogContent(rs.getString("blogContent"));
                b.setCreateDate(rs.getString("createDate"));
                b.setLastUpdate(rs.getString("lastUpdate"));
                b.setEmployeeId(rs.getInt("employeeId"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        List<Blog> list = new BlogDAO().getBlogs();
        for (Blog blog : list) {
            System.out.println(blog.getTitle());
        }
    }
}
