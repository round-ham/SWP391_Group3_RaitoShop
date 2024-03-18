/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Sale;
import Model.SaleProgram;
import dal.SaleDAO;
import dal.SaleProgramDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SaleProgramController", urlPatterns = {"/salePrograms"})
public class SaleProgramController extends HttpServlet {

    private SaleProgramDAO saleProgramDAO = new SaleProgramDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<SaleProgram> salePrograms = saleProgramDAO.getAllSalePrograms();
        request.setAttribute("salePrograms", salePrograms);
        request.getRequestDispatcher("salePrograms.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("add")) {

            SaleProgram saleProgram = new SaleProgram();
            saleProgram.setTitle(request.getParameter("title"));
            String startDateStr = request.getParameter("startDate");
            try {
                saleProgram.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            String endDateStr = request.getParameter("endDate");
        try {
            saleProgram.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(saleProgram.getEndDate() == null || saleProgram.getStartDate().before(saleProgram.getEndDate()))
        {

            saleProgramDAO.addSaleProgram(saleProgram);

            response.sendRedirect(request.getContextPath() + "/salePrograms?success");
        }
        else response.sendRedirect(request.getContextPath() + "/salePrograms?fail");
        
        } else if (action.equals("update")) {
            doPut(request, response);
        } else {
            doDelete(request, response);
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SaleProgram saleProgram = new SaleProgram();
        saleProgram.setSalePrgmId(Integer.parseInt(request.getParameter("salePrgmId")));
        saleProgram.setTitle(request.getParameter("title"));
        
        
        String startDateStr = request.getParameter("startDate");
        
        String endDateStr = request.getParameter("endDate");
        try {
            saleProgram.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            saleProgram.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(saleProgram.getEndDate() == null || saleProgram.getStartDate().before(saleProgram.getEndDate()))
        {
        saleProgramDAO.updateSaleProgram(saleProgram);

        response.sendRedirect(request.getContextPath() + "/salePrograms?success");
        }else response.sendRedirect(request.getContextPath() + "/salePrograms?fail");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int salePrgmId = Integer.parseInt(request.getParameter("salePrgmId"));
        saleProgramDAO.deleteSaleProgram(salePrgmId);
        
        SaleDAO saleDAO = new SaleDAO();
        List<Sale> sales = saleDAO.getSalesBySaleProgramId(salePrgmId);
        
        for (Sale sale : sales)
            saleDAO.deleteSale(sale.getSaleId());

        response.sendRedirect(request.getContextPath() + "/salePrograms?success");
    }

}
