/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.Date;

/**
 *
 * @author Duc Hung Computer
 */
public class Blog extends DBContext {

    private int blogID;
    private String title;
    private String blogContent;
    private String blogImage;
    private Date createDate;
    private Date lastUpdate;
    private int employeeID;

    public Blog() {
        connect();
    }

    public Blog(int blogID, String title, String blogContent, String blogImage, Date createDate, Date lastUpdate, int employeeID) {
        this.blogID = blogID;
        this.title = title;
        this.blogContent = blogContent;
        this.blogImage = blogImage;
        this.createDate = createDate;
        this.lastUpdate = lastUpdate;
        this.employeeID = employeeID;
        connect();
    }

    public Blog(int blogId, String title) {
        this.blogID = blogID;
        this.title = title;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    Connection cnn; // ket noi database

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

}
