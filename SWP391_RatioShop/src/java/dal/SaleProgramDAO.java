/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.SaleProgram;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SaleProgramDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // Method to add a new sale program
    public void addSaleProgram(SaleProgram saleProgram) {
        try {
            String query = "INSERT INTO SalePrograms (title, startDate, endDate) VALUES (?, ?, ?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set parameters for the prepared statement
            ps.setString(1, saleProgram.getTitle());
            ps.setDate(2, new java.sql.Date(saleProgram.getStartDate().getTime()));
            ps.setString(3, saleProgram.getEndDate());

            // Execute the query
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Method to update an existing sale program
    public void updateSaleProgram(SaleProgram saleProgram) {
        try {
            String query = "UPDATE SalePrograms SET title = ?, startDate = ?, endDate = ? WHERE salePrgmId = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set parameters for the prepared statement
            ps.setString(1, saleProgram.getTitle());
            ps.setDate(2, new java.sql.Date(saleProgram.getStartDate().getTime()));
            ps.setString(3, saleProgram.getEndDate());
            ps.setInt(4, saleProgram.getSalePrgmId());

            // Execute the query
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Method to delete a sale program
    public void deleteSaleProgram(int salePrgmId) {
        try {
            String query = "DELETE FROM SalePrograms WHERE salePrgmId = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set parameter for the prepared statement
            ps.setInt(1, salePrgmId);

            // Execute the query
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    // Method to retrieve all sale programs
    public List<SaleProgram> getAllSalePrograms() {
        List<SaleProgram> salePrograms = new ArrayList<>();
        try {
            String query = "SELECT * FROM SalePrograms";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                SaleProgram saleProgram = new SaleProgram();
                saleProgram.setSalePrgmId(rs.getInt("salePrgmId"));
                saleProgram.setTitle(rs.getString("title"));
                saleProgram.setStartDate(rs.getDate("startDate"));
                saleProgram.setEndDate(rs.getString("endDate"));
                salePrograms.add(saleProgram);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return salePrograms;
    }

    // Method to retrieve a sale program by ID
    public SaleProgram getSaleProgramById(int salePrgmId) {
        SaleProgram saleProgram = null;
        try {
            String query = "SELECT * FROM SalePrograms WHERE salePrgmId = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, salePrgmId);
            rs = ps.executeQuery();

            // Process the result set
            if (rs.next()) {
                saleProgram = new SaleProgram();
                saleProgram.setSalePrgmId(rs.getInt("salePrgmId"));
                saleProgram.setTitle(rs.getString("title"));
                saleProgram.setStartDate(rs.getDate("startDate"));
                saleProgram.setEndDate(rs.getString("endDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return saleProgram;
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
