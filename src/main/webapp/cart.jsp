<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body { font-family: Arial; margin: 0; padding: 0; }
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
        .cart-items { padding: 20px; }
        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ccc;
            padding: 15px 0;
        }
        .cart-item img { width: 100px; height: 120px; object-fit: cover; }
        .cart-item div { flex-grow: 1; margin-left: 20px; }
        .cart-item input[type="number"] { width: 60px; padding: 5px; }
        .cart-item button { background: none; border: none; color: red; font-size: 18px; cursor: pointer; }
        .cart-totals { margin-top: 30px; }
        .cart-totals p { font-size: 18px; }
        .cart-totals button {
            padding: 12px 24px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
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
        <form action="search.jsp" method="get">
            <input type="text" name="query" placeholder="Search...">
            <button type="submit">🔍</button>
        </form>
        <a href="cart.jsp">🛒</a>
    </div>
</header>

<main>
    <div class="cart-items">
        <h2>Your CART</h2>

        <%
            List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
            double subtotal = 0;
            if (cart != null && !cart.isEmpty()) {
                for (int i = 0; i < cart.size(); i++) {
                    Map<String, String> item = cart.get(i);
                    String name = item.get("name");
                    String image = item.get("image");
                    String priceStr = item.get("price");
                    String size = item.get("size");

                    double price = Double.parseDouble(priceStr);
                    subtotal += price;
        %>
        <div class="cart-item">
            <img src="uploads/<%= image %>" alt="<%= name %>">
            <div>
                <p><strong><%= name %></strong></p>
                <p>Size: <%= size %></p>
                <p>$<%= String.format("%.2f", price) %></p>
            </div>
            <input type="number" value="1" readonly>
            <form action="removeFromCart.jsp" method="post" style="margin-left: 10px;">
                <input type="hidden" name="index" value="<%= i %>">
                <button type="submit">🗑</button>
            </form>
        </div>
        <%
                }
            } else {
        %>
        <p>Your cart is empty.</p>
        <%
            }
            double shipping = (subtotal > 0) ? 10.0 : 0.0;
            double total = subtotal + shipping;
        %>

        <div class="cart-totals">
            <h3>CART TOTALS</h3>
            <p>Subtotal: $<%= String.format("%.2f", subtotal) %></p>
            <p>Shipping: $<%= String.format("%.2f", shipping) %></p>
            <p><strong>Total: $<%= String.format("%.2f", total) %></strong></p>
            <a href="DELIVERY INFORMATION.jsp"><button>PROCEED TO CHECKOUT</button></a>
        </div>
    </div>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
