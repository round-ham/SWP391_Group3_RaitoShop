/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Sale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SaleDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // Method to add a new sale
    public void addSale(Sale sale) {
        try {
            String query = "INSERT INTO Sales (productId, salePrgmId, salePrcnt) VALUES (?, ?, ?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set parameters for the prepared statement
            ps.setInt(1, sale.getProductId());
            ps.setInt(2, sale.getSalePrgmId());
            ps.setInt(3, sale.getSalePrcnt());

            // Execute the query
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Method to update an existing sale
    public void updateSale(Sale sale) {
        try {
            String query = "UPDATE Sales SET productId = ?, salePrgmId = ?, salePrcnt = ? WHERE saleId = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set parameters for the prepared statement
            ps.setInt(1, sale.getProductId());
            ps.setInt(2, sale.getSalePrgmId());
            ps.setInt(3, sale.getSalePrcnt());
            ps.setInt(4, sale.getSaleId());

            // Execute the query
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Method to delete a sale
    public void deleteSale(int saleId) {
        try {
            String query = "DELETE FROM Sales WHERE saleId = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set parameter for the prepared statement
            ps.setInt(1, saleId);

            // Execute the query
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Method to retrieve all sales
    public List<Sale> getAllSales() {
        List<Sale> sales = new ArrayList<>();
        try {
            String query = "SELECT * FROM Sales";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                Sale sale = new Sale();
                sale.setSaleId(rs.getInt("saleId"));
                sale.setProductId(rs.getInt("productId"));
                sale.setSalePrgmId(rs.getInt("salePrgmId"));
                sale.setSalePrcnt(rs.getInt("salePrcnt"));
                sales.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return sales;
    }

    // Method to retrieve sales by sale program ID
    public List<Sale> getSalesBySaleProgramId(int salePrgmId) {
        List<Sale> sales = new ArrayList<>();
        try {
            String query = "SELECT * FROM Sales WHERE salePrgmId = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, salePrgmId);
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                Sale sale = new Sale();
                sale.setSaleId(rs.getInt("saleId"));
                sale.setProductId(rs.getInt("productId"));
                sale.setSalePrgmId(rs.getInt("salePrgmId"));
                sale.setSalePrcnt(rs.getInt("salePrcnt"));
                sales.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return sales;
    }

    // Method to retrieve sales for today
    public List<Sale> getSalesForToday() {
        List<Sale> sales = new ArrayList<>();
        try {
            String query = "SELECT * FROM Sales "
                    + "INNER JOIN SalePrograms ON Sales.salePrgmId = SalePrograms.salePrgmId "
                    + "WHERE CONVERT(date, GETDATE()) BETWEEN CONVERT(date, SalePrograms.startDate) "
                    + "AND CONVERT(date, SalePrograms.endDate)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Sale sale = new Sale();
                sale.setSaleId(rs.getInt("saleId"));
                sale.setProductId(rs.getInt("productId"));
                sale.setSalePrgmId(rs.getInt("salePrgmId"));
                sale.setSalePrcnt(rs.getInt("salePrcnt"));
                sales.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return sales;
    }

    // Helper method to close resources
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
