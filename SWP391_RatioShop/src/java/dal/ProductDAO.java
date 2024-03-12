package dal;

import Model.Color;
import Model.Product;
import Model.ProductDetail;
import Model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

    public List<Product> getProducts() {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products order by createDate desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductById(int productId) {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        SizeDAO daoS = new SizeDAO();
        ColorDAO daoCo = new ColorDAO();
        String sql = "select * from Products where productId = " + productId;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                p.setColors(daoCo.getListColorsByProductId(p.getProductId()));
                p.setSizes(daoS.getSizesByProductId(p.getProductId()));
                
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        
//        List<Product> list = new ProductDAO().getProducts();
//        for (Product x : list) {
//            System.out.println(x.getProductName());
//        }

    }

    public List<Product> getProductsByCategoryIdAndSort(int categoryId, int sort) {
        //cate = 0 -> all
        //0 new release
        //1 gia giam dan
        //2 gia tang dan
        //3 popular
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products ";
        if (categoryId != 0) {
            sql += " where categoryId =  " + categoryId;
        }
        //
        if (sort == 0) {
            sql += " order by createDate desc";
        } else if (sort == 1) {
            sql += " order by unitPrice desc";
        } else if (sort == 2) {
            sql += " order by unitPrice asc";
        }

        if (sort == 3 && categoryId == 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.[status],\n"
                    + "p.createDate, p.lastUpdate\n"
                    + "from Products p left join (\n"
                    + "select productId,sum(quantity) as [number] from OrdersDetails\n"
                    + "group by productId\n"
                    + ") n on p.productId = n.productId\n"
                    + "order by n.number desc";
        } else if (sort == 3 && categoryId != 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.discountPercentage, p.[status],\n"
                    + "p.createDate, p.lastUpdate\n"
                    + "from Products p left join (\n"
                    + "select productId,sum(quantity) as [number] from OrdersDetails\n"
                    + "group by productId\n"
                    + ") n on p.productId = n.productId\n"
                    + "where p.categoryId = " + categoryId + "\n"
                    + " order by n.number desc";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByBrandIdAndSort(int brandId, int sort) {
        //cate = 0 -> all
        //0 new release
        //1 gia giam dan
        //2 gia tang dan
        //3 popular
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products ";
        if (brandId != 0) {
            sql += " where brandId =  " + brandId;
        }
        //
        if (sort == 0) {
            sql += " order by createDate desc";
        } else if (sort == 1) {
            sql += " order by unitPrice desc";
        } else if (sort == 2) {
            sql += " order by unitPrice asc";
        }

        if (sort == 3 && brandId == 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.[status],\n"
                    + "p.createDate, p.lastUpdate\n"
                    + "from Products p left join (\n"
                    + "select productId,sum(quantity) as [number] from OrdersDetails\n"
                    + "group by productId\n"
                    + ") n on p.productId = n.productId\n"
                    + "order by n.number desc";
        } else if (sort == 3 && brandId != 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.[status],\n"
                    + "p.createDate, p.lastUpdate\n"
                    + "from Products p left join (\n"
                    + "select productId,sum(quantity) as [number] from OrdersDetails\n"
                    + "group by productId\n"
                    + ") n on p.productId = n.productId\n"
                    + "where p.brandId = " + brandId + "\n"
                    + " order by n.number desc";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByKeyword(String keyword) {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products ";
        if (!keyword.isEmpty() && (keyword != null)) {
            sql += " where productName like '%" + keyword + "%' or "
                    + " productDescription like '%" + keyword + "%'";
        }
        sql += " order by lastUpdate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getPopularProducts() {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold,  p.[status],\n"
                + "p.createDate, p.lastUpdate\n"
                + "from Products p left join (\n"
                + "select productId,sum(quantity) as [number] from OrdersDetails\n"
                + "group by productId\n"
                + ") n on p.productId = n.productId\n"
                + "order by n.number desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getRandomProductsExceptProductId(int productId) {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products where productId != " + productId
                + " order by Newid()";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getRandomProducts() {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products order by NewId()";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void insertNewProduct(int cateId, int brId, String proName, String proDes, int unitPrice, String proImg, int status) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([categoryId]\n"
                + "           ,[brandId]\n"
                + "           ,[productName]\n"
                + "           ,[productDescription]\n"
                + "           ,[unitPrice]\n"
                + "           ,[productImage]\n"
                + "           ,[totalQuantity]\n"
                + "           ,[quantitySold]\n"
                + "           ,[status]\n"
                + "           ,[createDate]\n"
                + "           ,[lastUpdate])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,0\n"
                + "           ,0\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,GETDATE())";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateId);
            st.setInt(2, brId);
            st.setString(3, proName);
            st.setString(4, proDes);
            st.setInt(5, unitPrice);
            st.setString(6, proImg);
            st.setInt(7, status);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateProduct(int productId, int cateId, int brId, String proName, String proDes, int unitPrice, String proImg, int status) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [categoryId] = ?\n"
                + "      ,[brandId] = ?\n"
                + "      ,[productName] = ?\n"
                + "      ,[productDescription] = ?\n"
                + "      ,[unitPrice] = ?\n"
                + "      ,[productImage] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[lastUpdate] = getdate()\n"
                + " WHERE productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateId);
            st.setInt(2, brId);
            st.setString(3, proName);
            st.setString(4, proDes);
            st.setInt(5, unitPrice);
            st.setString(6, proImg);
            st.setInt(7, status);
            st.setInt(8, productId);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public List<Product> getProductsOrderbyAlphabet() {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products order by productName asc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productId"));
                p.setCategory(cateDAO.getCategoryById(rs.getInt("categoryId")));
                p.setBrand(brDAO.getBrandById(rs.getInt("brandId")));
                p.setProductName(rs.getString("productName"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setUnitPrice(rs.getInt("unitPrice"));
                p.setProductImage(rs.getString("productImage"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setQuantitySold(rs.getInt("quantitySold"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void updateQuantityOfProductById(int productId, int quantityAdd) {
        int currentQuantity = new ProductDetailDAO().getQuantityOfProductById(productId);
        String sql = "update Products\n"
                + "set totalQuantity = ?\n"
                + "where productId = ?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, currentQuantity);
            st.setInt(2, productId);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Color> getListProductColorByProductId(int productId) {
        String sql = "select [colorId] from [ProductDetails] where [productId] = ?";
        List<Color> listColor = new ArrayList<>();
        ColorDAO colorDAO = new ColorDAO();
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Color color = colorDAO.getColorById(rs.getInt(1));
                listColor.add(color);
            }
        } catch (Exception e) {
            System.out.println("updateQuantityOfProductById: " + e.getMessage());
        }
        return listColor;
    }
    
    public List<Size> getListProductSizeByProductId(int productId) {
        String sql = "select [sizeId] from [ProductDetails] where [productId] = ?";
        List<Size> listSize = new ArrayList<>();
        SizeDAO sizeDAO = new SizeDAO();
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Size sz = sizeDAO.getSizeById(rs.getInt(1));
                listSize.add(sz);
            }
        } catch (Exception e) {
            System.out.println("updateQuantityOfProductById: " + e.getMessage());
        }
        return listSize;
    }
}
