/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Accounts;
import Model.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class FeedbackDAO extends DBContext {

    public void removeFeedback(int feedbackId) {
        String query = "DELETE FROM [dbo].[Feedbacks]\n"
                + "      WHERE feedbackId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, feedbackId);
            ps.executeUpdate();
            System.out.println("Remove success!");
        } catch (Exception e) {
        }
    }

    public Feedback getFeedbackByProductIdCustomerId(int productId, int customerId) {
        String query = "select * from [Feedbacks] as f\n"
                + "where f.customerId = ? and f.productId = ? ";
        ProductDAO daoP = new ProductDAO();
        FeedbackDAO daoF = new FeedbackDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, customerId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Feedback(rs.getInt("feedbackId"),
                        daoP.getProductById(rs.getInt("productId")),
                        rs.getString("feedbackDescription"),
                        daoF.getAccountById(rs.getInt("customerId")),
                        rs.getDouble("rating"),
                        rs.getString("createDate"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateFeedback(String feedbackDescription, String rating, int customerId, int productId) {
        String query = "UPDATE [dbo].[Feedbacks]\n"
                + "   SET [feedbackDescription] = ?\n"
                + "      ,[rating] = ?\n"
                + "      ,[createDate] = getdate()\n"
                + " WHERE customerId = ? and productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, feedbackDescription);
            ps.setString(2, rating);
            ps.setInt(3, customerId);
            ps.setInt(4, productId);
            ps.executeUpdate();
            System.out.println("update success!");
        } catch (Exception e) {
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String query = "select * from Feedbacks as f\n";
        ProductDAO daoP = new ProductDAO();
        FeedbackDAO daoF = new FeedbackDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt("feedbackId"),
                        daoP.getProductById(rs.getInt("productId")),
                        rs.getString("feedbackDescription"),
                        daoF.getAccountById(rs.getInt("customerId")),
                        rs.getDouble("rating"),
                        rs.getString("createDate")));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Feedback> getFeedbackByProductId(int productId) {
        List<Feedback> list = new ArrayList<>();
        String query = "select * from Feedbacks as f\n"
                + "where f.productId = ?";
        ProductDAO daoP = new ProductDAO();
        FeedbackDAO daoF = new FeedbackDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getInt("feedbackId"),
                        daoP.getProductById(productId),
                        rs.getString("feedbackDescription"),
                        daoF.getAccountById(rs.getInt("customerId")),
                        rs.getDouble("rating"),
                        rs.getString("createDate")));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Accounts getAccountById(int accountId) {
        String query = "select * from Accounts as a\n"
                + "where a.accountId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Accounts acc = new Accounts();
                acc.setAccountId(rs.getInt("accountId"));
                acc.setFullName(rs.getString("fullName"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUserImage(rs.getString("userImage"));
                acc.setLastLogin(rs.getDate("lastLogin"));
                acc.setCreateDate(rs.getDate("createDate"));
                acc.setStatus(rs.getInt("status"));
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
