/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Accounts;
import Model.Cart;
import Model.Item;
import Model.Order;
import Model.OrderDetail;
import Model.ProductDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

    public static void main(String[] args) {
        OrderDAO daoO = new OrderDAO();
        for (OrderDetail o : daoO.getOrderDetailByOrder(1)) {
            System.out.println(o.getProduct().getProduct().getProductName());
        }
    }

    public Accounts getAccountById(int accountId) {
        String query = "select * from Accounts as a\n"
                + "where a.accountId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Accounts acc = new Accounts();
                acc.setAccountId(rs.getInt("accountId"));
                acc.setFullName(rs.getString("fullName"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                acc.setUserImage(rs.getString("userImage"));
                acc.setLastLogin(rs.getDate("lastLogin"));
                acc.setCreateDate(rs.getDate("createDate"));
                acc.setStatus(rs.getInt("status"));
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> getOrdersByCustomer(int customerId, String status, String sort) {
        OrderDAO daoO = new OrderDAO();

        if (daoO.getAccountById(customerId) != null) {
            List<Order> listO = new ArrayList<>();

            String query = "select * from Orders as o \n"
                    + "where customerId = ? ";
            String temp = "";
            if (status != null) {
                if (!status.equals("-1")) {
                    if (status.trim().length() > 0) {
                        temp = "and o.status = " + status + "\n";
                        query += temp;
                    }
                }
            }

            if (sort != null || sort.trim().length() > 0) {
                if (sort.equals("1")) {
                    temp = "order by o.orderDate asc\n";
                } else if (sort.equals("2")) {
                    temp = "order by o.orderDate desc\n";
                } else if (sort.equals("3")) {
                    temp = "order by o.acceptedDate asc\n";
                } else if (sort.equals("4")) {
                    temp = "order by o.acceptedDate desc\n";
                } else if (sort.equals("5")) {
                    temp = "order by o.shippedDate asc\n";
                } else if (sort.equals("6")) {
                    temp = "order by o.shippedDate desc\n";
                }
            } else {
                temp = "ORDER BY o.orderId desc \n";
            }
            query += temp;
            try {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setInt(1, customerId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Order o = new Order(rs.getInt("orderId"),
                            daoO.getAccountById(rs.getInt("customerId")),
                            daoO.getAccountById(rs.getInt("employeeId")),
                            rs.getInt("status"),
                            rs.getString("orderDate"),
                            rs.getString("acceptedDate"),
                            rs.getString("shippedDate"),
                            rs.getString("address"),
                            rs.getDouble("totalMoney"));
//                o.setOrderDetails(daoO.getOrderDetailByOrder(o.getId()));
                    listO.add(o);
                }
            } catch (Exception e) {
            }

            return listO;
        } else {
            return null;
        }
    }

    public void addFeedBack(int productId, String feedBackDescription, int customerId, double rating) {
        String query = "INSERT INTO [dbo].[Feedbacks]\n"
                + "           ([productId]\n"
                + "           ,[feedbackDescription]\n"
                + "           ,[customerId]\n"
                + "           ,[rating]\n"
                + "           ,[createDate])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,getdate())";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setString(2, feedBackDescription);
            ps.setInt(3, customerId);
            ps.setDouble(4, rating);
            ps.executeUpdate();
            System.out.println("add feedback success");
        } catch (Exception e) {
        }
    }

    public List<Order> getAllOrder() {
        String query = "select * from Orders";
        List<Order> list = new ArrayList<>();
        AccountDAO daoA = new AccountDAO();
        OrderDAO daoO = new OrderDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("orderId"),
                        daoA.getAccountById(rs.getInt("customerId")),
                        daoA.getAccountById(rs.getInt("employeeId")),
                        rs.getInt("status"),
                        rs.getString("orderDate"),
                        rs.getString("acceptedDate"),
                        rs.getString("shippedDate"),
                        rs.getString("address"),
                        rs.getDouble("totalMoney"));
//                o.setOrderDetails(daoO.getOrderDetailByOrder(o.getId()));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateStatusOrder(String orderId, String status) {
        String query = "";
        if (status.equals("2")) {
            query = "UPDATE [dbo].[Orders]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + "      ,[acceptedDate] = getdate()\n"
                    + "\n"
                    + " WHERE [dbo].[Orders].orderId = ?";
        } else if (status.equals("3")) {
            query = "UPDATE [dbo].[Orders]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + "      ,[shippedDate] = getdate()\n"
                    + "\n"
                    + " WHERE [dbo].[Orders].orderId = ?";
        } else {
            query = "UPDATE [dbo].[Orders]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + " WHERE [dbo].[Orders].orderId = ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, orderId);
            ps.executeUpdate();
            System.out.println("update status success!");
        } catch (Exception e) {
        }
    }

    public List<Order> getAllOrder(String status, String sort) {
        String query = "select o.*, a.fullName as employeeName, a.accountId as employeeId,  b.fullName as customerName, b.accountId as customerId\n"
                + "from Orders o\n"
                + "left join Accounts a\n"
                + "on o.employeeId = a.accountId \n"
                + "left join Accounts b\n"
                + "on o.customerId = b.accountId where 0 = 0\n";
        String temp = "";
        if (!status.equals("-1")) {
            if (status != null || status.trim().length() > 0) {
                temp = "and o.status = " + status + "\n";
                query += temp;
            }
        }
        if (sort != null || sort.trim().length() > 0) {
            if (sort.equals("1")) {
                temp = "order by o.orderDate asc\n";
            } else if (sort.equals("2")) {
                temp = "order by o.orderDate desc\n";
            } else if (sort.equals("3")) {
                temp = "order by o.acceptedDate asc\n";
            } else if (sort.equals("4")) {
                temp = "order by o.acceptedDate desc\n";
            } else if (sort.equals("5")) {
                temp = "order by o.shippedDate asc\n";
            } else if (sort.equals("6")) {
                temp = "order by o.shippedDate desc\n";
            }
        } else {
            temp = "ORDER BY o.orderId desc \n";
        }
        query += temp;

        List<Order> list = new ArrayList<>();
        AccountDAO daoA = new AccountDAO();
        OrderDAO daoO = new OrderDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Accounts customer = new Accounts();
                customer.setAccountId(rs.getInt("customerId"));
                customer.setFullName(rs.getString("customerName"));

                Accounts employee = new Accounts();
                employee.setAccountId(rs.getInt("employeeId"));
                employee.setFullName(rs.getString("employeeName"));

                Order o = new Order(rs.getInt("orderId"),
                        customer,
                        employee,
                        rs.getInt("status"),
                        rs.getString("orderDate"),
                        rs.getString("acceptedDate"),
                        rs.getString("shippedDate"),
                        rs.getString("address"),
                        rs.getDouble("totalMoney"));
//                o.setOrderDetails(daoO.getOrderDetailByOrder(o.getId()));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Order getOrderById(int orderId) {
        String query = "select * from Orders as o\n"
                + "where o.orderId = ?";
        OrderDAO daoO = new OrderDAO();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order o = new Order(orderId,
                        daoO.getAccountById(rs.getInt("customerId")),
                        daoO.getAccountById(rs.getInt("employeeId")),
                        rs.getInt("status"),
                        rs.getString("orderDate"),
                        rs.getString("acceptedDate"),
                        rs.getString("shippedDate"),
                        rs.getString("address"),
                        rs.getDouble("totalMoney"));

                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDetail> getOrderDetailByOrder(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from OrdersDetails as od\n"
                + "where od.orderId = ?";
        ProductDetailDAO daoPD = new ProductDetailDAO();
        OrderDAO daoO = new OrderDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int colorId = rs.getInt("colorId");
                ProductDetail pd = daoPD.getProductDetailByIds(productId, sizeId, colorId);
                OrderDetail od = new OrderDetail(daoO.getOrderById(orderId),
                        pd, rs.getDouble("unitPrice"), rs.getInt("quantity"));
                list.add(od);

            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addOrderDetails(int orderId, int productId, double price, int quantity, int colorId, int sizeId) {
        String query = "INSERT INTO [dbo].[OrdersDetails]\n"
                + "           ([orderId]\n"
                + "           ,[productId]\n"
                + "           ,[unitPrice]\n"
                + "           ,[quantity]\n"
                + "           ,[colorId]\n"
                + "           ,[sizeId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setInt(5, colorId);
            ps.setInt(6, sizeId);
            ps.executeUpdate();
            System.out.println("adding orderDetail success!");
        } catch (Exception e) {
        }
    }

    public int addOrder(Accounts customer, Cart cart) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([customerId]\n"
                + "           ,[employeeId]\n"
                + "           ,[status]\n"
                + "           ,[orderDate]\n"
                + "           ,[address]\n"
                + "           ,[totalMoney])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,getdate()\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customer.getAccountId());
            ps.setInt(2, 2);
            ps.setInt(3, 1);
            ps.setDouble(5, cart.getTotalMoney());
            ps.setString(4, customer.getAddress());
            System.out.println(customer.getAddress() + "||||" + customer.getAccountId());
            int status = ps.executeUpdate();
            System.out.println("Add order success!");
            return status;
        } catch (Exception e) {
        }
        return 0;
    }

    public void checkOut(Accounts customer, Cart cart) {
        if (cart.getItems().isEmpty()) {
            System.out.println("Cart empty!");
            return;
        } else {
            if (customer == null) {
                System.out.println("You must login to checkOut!");
            } else {
                // add new order
                OrderDAO daoO = new OrderDAO();
                try {

                    int status = daoO.addOrder(customer, cart);
                    if (status != 0) {
                        // get customer order id
                        String query = "select top (1) * from Orders as o\n"
                                + "order by o.orderId desc";
                        PreparedStatement ps2 = connection.prepareStatement(query);
                        ResultSet rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            // add order detail

                            for (Item orderDetail : cart.getItems()) {
                                daoO.addOrderDetails(rs2.getInt("orderId"),
                                        orderDetail.getProduct().getProduct().getProductId(),
                                        orderDetail.getPrice(),
                                        orderDetail.getQuantity(),
                                        orderDetail.getProduct().getColor().getColorId(),
                                        orderDetail.getProduct().getSize().getSizeId());
                            }

                        }
                    }
                } catch (Exception e) {
                }

            }

        }
    }
    
    public List<Order> getAvailableShippingOrder() {
        String query = "select * from Orders WHERE status = 2 AND shipperId is null";
        List<Order> list = new ArrayList<>();
        AccountDAO daoA = new AccountDAO();
        OrderDAO daoO = new OrderDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("orderId"),
                        daoA.getAccountById(rs.getInt("customerId")),
                        daoA.getAccountById(rs.getInt("employeeId")),
                        rs.getInt("status"),
                        rs.getString("orderDate"),
                        rs.getString("acceptedDate"),
                        rs.getString("shippedDate"),
                        rs.getString("address"),
                        rs.getDouble("totalMoney"),
                        rs.getString("note"));
                o.setOrderDetails(daoO.getOrderDetailByOrder(o.getId()));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Order> getOrdersByShipping(int shipperId) {
        String query = "select * from Orders WHERE  shipperId ="+shipperId;
        List<Order> list = new ArrayList<>();
        AccountDAO daoA = new AccountDAO();
        OrderDAO daoO = new OrderDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("orderId"),
                        daoA.getAccountById(rs.getInt("customerId")),
                        daoA.getAccountById(rs.getInt("employeeId")),
                        rs.getInt("status"),
                        rs.getString("orderDate"),
                        rs.getString("acceptedDate"),
                        rs.getString("shippedDate"),
                        rs.getString("address"),
                        rs.getDouble("totalMoney"),
                        rs.getString("note"));
                 o.setOrderDetails(daoO.getOrderDetailByOrder(o.getId()));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void SetShipping(int orderId, int shipperId) {
        String sql = "update  Orders set Orders.shipperId = ? , Orders.[status] = 3\n"
                + "where Orders.orderId = ?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, shipperId);
            st.setInt(2, orderId);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }
     public void SetShippingStatusAndNote(int orderId,int status,String note) {
        String sql = "update  Orders set Orders.[note]=? , Orders.[status] = ?\n"
                + "where Orders.orderId = ?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, note);
            st.setInt(2, status);
            st.setInt(3, orderId);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }
public void setShippingDate(int orderId) {
        String sql = "update  Orders set  Orders.[shippedDate] = ?\n"
                + "where Orders.orderId = ?";
            java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setDate(1, date);
            st.setInt(2, orderId);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }
    public void RemoveShipping(int orderId) {
        String sql = "update  Orders set Orders.shipperId = ? , Orders.[status] = 2\n"
                + "where Orders.orderId = ?";

        try {
            PreparedStatement st = connection.prepareCall(sql);
            
            st.setNull(1, java.sql.Types.INTEGER);
            st.setInt(2, orderId);
            st.executeUpdate();
        } catch (Exception e) {
        }

    }
}
