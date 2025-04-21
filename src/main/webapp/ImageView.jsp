<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Page</title>
    <style>
        body {
            background-color: white;
            color: #4A4A4A;
            font-family: Arial, sans-serif;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px;
            border-bottom: 1px solid #e0e0e0;
        }
        nav a {
            margin-right: 16px;
            color: #757575;
            text-decoration: none;
        }
        nav a:hover {
            color: black;
        }
        .icons form,
        .icons a {
            display: inline-block;
            margin-left: 10px;
        }
        .icons input[type="text"] {
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .icons button {
            padding: 5px 10px;
            background-color: #eee;
            border: none;
            cursor: pointer;
        }
        .icons button:hover {
            background-color: #ddd;
        }
        main {
            padding: 16px;
            display: flex;
            flex-direction: column;
        }
        .thumbnails {
            display: flex;
            flex-direction: column;
            margin-right: 16px;
        }
        .thumbnails img {
            width: 150px;
            height: 150px;
            margin-bottom: 8px;
        }
        .main-image {
            width: 400px;
            height: 500px;
            margin-top: 60px;
            margin-left: 70px;
        }
        .product-details {
            margin-top: 16px;
            margin-left: 80px;
        }
        .rating {
            color: #FFD700;
        }
        .price {
            font-size: 24px;
            font-weight: bold;
            margin-top: 16px;
        }
        .description {
            margin-top: 16px;
            color: #707070;
        }
        .sizes select {
            padding: 8px;
            margin-top: 8px;
            margin-bottom: 16px;
        }
        .add-to-cart {
            padding: 12px 24px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }
        .info {
            margin-top: 16px;
            color: #757575;
        }
    </style>
</head>
<body>
<%
    int productId = 0;
    if (request.getParameter("id") != null) {
        productId = Integer.parseInt(request.getParameter("id"));
    }

    String name = "", image = "", description = "No description available";
    double price = 0;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        String jdbcURL = "jdbc:mysql://localhost:3306/forever";
        String dbUser = "root";
        String dbPass = "";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

        String sql = "SELECT * FROM products WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, productId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            image = rs.getString("image");
            price = rs.getDouble("price");
            description = rs.getString("description") != null ? rs.getString("description") : description;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<header>
    <div style="font-size: 24px; font-weight: bold;">FOREVER</div>
    <nav>
        <a href="Home.jsp">HOME</a>
        <a href="Collection.jsp">COLLECTION</a>
        <a href="#">ABOUT</a>
        <a href="contact.jsp">CONTACT</a>
    </nav>
    <div class="icons">
        <form action="search.jsp" method="get">
            <input type="text" name="query" placeholder="Search...">
            <button type="submit">🔍</button>
        </form>
        <a href="cart.jsp">🛒</a>
    </div>
</header>

<main>
    <div style="display: flex;">
        <div class="thumbnails">
            <img src="uploads/<%= image %>" alt="Thumbnail">
            <img src="uploads/<%= image %>" alt="Thumbnail">
            <img src="uploads/<%= image %>" alt="Thumbnail">
            <img src="uploads/<%= image %>" alt="Thumbnail">
        </div>
        <img class="main-image" src="uploads/<%= image %>" alt="<%= name %>">
        <div class="product-details">
            <h1><%= name %></h1>
            <div class="rating">
                ★★★★★ <span style="color: #999;">(122)</span>
            </div>
            <div class="price">$<%= price %></div>
            <p class="description"><%= description %></p>

            <form action="addToCart.jsp" method="post">
                <input type="hidden" name="id" value="<%= productId %>">
                <input type="hidden" name="name" value="<%= name %>">
                <input type="hidden" name="image" value="<%= image %>">
                <input type="hidden" name="price" value="<%= price %>">
                
                <label>Select Size:</label>
                <select name="size">
                    <option>S</option>
                    <option>M</option>
                    <option>L</option>
                    <option>XL</option>
                    <option>XXL</option>
                </select>
                <button class="add-to-cart" type="submit">ADD TO CART</button>
            </form>

            <div class="info">
                <p>100% Original Product.</p>
                <p>Cash on delivery is available on this product.</p>
                <p>Easy return and exchange policy within 7 days.</p>
            </div>
        </div>
    </div>
</main>
</body>
</html>
