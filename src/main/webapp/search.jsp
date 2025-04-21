<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String searchQuery = request.getParameter("query");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <style>
        .product { width: 200px; margin: 10px; border: 1px solid #ccc; padding: 10px; display: inline-block; }
        .product img { width: 100%; height: 150px; object-fit: cover; }
    </style>
</head>
<body>
    <h2>Search Results for "<%= searchQuery %>"</h2>
    <div class="products">
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                String jdbcURL = "jdbc:mysql://localhost:3306/forever";
                String dbUser = "root";
                String dbPass = "";
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

                String sql = "SELECT * FROM products WHERE name LIKE ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, "%" + searchQuery + "%");
                rs = stmt.executeQuery();

                boolean found = false;
                while (rs.next()) {
                    found = true;
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int id = rs.getInt("id");
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
                if (!found) {
        %>
        <p>No results found.</p>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <p>Error occurred while searching.</p>
        <%
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception ignore) {}
                if (stmt != null) try { stmt.close(); } catch (Exception ignore) {}
                if (conn != null) try { conn.close(); } catch (Exception ignore) {}
            }
        %>
    </div>
</body>
</html>
