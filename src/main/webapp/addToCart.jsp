<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<%
    // Step 1: Get product details from request
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String image = request.getParameter("image");
    String price = request.getParameter("price");
    String size = request.getParameter("size");
    String quantity = "1"; // Default quantity

    // Step 2: Get or create cart from session
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    // Step 3: Check if item exists in session cart
    boolean exists = false;
    for (Map<String, String> item : cart) {
        if (item.get("id").equals(id) && item.get("size").equals(size)) {
            exists = true;
            break;
        }
    }

    // Step 4: If not in cart, add to session and DB
    if (!exists) {
        Map<String, String> item = new HashMap<>();
        item.put("id", id);
        item.put("name", name);
        item.put("image", image);
        item.put("price", price);
        item.put("size", size);
        item.put("quantity", quantity);
        cart.add(item);

        // Store in session
        session.setAttribute("cart", cart);

        // Store in database (MySQL)
        try {
            // Step 5: DB Connection
            String dbURL = "jdbc:mysql://localhost:3306/forever";
            String dbUser = "root";
            String dbPass = "";
            Class.forName("com.mysql.jdbc.Driver"); // or "com.mysql.cj.jdbc.Driver" for newer versions
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Step 6: Insert into DB
            String sessionId = session.getId();
            String sql = "INSERT INTO cart_items (session_id, product_id, product_name, image, price, size, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sessionId);
            ps.setString(2, id);
            ps.setString(3, name);
            ps.setString(4, image);
            ps.setDouble(5, Double.parseDouble(price));
            ps.setString(6, size);
            ps.setInt(7, Integer.parseInt(quantity));
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }

    // Redirect to cart page
    response.sendRedirect("cart.jsp");
%>
