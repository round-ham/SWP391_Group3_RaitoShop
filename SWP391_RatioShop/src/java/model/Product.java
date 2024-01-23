/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author 84338
 */
public class Product {
    private int productId;
    private Category category;
    private Brand brand;
    private String productName;
    private String productDescription;
    private int unitPrice;
    private String productImage;
    private int totalQuantity;
    private int quantitySold;
    private int discountPercentage;
    private int status;
    private String createDate;
    private String lastUpdate;

    public Product() {
    }

    public Product(int productId, Category category, Brand brand, String productName, String productDescription, int unitPrice, String productImage, int totalQuantity, int quantitySold, int discountPercentage, int status, String createDate, String lastUpdate) {
        this.productId = productId;
        this.category = category;
        this.brand = brand;
        this.productName = productName;
        this.productDescription = productDescription;
        this.unitPrice = unitPrice;
        this.productImage = productImage;
        this.totalQuantity = totalQuantity;
        this.quantitySold = quantitySold;
        this.discountPercentage = discountPercentage;
        this.status = status;
        this.createDate = createDate;
        this.lastUpdate = lastUpdate;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public int getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(int discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(String lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
    
    
}
