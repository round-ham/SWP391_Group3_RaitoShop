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
}
