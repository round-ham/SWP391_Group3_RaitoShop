/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Accounts;
import Model.Role;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Owwl
 */
public class AccountDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private CallableStatement cs = null;
    private ResultSet rs = null;

    public void addAccount(Accounts account) {
        try {
            String query = "{CALL sp_InsertAccount(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);

            // Set parameters for the callable statement
            cs.setString(1, account.getFullName());
            cs.setString(2, account.getEmail());
            cs.setString(3, account.getPassword());
            cs.setBoolean(4, account.getGender());
            cs.setString(5, account.getAddress());
            cs.setString(6, account.getPhone());
            cs.setString(7, account.getUserImage());
            cs.setDate(8, account.getLastLogin());
            cs.setDate(9, account.getCreateDate());
            cs.setInt(10, account.getStatus());

            // Execute the stored procedure
            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public Accounts getAccountById(int accountId) {
        try {
            String query = "{CALL sp_GetAccountById(?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);
            cs.setInt(1, accountId);
            rs = cs.executeQuery();

            if (rs.next()) {
                return mapResultSetToAccount(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null;
    }

    public List<Accounts> getAllAccounts() {
        List<Accounts> accounts = new ArrayList<>();
        try {
            String query = "{CALL sp_GetAllAccounts()}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);
            rs = cs.executeQuery();

            while (rs.next()) {
                Accounts account = mapResultSetToAccount(rs);
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return accounts;
    }

    public Accounts getAccountByEmail(String email) {
        try {
            String query = "{CALL sp_GetAccountByEmail(?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);
            cs.setString(1, email);
            rs = cs.executeQuery();

            if (rs.next()) {
                return mapResultSetToAccount(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null;
    }

    public void updateAccount(Accounts account) {
        try {
            String query = "{CALL sp_UpdateAccount(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);

            // Set parameters for the callable statement
            cs.setInt(1, account.getAccountId());
            cs.setString(2, account.getFullName());
            cs.setString(3, account.getEmail());
            cs.setString(4, account.getPassword());
            cs.setBoolean(5, account.getGender());
            cs.setString(6, account.getAddress());
            cs.setString(7, account.getPhone());
            cs.setString(8, account.getUserImage());
            cs.setDate(9, account.getLastLogin());
            cs.setDate(10, account.getCreateDate());
            cs.setInt(11, account.getStatus());

            // Execute the stored procedure
            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public void deleteAccount(int accountId) {
        try {
            String query = "{CALL sp_DeleteAccount(?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);
            cs.setInt(1, accountId);
            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    private Accounts mapResultSetToAccount(ResultSet resultSet) throws SQLException {
        Accounts account = new Accounts();
        account.setAccountId(resultSet.getInt("accountId"));
        account.setFullName(resultSet.getString("fullName"));
        account.setEmail(resultSet.getString("email"));
        account.setPassword(resultSet.getString("password"));
        account.setGender(resultSet.getBoolean("gender"));
        account.setAddress(resultSet.getString("address"));
        account.setPhone(resultSet.getString("phone"));
        account.setUserImage(resultSet.getString("userImage"));
        account.setLastLogin(resultSet.getDate("lastLogin"));
        account.setCreateDate(resultSet.getDate("createDate"));
        account.setStatus(resultSet.getInt("status"));
        account.setRole(new Role(resultSet.getInt("roleId"), resultSet.getString("roleName")));
        return account;
    }

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
