/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dbcontext.DBContext;
import model.Blog;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext {

    public Category getCategoryById(int id) {
        String sql = "select * from categories where categoryId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCategoryId(id);
                c.setCategoryName(rs.getString("categoryName"));
                c.setCategoryDescription(rs.getString("categoryDescription"));
                c.setCreateDate(rs.getString("createDate"));
                c.setLastUpdate(rs.getString("lastUpdate"));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public List<Category> getCategories() {
        String sql = "select * from categories";
        List<Category> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);          
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("categoryId"));
                c.setCategoryName(rs.getString("categoryName"));
                c.setCategoryDescription(rs.getString("categoryDescription"));
                c.setCreateDate(rs.getString("createDate"));
                c.setLastUpdate(rs.getString("lastUpdate"));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }
//    
//    public static void main(String[] args) {
//        BlogDAO bDAO = new BlogDAO();
//        List<Blog> list = bDAO.getBlogs();
//        for (Blog i : list) {
//            System.out.println(i.getBlogId() + " " + i.getBlogImage());
//        }
//    }
}
