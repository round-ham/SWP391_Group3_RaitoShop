package Controller;

import dal.AccountDAO;
import Model.Accounts;
import Model.Role;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ManageAccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
        AccountDAO aDAO = new AccountDAO();
        List<Accounts> listA = aDAO.getAccounts();
        List<Role> roles = aDAO.getRoles();
        request.setAttribute("listA", listA);
        request.setAttribute("roles", roles);

        request.getRequestDispatcher("manageAccount.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        AccountDAO aDAO = new AccountDAO();

        if ("delete".equals(action)) { 
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            aDAO.deleteAccount(accountId);
        } else if ("update-role".equals(action)) {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            aDAO.updateAccountRole(accountId, roleId);
        } else {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            int status = Integer.parseInt(request.getParameter("status"));

            if (action != null) {
                if (action.equals("ban")) {
                    aDAO.updateAccountStatus(accountId, 0);
                } else if (action.equals("unban")) {
                    aDAO.updateAccountStatus(accountId, 1);
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/manage-account");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
