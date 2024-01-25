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
public class Employees {
    private int employeeId;
    private String employeeName;
    private String title;
    public int gender;
    private String phone;
    private String address;
    private Date hireDate;
    private int salary;
    private Date birthDate;

    public Employees() {
    }
    
    public Employees(int employeeId, String employeeName, String title, int gender, String phone, String address, Date hireDate, int salary, Date birthDate) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.title = title;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.hireDate = hireDate;
        this.salary = salary;
        this.birthDate = birthDate;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    @Override
    public String toString() {
        return "Employees{" + "employeeId=" + employeeId + ", employeeName=" + employeeName + ", title=" + title + ", gender=" + gender + ", phone=" + phone + ", address=" + address + ", hireDate=" + hireDate + ", salary=" + salary + ", birthDate=" + birthDate + '}';
    }
    
    
}
