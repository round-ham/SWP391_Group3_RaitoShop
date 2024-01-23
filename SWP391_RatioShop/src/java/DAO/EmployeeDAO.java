/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
import Model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author 84338
 */
public class EmployeeDAO extends DBContext {

    public Employee getEmployeeById(int empId) {
        String sql = "select * from Employees where employeeid = " + empId;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee();
                e.setEmployeeId(rs.getInt("employeeId"));
                e.setEmployeeName(rs.getString("employeeName"));
                e.setTitle(rs.getString("title"));
                e.setGender(rs.getBoolean("gender"));
                e.setPhone(rs.getString("phone"));
                e.setAddress(rs.getString("address"));
                e.setHireDate(rs.getString("hireDate"));
                e.setSalary(rs.getInt("salary"));
                e.setBirthDate(rs.getString("birthDate"));
                return e;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
