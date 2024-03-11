/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84338
 */
public class BrandDAO extends DBContext{
    public Brand getBrandById(int id) {
        String sql = "select * from brands where brandId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand b = new Brand();
                b.setBrandId(id);
                b.setBrandName(rs.getString("brandName"));
                b.setBrandDescription(rs.getString("brandDescription"));
                b.setCreateDate(rs.getString("createDate"));
                b.setLastUpdate(rs.getString("lastUpdate"));
                return b;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public List<Brand> getBrands() {
        String sql = "select * from brands";
        List<Brand> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
          
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandId(rs.getInt("brandId"));
                b.setBrandName(rs.getString("brandName"));
                b.setBrandDescription(rs.getString("brandDescription"));
                b.setCreateDate(rs.getString("createDate"));
                b.setLastUpdate(rs.getString("lastUpdate"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public void insertBrand(String brandName, String brandDescription, String createDate, String lastUpdate) {
        String sql = "INSERT INTO [dbo].[Brands]\n" +
"           ([brandName]\n" +
"           ,[brandDescription]\n" +
"           ,[createDate]\n" +
"           ,[lastUpdate])\n" +
"     VALUES\n" +
"           (?, ?, getdate(), getdate())";
        try { 
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brandName);
            st.setString(2, brandDescription);
//            st.setString(3, createDate);
//            st.setString(4, lastUpdate);
           
            st.executeUpdate();
        } catch(SQLException e) {
            
        }
    }
    public void updateBrand(int brandId, String brandName, String brandDescription, String lastUpdate) {
     String sql = "UPDATE [dbo].[Brands]\n" +
    "   SET [brandName] = ?\n" +
    "      ,[brandDescription] = ?\n" +
   
    "      ,[lastUpdate] = GETDATE()\n" +
    " WHERE brandId = ?";
        try { 
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brandName);
            st.setString(2, brandDescription);
//            st.setString(3, lastUpdate);
            st.setInt(3, brandId);
            st.executeUpdate();
        } catch(SQLException e) {
            
        }
    }
    public boolean isExist(String brandName) {
        String sql = "SELECT COUNT(*) AS count FROM brands WHERE brandName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brandName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
    }
    return false;
}

}
