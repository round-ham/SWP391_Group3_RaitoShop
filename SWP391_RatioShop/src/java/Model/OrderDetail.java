/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class OrderDetail {
    private Order order;
    private ProductDetail product;
    private double unitPrice;
    private int quantity;

    public OrderDetail() {
    }

    public OrderDetail(Order order, ProductDetail product, double unitPrice, int quantity) {
        this.order = order;
        this.product = product;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ProductDetail getProduct() {
        return product;
    }

    public void setProduct(ProductDetail product) {
        this.product = product;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
