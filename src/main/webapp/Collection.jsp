
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forever Collection</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            display: flex;
            gap: 20px;
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
        .filters {
            width: 20%;
            border: 1px solid #ccc;
            padding: 16px;
            height: fit-content;
        }
        .filters h3 {
            margin-bottom: 10px;
            font-size: 18px;
        }
        .filters label {
            display: block;
            margin-bottom: 8px;
        }
        .collection {
            flex: 1;
        }
        .collection h2 {
            margin-bottom: 20px;
            font-size: 22px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product {
            width: calc(25% - 20px);
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            background-color: #fafafa;
            text-align: center;
            transition: transform 0.2s ease;
        }
        .product:hover {
            transform: scale(1.03);
        }
        .product img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .product h3 {
            font-size: 16px;
            margin-bottom: 5px;
        }
        .product p {
            font-size: 14px;
            font-weight: bold;
            color: #444;
        }

        /* Responsive */
        @media (max-width: 1000px) {
            .product {
                width: calc(33.33% - 20px);
            }
        }
        @media (max-width: 700px) {
            .container {
                flex-direction: column;
            }
            .filters {
                width: 100%;
                margin-bottom: 20px;
            }
            .product {
                width: calc(50% - 10px);
            }
        }
        @media (max-width: 500px) {
            .product {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<header>
    <div style="font-size: 24px; font-weight: bold;">FOREVER</div>
    <nav>
        <a href="Home.jsp">HOME</a>
        <a href="Collection.jsp">COLLECTION</a>
        <a href="#">ABOUT</a>
        <a href="contact.jsp">CONTACT</a>
    </nav>
    <div class="icons">
        <form action="Collection.jsp" method="get">
            <input type="text" name="query" placeholder="Search..." value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>">
            <button type="submit">🔍</button>
        </form>
        <a href="cart.jsp">🛒</a>
    </div>
</header>

<div class="container">
    <aside class="filters">
        <form method="get" action="Collection.jsp">
            <h3>Category</h3>
            <label><input type="checkbox" name="category" value="Men" <%= "Men".equals(request.getParameter("category")) ? "checked" : "" %>> Men</label>
            <label><input type="checkbox" name="category" value="Women" <%= "Women".equals(request.getParameter("category")) ? "checked" : "" %>> Women</label>
            <label><input type="checkbox" name="category" value="Kids" <%= "Kids".equals(request.getParameter("category")) ? "checked" : "" %>> Kids</label>

            <h3>Type</h3>
            <label><input type="checkbox" name="type" value="Topwear" <%= "Topwear".equals(request.getParameter("type")) ? "checked" : "" %>> Topwear</label>
            <label><input type="checkbox" name="type" value="Bottomwear" <%= "Bottomwear".equals(request.getParameter("type")) ? "checked" : "" %>> Bottomwear</label>
            <label><input type="checkbox" name="type" value="Winterwear" <%= "Winterwear".equals(request.getParameter("type")) ? "checked" : "" %>> Winterwear</label>
            
        </form>
    </aside>

    <section class="collection">
        <h2>ALL COLLECTIONS</h2>
        <div class="products">
            <%
                String searchQuery = request.getParameter("query");
                String category = request.getParameter("category");
                String type = request.getParameter("type");

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    String jdbcURL = "jdbc:mysql://localhost:3306/forever";
                    String dbUser = "root";
                    String dbPass = "";
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

                    StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE 1=1");
                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        sql.append(" AND name LIKE ?");
                    }
                    if (category != null && !category.trim().isEmpty()) {
                        sql.append(" AND category = ?");
                    }
                    if (type != null && !type.trim().isEmpty()) {
                        sql.append(" AND type = ?");
                    }

                    stmt = conn.prepareStatement(sql.toString());
                    int paramIndex = 1;

                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        stmt.setString(paramIndex++, "%" + searchQuery + "%");
                    }
                    if (category != null && !category.trim().isEmpty()) {
                        stmt.setString(paramIndex++, category);
                    }
                    if (type != null && !type.trim().isEmpty()) {
                        stmt.setString(paramIndex++, type);
                    }

                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String image = rs.getString("image");
                        double price = rs.getDouble("price");
            %>
            <div class="product">
                <a href="ImageView.jsp?id=<%= id %>">
                    <img src="uploads/<%= image %>" alt="<%= name %>">
                </a>
                <h3><%= name %></h3>
                <p>$<%= price %></p>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
    </section>
</div>
</body>
</html>
