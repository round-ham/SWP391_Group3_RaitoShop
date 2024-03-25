/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Order;

import Model.Accounts;
import Model.Order;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "FilterMyOrder", urlPatterns = {"/filter-myorder"})
public class FilterMyOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO daoO = new OrderDAO();
        Accounts acc = (Accounts) request.getSession().getAttribute("account");
        List<Order> listO = daoO.getOrdersByCustomer(acc.getAccountId(), request.getParameter("status"), request.getParameter("sort"));

        PrintWriter out = response.getWriter();
        String status = "";
        for (Order o : listO) {
            switch (o.getStatus()) {
                case 1:
                    status = "Pending";
                    break;
                case 2:
                    status = "Accepted";
                    break;
                case 3:
                    status = "Delivering";
                    break;
                case 4:
                    status = "Delivered";
                    break;

                case 5:
                    status = "Success";
                    break;
                default:
                    status = "Declined";

            };
            if (o.getOrderDate() == null) {
                o.setOrderDate("");
            }
            if (o.getAcceptedDate() == null) {
                o.setAcceptedDate("");
            }
            if (o.getShippedDate() == null) {
                o.setShippedDate("");
            }
            DecimalFormat df = new DecimalFormat("#.#############");
            String data = "<tr class=\"item\">\n"
                    + "                                <td class=\"align-middle\"> " + o.getId() + "</td>\n"
                    + "                                <td class=\"align-middle\">" + o.getCustomer().getFullName() + "</td>\n"
                    + "                                <td class=\"align-middle\">" + o.getEmployee().getFullName() + "</td>\n"
                    + "                                \n"
                    + "                                <td class=\"align-middle\">\n"
                    + "                                    " + status
                    + "                                    </td>\n"
                    + "                                <td class=\"align-middle\">" + o.getOrderDate() + "</td>\n"
                    + "                                <td class=\"align-middle\">" + o.getAcceptedDate() + "</td>\n"
                    + "                                <td class=\"align-middle\">" + o.getShippedDate() + "</td>\n"
                    + "                                <td class=\"align-middle\">" + o.getAddress() + "</td>\n"
                    + "                                <td class=\"align-middle\">" + df.format(o.getTotalMoney()) + "VND</td>\n";
            if (o.getStatus() == 4) {
                data += " <td class=\"align-middle\"><a href=\"update-status-order?orderId" + o.getId() + "&status=5&previousUrl=my-order\" >\n"
                        + "                                            <button class=\"btn btn-sm btn-primary\"\n"
                        + "\n"
                        + "                                                    style=\"background-color: green\"\n"
                        + "                                                    >\n"
                        + "                                                <i class=\"fa fa-check\"></i>\n"
                        + "                                            </button></a></td>";

            } else {
                data += "<td></td>";
            }
            if (o.getStatus() == 1) {
                data += "<td class=\"align-middle\"><a href=\"update-status-order?orderId=" + o.getId() + "&status=0&previousUrl=my-order\" >\n"
                        + "                                            <button class=\"btn btn-sm btn-primary\" style=\"background-color: red\"\n"
                        + "                                                    ><i class=\"fa fa-remove\"></i>\n"
                        + "                                            </button></a>\n"
                        + "                                    </td>";
            } else {
                data += "<td></td>";
            }
            data += "<td class=\"align-middle\"><a href=\"my-order-detail?orderId=" + o.getId() + "\" >\n"
                    + "                                            \n"
                    + "                                                    View detail\n"
                    + "                                                </a></td>                            </tr>";
            out.print(data);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
