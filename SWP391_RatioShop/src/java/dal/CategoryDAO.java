/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
import Model.Category;
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
    public void insertCategory(String categoryName, String categoryDescription, String createDate, String lastUpdate) {
        String sql ="INSERT INTO [dbo].[Categories]\n" +
"           ([categoryName]\n" +
"           ,[categoryDescription]\n" +
"           ,[createDate]\n" +
"           ,[lastUpdate])\n" +
"     VALUES\n" +
"           (?, ?, getdate(), getdate())";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryName);
            st.setString(2, categoryDescription);
//            st.setString(3, createDate);
//            st.setString(4, lastUpdate);
           
            st.executeUpdate();
        } catch(SQLException e) {
            
        }
            
        
    }
    public void updateCategory(int categoryId, String categoryName, String categoryDescription, String lastUpdate) {
        String sql = "UPDATE [dbo].[Categories]\n" +
"   SET [categoryName] = ?\n" +
"      ,[categoryDescription] = ?\n" +
"      ,[lastUpdate] = GETDATE()\n" +
" WHERE categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryName);
            st.setString(2, categoryDescription);
            st.setInt(3, categoryId);
            st.executeUpdate();
        } catch(SQLException e) {
            
        }
        
    }
    public boolean isExist(String categoryDescription) {
        String sql = "SELECT COUNT(*) AS count FROM Categories WHERE categoryDescription = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryDescription);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            
        }
        return false;
    }
    public static void main(String[] args) {
        
    }
}
