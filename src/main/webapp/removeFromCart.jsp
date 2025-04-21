<%@ page import="java.util.*, java.sql.*" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart != null && index >= 0 && index < cart.size()) {
        // Get item details before removing (for DB deletion)
        Map<String, String> item = cart.get(index);
        String productId = item.get("id");
        String size = item.get("size");
        String sessionId = session.getId();

        // Remove from session cart
        cart.remove(index);
        session.setAttribute("cart", cart);

        // Remove from database
        try {
            String dbURL = "jdbc:mysql://localhost:3306/forever";
            String dbUser = "root";
            String dbPass = "";
            Class.forName("com.mysql.jdbc.Driver"); // or com.mysql.cj.jdbc.Driver for newer
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "DELETE FROM cart_items WHERE session_id = ? AND product_id = ? AND size = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sessionId);
            ps.setString(2, productId);
            ps.setString(3, size);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("Database Error: " + e.getMessage());
        }
    }

    response.sendRedirect("cart.jsp");
%>
