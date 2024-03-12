/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.ProductDAO;
import dal.SaleProgramDAO;

/**
 *
 * @author lvhn1
 */
public class Sale {

    private int saleId;
    private int productId;
    private int salePrgmId;
    private int salePrcnt;

    public Sale() {
    }

    public Sale(int saleId, int productId, int salePrgmId, int salePrcnt) {
        this.saleId = saleId;
        this.productId = productId;
        this.salePrgmId = salePrgmId;
        this.salePrcnt = salePrcnt;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSalePrgmId() {
        return salePrgmId;
    }

    public void setSalePrgmId(int salePrgmId) {
        this.salePrgmId = salePrgmId;
    }

    public int getSalePrcnt() {
        return salePrcnt;
    }

    public void setSalePrcnt(int salePrcnt) {
        this.salePrcnt = salePrcnt;
    }

    public Product getProduct() {
        return new ProductDAO().getProductById(productId);
    }

    public double getNewPrice() {
        double discountPercentage = (100 - salePrcnt) / 100.0; // Convert percentage to a fraction
        double discountedAmount = getProduct().getUnitPrice() * discountPercentage;
        return discountedAmount;
    }
    
    public SaleProgram getSaleProgram() {
        return new SaleProgramDAO().getSaleProgramById(salePrgmId);
    }

}
