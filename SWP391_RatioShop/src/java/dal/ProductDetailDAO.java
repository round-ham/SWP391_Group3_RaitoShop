/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Color;
import Model.Product;
import Model.ProductDetail;
import Model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDetailDAO extends DBContext {
    
    public ProductDetail getProductDetailByIds(int productId, int sizeId, int colorId){
        ProductDetailDAO daoPD = new ProductDetailDAO();
        List<ProductDetail> list = daoPD.getAllProductDetails();
        
        for(ProductDetail pd : list){
            if(pd.getProduct().getProductId() == productId && pd.getColor().getColorId() == colorId && pd.getSize().getSizeId() == sizeId){
                return pd;
            }
        }
        
        return null;
    }
    
    public List<ProductDetail> getAllProductDetails() {
        String sql = "select * from ProductDetails as pd, Colors as c, Size as s\n"
                + "where pd.sizeId = s.sizeId and pd.colorId = c.colorId";
        List<ProductDetail> list = new ArrayList<>();
        ProductDAO daoP = new ProductDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ProductDetail pd  = new ProductDetail();
                pd.setId(rs.getInt("id"));
                pd.setProduct(daoP.getProductById(rs.getInt("productId")));
                pd.setColor(new Color(rs.getInt("colorId"), rs.getString("color")));
                pd.setSize(new Size(rs.getInt("sizeId"), rs.getInt("size")));
                pd.setQuantity(rs.getInt("quantity"));
                pd.setProductImage(rs.getString("productImage"));
                list.add(pd);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ProductDetail getProductDetailById(int detailId) {
        String sql = "select * from ProductDetails where id =  " + detailId;
        ProductDAO pDAO = new ProductDAO();
        SizeDAO sDAO = new SizeDAO();
        ColorDAO cDAO = new ColorDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail ps = new ProductDetail();
                ps.setId(rs.getInt("id"));
                ps.setProduct(pDAO.getProductById(rs.getInt("productId")));
                ps.setSize(sDAO.getSizeById(rs.getInt("sizeId")));
                ps.setQuantity(rs.getInt("quantity"));
                ps.setColor(cDAO.getColorById(rs.getInt("colorId")));
                ps.setProductImage(rs.getString("productImage"));
                return ps;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<ProductDetail> getProductDetailsByProductId(int productId) {
        String sql = "select * from ProductDetails where productId = " + productId + " order by colorId";
        ProductDAO pDAO = new ProductDAO();
        SizeDAO sDAO = new SizeDAO();
        ColorDAO cDAO = new ColorDAO();
        List<ProductDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail ps = new ProductDetail();
                ps.setId(rs.getInt("id"));
                ps.setProduct(pDAO.getProductById(rs.getInt("productId")));
                ps.setSize(sDAO.getSizeById(rs.getInt("sizeId")));
                ps.setQuantity(rs.getInt("quantity"));
                ps.setColor(cDAO.getColorById(rs.getInt("colorId")));
                ps.setProductImage(rs.getString("productImage"));
                list.add(ps);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDetailDAO pDAO = new ProductDetailDAO();
        List<ProductDetail> l = pDAO.getProductDetailsByProductId(2);
        List<Color> l2 = new ColorDAO().getListColorsByProductId(2);

//        for (Color c : l2) {
//            for (ProductDetail p : l) {
//                if (c.getColorId() == p.getColor().getColorId()) {
//                    System.out.println(c.getColor() + " - " + p.getSize().getSize());
//                }
//            }
//        }
//        Map<Integer, String> map = pDAO.getProductImagesOfProductById(1);
//        for (Map.Entry<Integer, String> entry : map.entrySet()) {
//            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
//        }
        System.out.println(pDAO.getQuantityOfProductById(20));
    }

    public Map<Integer, String> getProductImagesOfProductById(int productId) {
        String sql = "select distinct colorId, productImage from ProductDetails\n"
                + "where productId = ? order by colorId";
        Map<Integer, String> map = new HashMap();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("productImage") != null) {
                    map.put(rs.getInt("colorId"), rs.getString("productImage"));
                }
            }
        } catch (Exception e) {
        }
        return map;
    }

    public void updateProductDetails(int productDetailId, int proId, int sizeId, int colorId, int quantity, String proImage) {
        String query = "UPDATE [dbo].[ProductDetails]\n"
                + "   SET [productId] = ?\n"
                + "      ,[sizeId] = ?\n"
                + "      ,[colorId] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[productImage] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareCall(query);
            st.setInt(1, proId);
            st.setInt(2, sizeId);
            st.setInt(3, colorId);
            st.setInt(4, quantity);
            st.setString(5, proImage);
            st.setInt(6, productDetailId);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProductDetails(int proId, int sizeId, int colorId, int quantity, String proImage) {
        String sql = "INSERT INTO [dbo].[ProductDetails]\n"
                + "           ([productId]\n"
                + "           ,[sizeId]\n"
                + "           ,[colorId]\n"
                + "           ,[quantity]\n"
                + "           ,[productImage])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, proId);
            st.setInt(2, sizeId);
            st.setInt(3, colorId);
            st.setInt(4, quantity);
            st.setString(5, proImage);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public int getQuantityOfProductById(int productId) {
        String sql = "select sum(quantity) as [sum] from ProductDetails where productId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("sum");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

}
