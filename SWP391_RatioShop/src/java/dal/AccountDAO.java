
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Accounts;
import model.Customers;

/**
 *
 * @author Ruan
 */
public class AccountDAO extends DBContext {

    Connection connection = null;
    PreparedStatement stm = null;
    PreparedStatement stm2 = null;
    ResultSet rs = null;

    public Accounts checkLogin(String email, String password) {

        String sql = "select * from Accounts where [email] = ? and [password] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Accounts(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Accounts getAccount(int id) {
        String sql = "select * from Accounts where accountId = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Accounts(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Accounts getAccountByEmail(String email) {
        String sql = "select * from Accounts where [email] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Accounts(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getAidByEmail(String email) {
        String sql = "select accountId from Accounts where [email] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean checkAccountExit(String email) {

        String sql = "select * from Accounts where [email] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void newAccount(String email, String password, String username, int gender, String phone, String address) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        Customers ctm = new Customers();

        String sql = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([email]\n"
                + "           ,[password]\n"
                + "           ,[username]\n"
                + "           ,[gender]\n"
                + "           ,[status]\n"
                + "           ,[CreateDate]\n"
                + "           ,[role]";
        String sql2 = "INSERT INTO [dbo].[Customers]\n" + "([phone])\n" + "([address])\n";
        String value = "VALUES (?,?,?,?,?,?,?)";
        String value2 = "VALUES (?, ?)";
//        if ((password != null && !phone.isEmpty()) && (address == null && address.isEmpty())) {
//            sql2+="           ,[phone]\n";
//            value = "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
//        } else if ((password == null && phone.isEmpty()) && (address != null && !address.isEmpty())) {
//            sql2+="           ,[Address]\n";
//            value = "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
//        } else if((password != null && !phone.isEmpty()) && (address != null && !address.isEmpty())) {
//            sql2+= "           ,[Phone]\n"
//                + "           ,[Address]\n";
//            value = "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
//        }

        sql = sql + ")" + value;
        sql2 = sql2 +")" +value2;
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm2 = connection.prepareStatement(sql2);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, username);
            stm.setInt(4, ctm.gender);
            stm.setInt(5, 1);
            stm.setString(6, date);
            stm.setInt(7, 1);
            if ((password != null && !ctm.phone.isEmpty()) && (ctm.address == null && ctm.address.isEmpty())) {
                stm2.setString(1, ctm.phone);
            } else if ((password == null && ctm.phone.isEmpty()) && (ctm.address != null && !ctm.address.isEmpty())) {
                stm2.setString(2, ctm.address);
            } else if((password != null && !ctm.phone.isEmpty()) && (ctm.address != null && !ctm.address.isEmpty())) {
                stm2.setString(1, ctm.phone);
                stm2.setString(2, ctm.address);
            }
            stm.executeUpdate();
            stm2.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

//    public void insertAcountLoginGoogle(String email, int loginWith) {
//        LocalDate curDate = LocalDate.now();
//        String date = curDate.toString();
//
//        String sql = "INSERT INTO [dbo].[Account]\n"
//                + "           ([Email]\n"
//                + "           ,[LoginWith]\n"
//                + "           ,[Status]\n"
//                + "           ,[LastDateLogin]\n"
//                + "           ,[CreateDate]\n"
//                + "           ,[UpdateDate]\n"
//                + "           ,[roleid])"
//                + "VALUES (?,?,?,?,?,?,?)";
//        try {
//            connection = new DBContext().getConnection();
//            stm = connection.prepareStatement(sql);
//            stm.setString(1, email);
//            stm.setInt(2, loginWith);
//            stm.setInt(3, 1);
//            stm.setString(4, date);
//            stm.setString(5, date);
//            stm.setString(6, date);
//            stm.setInt(7, 1);
//            stm.executeUpdate();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    }

    public void updateLastDateLogin(String email) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        String sql = "UPDATE [dbo].[Accounts]\n"
                + "SET [lastLogin] = ?\n"
                + "WHERE [email] = ?;";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changePassword(String email, String passwword) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "SET [password] = ?,\n"
                + "WHERE [email] = ?;";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, passwword);
            stm.setString(4, email);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProfile(int accountId, String email, String username, int gender, String phone, String address) {

        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [email] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE [accountId] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, username);
            stm.setInt(3, gender);
            stm.setString(4, phone);
            stm.setString(5, address);
            stm.setInt(7, accountId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changeAvatar(String email, String userImage) {

        String sql = "UPDATE [dbo].[Accounts]\n"
                + "SET [userImage] = ?,\n"
                + "WHERE [email] = ?;";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, userImage);
            stm.setString(3, email);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

}
