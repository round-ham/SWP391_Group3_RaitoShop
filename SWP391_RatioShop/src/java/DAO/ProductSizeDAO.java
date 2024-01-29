/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.ProductSize;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import dbcontext.DBContext;

public class ProductSizeDAO extends DBContext {

    public List<ProductSize> getProductSizeByProductId(int productId) {
        String sql = "select * from ProductSize where productId = " + productId;
        ProductDAO pDAO = new ProductDAO();
        SizeDAO sDAO = new SizeDAO();
        List<ProductSize> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductSize ps = new ProductSize();
                ps.setProduct(pDAO.getProductById(rs.getInt("productId")));
                ps.setSize(sDAO.getSizeById(rs.getInt("sizeId")));
                ps.setQuantity(rs.getInt("quantity"));
                list.add(ps);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
