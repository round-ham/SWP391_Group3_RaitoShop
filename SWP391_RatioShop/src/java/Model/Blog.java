/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author 84338
 */
public class Blog {
    private int blogId;
    private String title;
    private String blogContent;
    private String blogImage;
    private Date createDate;
    private Date lastUpdate;
    private int employeeId;

    public Blog() {
    }
    
    public Blog(int blogId, String title){
        }

    public Blog(int blogId, String title, String blogContent, String blogImage, Date createDate, Date lastUpdate, int employeeId) {
        this.blogId = blogId;
        this.title = title;
        this.blogContent = blogContent;
        this.blogImage = blogImage;
        this.createDate = createDate;
        this.lastUpdate = lastUpdate;
        this.employeeId = employeeId;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    
    
    
}
