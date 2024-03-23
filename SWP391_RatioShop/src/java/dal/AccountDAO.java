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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public boolean checkAccountExit(String email) {
        String sql = "select * from Accounts where [email] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void changePassword(String emailDK, String pass) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            conn = new DBContext().getConnection();
            String sql = "UPDATE [dbo].[Accounts] "
                    + "SET [password] = ? "
                    + "WHERE [email] = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, emailDK);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Mật khẩu của tài khoản có email " + emailDK + " đã được thay đổi thành công.");
            } else {
                System.out.println("Không có tài khoản nào được tìm thấy với email " + emailDK + ".");
            }
        } catch (Exception e) {
        }
    }

    public boolean checkPassword(String email, String password) {
        try {
            String sql = "SELECT password FROM Accounts WHERE email = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true; // Mật khẩu chính xác

            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        // Mật khẩu không chính xác hoặc không tìm thấy tài khoản
        return false;
    }
    
    public boolean changePassword(String email, String password, String newPass) {
        PreparedStatement stm = null;

        try {
            String sql = "UPDATE Accounts SET password = ? WHERE email = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, email);
            ps.setString(3, password);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Password changed successfully");
                return true;
            } else {
                System.out.println("Failed to change password");
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return false;
    }
     public List<Accounts> getAccounts() {
        List<Accounts> accounts = new ArrayList<>();
        try {
            String query = "{CALL sp_GetAllAccountWithRole()}";
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

    public List<Role> getRoles() {
        List<Role> roles = new ArrayList<>();
        try {
            String query = "SELECT * FROM Roles";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Role role = new Role(rs.getInt("roleId"), rs.getString("roleName"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return roles;
    }

    public void updateAccountStatus(int accountId, int status) {
        try {
            String query = "{CALL sp_UpdateAccountStatus(?, ?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);

            cs.setInt(1, accountId);
            cs.setInt(2, status);

            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public void updateAccountRole(int accountId, int roleId) {
        try {
            String query = "{CALL sp_UpdateAccountRoles(?, ?)}";
            conn = new DBContext().getConnection();
            cs = conn.prepareCall(query);

            cs.setInt(1, accountId);
            cs.setInt(2, roleId);

            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }
}
