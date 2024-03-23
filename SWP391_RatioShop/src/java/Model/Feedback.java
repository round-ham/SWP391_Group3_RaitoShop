/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Feedback {
    private int feedbackId;
    private Product product;
    private String feedbackDescription;
    private Accounts customer; 
    private double rating;
    private String createdDate;

    public Feedback() {
    }

    public Feedback(int feedbackId, Product product, String feedbackDescription, Accounts customer, double rating, String createdDate) {
        this.feedbackId = feedbackId;
        this.product = product;
        this.feedbackDescription = feedbackDescription;
        this.customer = customer;
        this.rating = rating;
        this.createdDate = createdDate;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getFeedbackDescription() {
        return feedbackDescription;
    }

    public void setFeedbackDescription(String feedbackDescription) {
        this.feedbackDescription = feedbackDescription;
    }

    public Accounts getCustomer() {
        return customer;
    }

    public void setCustomer(Accounts customer) {
        this.customer = customer;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
    
}
