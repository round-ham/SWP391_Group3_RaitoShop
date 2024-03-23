/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author lvhn1
 */
public class SaleProgram {

    private int salePrgmId;
    private String title;
    private Date startDate;
    private Date endDate;

    public SaleProgram() {
    }

    public SaleProgram(int salePrgmId, String title, Date startDate, Date endDate) {
        this.salePrgmId = salePrgmId;
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getSalePrgmId() {
        return salePrgmId;
    }

    public void setSalePrgmId(int salePrgmId) {
        this.salePrgmId = salePrgmId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        Date now = new Date();
        if (startDate != null && endDate != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date endDateParsed = endDate;
            if (now.before(startDate)) {
                return "Waiting";
            } else if (now.after(startDate) && now.before(endDateParsed)) {
                return "Active";
            } else {
                return "Ended";
            }
        } else {
            return "Date information missing";
        }
    }

}
