<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 25%;
            background-color: #fff;
            padding: 20px;
        }
        .sidebar .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .sidebar .subtitle {
            color: #999;
            margin-bottom: 20px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin-bottom: 15px;
        }
        .sidebar ul li button {
            background: none;
            border: none;
            color: #333;
            cursor: pointer;
            padding: 10px;
            text-align: left;
            width: 100%;
        }
        .sidebar ul li button.active {
            background-color: #ffe4e1;
            border-radius: 5px;
        }
        .main-content {
            width: 75%;
            padding: 20px;
        }
        .logout-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .logout-btn {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .product-list {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-list h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .product-list table {
            width: 100%;
            border-collapse: collapse;
        }
        .product-list table th, .product-list table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .product-list table th {
            text-align: left;
        }
        .product-list table td img {
            width: 50px;
            height: 50px;
        }
        .product-list table td .delete-btn {
            color: red;
            cursor: pointer;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="title">FOREVER.</div>
            <div class="subtitle">ADMIN PANEL</div>
            <ul>
                <li><a href="additem.jsp"><button>Add Items</button></a></li>
                <li><a href="listitem.jsp"><button class="active">List Items</button></a></li>
                <li><a href="orders.jsp"><button>Orders</button></a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="logout-container">
                <a href="AdminLogin.jsp"><button class="logout-btn">Logout</button></a>
            </div>
            <div class="product-list">
                <h2>All Products List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/forever", "root", "");

                            String sql = "SELECT * FROM products";
                            ps = conn.prepareStatement(sql);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String image = rs.getString("image");
                                String name = rs.getString("name");
                                String category = rs.getString("category");
                                double price = rs.getDouble("price");
                    %>
                        <tr>
                            <td><img src="uploads/<%= image %>" alt="<%= name %>"></td>
                            <td><%= name %></td>
                            <td><%= category %></td>
                            <td>$<%= price %></td>
                            <td>
                                <a href="DeleteProductServlet?id=<%= id %>" 
                                   class="delete-btn"
                                   onclick="return confirm('Are you sure you want to delete this item?');">X</a>
                            </td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5'>Error loading products: " + e.getMessage() + "</td></tr>");
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (ps != null) ps.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
