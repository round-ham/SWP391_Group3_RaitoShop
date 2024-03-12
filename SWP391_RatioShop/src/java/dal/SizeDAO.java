/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84338
 */
public class SizeDAO extends DBContext {

    public Size getSizeById(int sizeId) {
        String sql = "select * from Size where sizeId = " + sizeId;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Size s = new Size();
                s.setSizeId(rs.getInt("sizeId"));
                s.setSize(rs.getInt("size"));
                return s;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Size> getSizesByProductId(int productId) {
        String sql = "select * from Size as s, ProductDetails as pd\n"
                + "where s.sizeId = pd.sizeId and pd.productId = ?";
        List<Size> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeId(rs.getInt("sizeId"));
                s.setSize(rs.getInt("size"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Size> getSizes() {
        String sql = "select * from Size";
        List<Size> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeId(rs.getInt("sizeId"));
                s.setSize(rs.getInt("size"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
