/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Owwl
 */
public class Accounts {
    private int accountId;
    private int role;
    private String username;
    private String email;
    private String password;
    private String userImage;
    private Date lastLogin;
    private Date createDate;
    private int status;
    private int customerId;
    private int employeeId;
    
    public Accounts(){
    }

    public Accounts(int accountId, int role, String username, String email, String password, String userImage, Date lastLogin, Date createDate, int status, int customerId, int employeeId) {
        this.accountId = accountId;
        this.role = role;
        this.username = username;
        this.email = email;
        this.password = password;
        this.userImage = userImage;
        this.lastLogin = lastLogin;
        this.createDate = createDate;
        this.status = status;
        this.customerId = customerId;
        this.employeeId = employeeId;
    }

    public Accounts(String email, String password, String username) {
        this.email = email;
        this.password = password;
        this.username = username;
        
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public String toString() {
        return "Accounts{" + "accountId=" + accountId + ", role=" + role + ", username=" + username + ", email=" + email + ", password=" + password + ", userImage=" + userImage + ", lastLogin=" + lastLogin + ", createDate=" + createDate + ", status=" + status + ", customerId=" + customerId + ", employeeId=" + employeeId + '}';
    }
    
    
}
