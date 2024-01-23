package dal;

import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84338
 */
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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        List<Product> list = new ProductDAO().getProductsByKeyword("a");
        for (Product p : list) {
            System.out.println(p.getProductId() + " " + p.getProductName());
        }

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
            sql += " order by (unitPrice - discountPercentage * 0.01 * unitPrice) desc";
        } else if (sort == 2) {
            sql += " order by (unitPrice - discountPercentage * 0.01 * unitPrice) asc";
        }

        if (sort == 3 && categoryId == 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.discountPercentage, p.[status],\n"
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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
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
            sql += " order by (unitPrice - discountPercentage * 0.01 * unitPrice) desc";
        } else if (sort == 2) {
            sql += " order by (unitPrice - discountPercentage * 0.01 * unitPrice) asc";
        }

        if (sort == 3 && brandId == 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.discountPercentage, p.[status],\n"
                    + "p.createDate, p.lastUpdate\n"
                    + "from Products p left join (\n"
                    + "select productId,sum(quantity) as [number] from OrdersDetails\n"
                    + "group by productId\n"
                    + ") n on p.productId = n.productId\n"
                    + "order by n.number desc";
        } else if (sort == 3 && brandId != 0) {
            sql = "select p.productId, p.categoryId, p.brandId, p.productName, p.productDescription,\n"
                    + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.discountPercentage, p.[status],\n"
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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
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
                + "p.unitPrice, p.productImage, p.totalQuantity, p.quantitySold, p.discountPercentage, p.[status],\n"
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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getSaleProducts() {
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brDAO = new BrandDAO();
        List<Product> list = new ArrayList();
        String sql = "select * from Products order by discountPercentage desc";

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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
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
        String sql = "select * from Products where productId != " + productId + " order by newId()";

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
                p.setDiscountPercentage(rs.getInt("discountPercentage"));
                p.setStatus(rs.getInt("status"));
                p.setCreateDate(rs.getString("createDate"));
                p.setLastUpdate(rs.getString("lastUpdate"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

}
