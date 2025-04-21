<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    List<Map<String, String>> cartItems = (List<Map<String, String>>) session.getAttribute("cart");
    double subtotal = 0;
    if (cartItems == null) {
        cartItems = new ArrayList<>();
    }
    for (Map<String, String> item : cartItems) {
        double price = Double.parseDouble(item.get("price"));
        subtotal += price;
    }
    double shipping = (subtotal > 0) ? 10.0 : 0.0;
    double total = subtotal + shipping;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Checkout Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <style>
        body {
            background-color: white;
            color: #4A4A4A;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            border-bottom: 1px solid #e0e0e0;
            padding: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
        }
        nav a {
            margin-right: 16px;
            color: #757575;
            text-decoration: none;
        }
        nav a:hover {
            color: black;
        }
        .icons span {
            margin-right: 16px;
            color: #757575;
            cursor: pointer;
        }
        .icons span:hover {
            color: black;
        }
        main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 16px;
            display: flex;
            flex-direction: row;
            gap: 40px;
        }
        .form-section {
            flex: 2;
            display: flex;
            flex-direction: column;
            margin-top: 50px;
        }
        .right-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            margin-top: 50px;
        }
        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 16px;
        }
        .form-group {
            display: flex;
            margin-bottom: 16px;
        }
        .form-group input {
            width: 250px;
            padding: 12px;
            border: 1px solid #e0e0e0;
        }
        .form-group input.full-width {
            width: 542px;
        }
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }
        .total-row span {
            font-size: 16px;
        }
        .total-row.bold {
            font-weight: bold;
        }
        .payment-method {
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }
        .payment-method img {
            margin-right: 16px;
            width: 50px;
            height: auto;
        }
        .payment-method span {
            margin-left: 8px;
        }
        .place-order-button {
            background-color: black;
            color: white;
            padding: 12px 24px;
            width: 100%;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<header>
    <div class="logo">FOREVER<span style="color: #FF69B4;">.</span></div>
    <nav>
        <a href="Home.jsp">HOME</a>
        <a href="Collection.jsp">COLLECTION</a>
        <a href="#">ABOUT</a>
        <a href="contact.jsp">CONTACT</a>
    </nav>
    <div class="icons">
        <span>🔍</span>
        <span>👤</span>
        <span>🛍️</span>
    </div>
</header>
<main>
    <!-- Form Section -->
    <div class="form-section">
        <h2>DELIVERY <span style="color: #757575;">INFORMATION</span></h2>
        <form id="checkoutForm" onsubmit="return validateForm()">
            <div class="form-group">
                <input type="text" id="fname" placeholder="First name" style="margin-right: 16px;" required/>
                <input type="text" id="lname" placeholder="Last name" required/>
            </div>
            <div class="form-group">
                <input class="full-width" type="email" id="email" placeholder="Email address" required/>
            </div>
            <div class="form-group">
                <input class="full-width" type="text" id="street" placeholder="Street" required/>
            </div>
            <div class="form-group">
                <input type="text" id="city" placeholder="City" style="margin-right: 16px;" required/>
                <input type="text" id="state" placeholder="State" required/>
            </div>
            <div class="form-group">
                <input type="text" id="zipcode" placeholder="Zipcode" style="margin-right: 16px;" required/>
                <input type="text" id="country" placeholder="Country" required/>
            </div>
            <div class="form-group">
                <input class="full-width" type="tel" id="phone" placeholder="Phone" pattern="[0-9]{10}" required/>
            </div>
        </form>
    </div>

    <!-- Right Section: Cart Totals + Payment -->
    <div class="right-section">
        <div class="cart-totals-section">
            <h2>CART <span style="color: #757575;">TOTALS</span></h2>
            <% for (Map<String, String> item : cartItems) { %>
            <div class="total-row">
                <span><%= item.get("name") %> x 1</span>
                <span>$ <%= item.get("price") %></span>
            </div>
            <% } %>
            <div class="total-row">
                <span>Subtotal</span>
                <span>$ <%= String.format("%.2f", subtotal) %></span>
            </div>
            <div class="total-row">
                <span>Shipping Fee</span>
                <span>$ <%= String.format("%.2f", shipping) %></span>
            </div>
            <div class="total-row bold">
                <span>Total</span>
                <span>$ <%= String.format("%.2f", total) %></span>
            </div>
        </div>

        <div class="payment-method-section">
            <h2>PAYMENT <span style="color: #757575;">METHOD</span></h2>
            <div class="payment-method">
                <input type="radio" name="payment" id="gpay" required form="checkoutForm"/>
                <label for="gpay"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" alt="GPay"/> <span>Google Pay</span></label>
            </div>
            <div class="payment-method">
                <input type="radio" name="payment" id="paytm" form="checkoutForm"/>
                <label for="paytm"><img src="https://upload.wikimedia.org/wikipedia/commons/5/55/Paytm_logo.png" alt="Paytm"/> <span>Paytm</span></label>
            </div>
            <div class="payment-method">
                <input type="radio" name="payment" id="phonepe" form="checkoutForm"/>
                <label for="phonepe"><img src="https://upload.wikimedia.org/wikipedia/commons/f/fc/PhonePe_Logo.png" alt="PhonePe"/> <span>PhonePe</span></label>
            </div>
            <button class="place-order-button" type="submit" form="checkoutForm">PLACE ORDER</button>
        </div>
    </div>
</main>

<script>
    function validateForm() {
        const phone = document.getElementById("phone").value;
        const paymentMethods = document.getElementsByName("payment");
        let paymentSelected = false;

        for (let i = 0; i < paymentMethods.length; i++) {
            if (paymentMethods[i].checked) {
                paymentSelected = true;
                break;
            }
        }

        if (!paymentSelected) {
            alert("Please select a payment method.");
            return false;
        }

        if (!/^\d{10}$/.test(phone)) {
            alert("Please enter a valid 10-digit phone number.");
            return false;
        }

        // Simulate successful submission
        window.location.href = "My Orders.jsp";
        return false; // prevent actual form submission
    }
</script>
</body>
</html>
