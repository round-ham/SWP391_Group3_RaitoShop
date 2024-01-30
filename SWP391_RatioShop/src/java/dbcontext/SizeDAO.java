/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dbcontext.DBContext;

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

}
