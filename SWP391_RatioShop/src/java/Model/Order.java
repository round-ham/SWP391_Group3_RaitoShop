/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Order {
    private int id;
    private Accounts customer;
    private Accounts employee;
    private int status;
    private String orderDate;
    private String acceptedDate;
    private String shippedDate;
    private String address;
    private double totalMoney;
    private List<OrderDetail> orderDetails;
    public Order() {
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order(int orderId, Accounts customer, Accounts employee, int status, String orderDate, String acceptedDate, String shippedDate, String address, double totalMoney) {
        this.id = orderId;
        this.customer = customer;
        this.employee = employee;
        this.status = status;
        this.orderDate = orderDate;
        this.acceptedDate = acceptedDate;
        this.shippedDate = shippedDate;
        this.address = address;
        this.totalMoney = totalMoney;
    }

    public Accounts getCustomer() {
        return customer;
    }

    public void setCustomer(Accounts customer) {
        this.customer = customer;
    }

    public Accounts getEmployee() {
        return employee;
    }

    public void setEmployee(Accounts employee) {
        this.employee = employee;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getAcceptedDate() {
        return acceptedDate;
    }

    public void setAcceptedDate(String acceptedDate) {
        this.acceptedDate = acceptedDate;
    }

    public String getShippedDate() {
        return shippedDate;
    }

    public void setShippedDate(String shippedDate) {
        this.shippedDate = shippedDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
    
}
