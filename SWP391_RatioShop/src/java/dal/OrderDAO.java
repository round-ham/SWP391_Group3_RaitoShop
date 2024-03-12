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
import java.util.List;
import oracle.jdbc.proxy.annotation.Pre;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

    public static void main(String[] args) {
        OrderDAO daoO = new OrderDAO();
        daoO.updateStatusOrder("2", "4");
//        AccountDAO daoA = new AccountDAO();
//        Accounts customer = daoA.getAccountById(2);
//        ProductDetailDAO dao = new ProductDetailDAO();
//        List<ProductDetail> list = dao.getAllProductDetails();
//        Cart cart = new Cart("1:6:9:1/1:8:9:1", list);
//        daoO.checkOut(customer, cart);
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
        } else
        if (status.equals("3")) {
            query = "UPDATE [dbo].[Orders]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + "      ,[shippedDate] = getdate()\n"
                    + "\n"
                    + " WHERE [dbo].[Orders].orderId = ?";
        }else {
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
        String query = "select * from Orders as o where 0 = 0\n";
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

    public Order getOrderById(int orderId) {
        String query = "select * from Orders as o\n"
                + "where o.orderId = ?";
        AccountDAO daoA = new AccountDAO();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order o = new Order(orderId,
                        daoA.getAccountById(rs.getInt("customerId")),
                        daoA.getAccountById(rs.getInt("employeeId")),
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
}
