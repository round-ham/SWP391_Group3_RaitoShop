package dal;

import Model.Color;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ColorDAO extends DBContext {

    public Color getColorById(int colorId) {
        String sql = "select * from Colors where colorId = " + colorId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Color c = new Color();
                c.setColorId(rs.getInt("colorId"));
                c.setColor(rs.getString("color"));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Color> getListColorsByProductId(int productId) {
        String sql = "select * from Colors\n"
                + "where colorId in (select distinct colorId "
                + "from ProductDetails where productId = ?\n"
                + ")";
        List<Color> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = new Color();
                c.setColorId(rs.getInt("colorId"));
                c.setColor(rs.getString("color"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        List<Color> list = new ColorDAO().getListColorsByProductId(1);
        for (Color c : list) {
            System.out.println(c.getColor());
        }

    }

    public List<Color> getListColors() {
        String sql = "select * from Colors";
        List<Color> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = new Color();
                c.setColorId(rs.getInt("colorId"));
                c.setColor(rs.getString("color"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
