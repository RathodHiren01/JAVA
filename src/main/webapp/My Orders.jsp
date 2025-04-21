<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
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
            padding: 20px 0;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .order-card {
            background-color: #fff;
            padding: 10px;
            width: 1200px;
            margin-left: 135px;
            height: 150px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .order-details img {
            width: 60px;
            height: 60px;
            border-radius: 5px;
            margin-right: 20px;
        }
        .order-details {
            display: flex;
            align-items: center;
        }
        .order-info {
            line-height: 1.5;
        }
        .order-status {
            color: #28a745;
            margin-right: 20px;
        }
        .track-button {
            padding: 10px 20px;
            background-color: #ddd;
            border: none;
            border-radius: 5px;
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
            <span>ð</span>
            <span>ð¤</span>
            <span>ðï¸</span>
        </div>
    </header>
    <main class="container">
        <h1 style="margin-left: 50px;">My Orders</h1>
        <div class="order-card">
            <div class="order-details">
                <img src="https://storage.googleapis.com/a1aa/image/hL0xv-8V5EYOFaFBhbC0bSiKeIwhDrRLvNjRSyVzVGI.jpg" alt="T-shirt">
                <div class="order-info">
                    <h2>Men Round Neck Pure Cotton T-shirt</h2>
                    <p>$54 Quantity: 1 Size: XL</p>
                    <p>Date: Fri Aug 16 2024</p>
                    <p>Payment: COD</p>
                </div>
            </div>
            <div class="order-status">â Order Placed</div>
            <button class="track-button">Track Order</button>
        </div>
        <div class="order-card">
            <div class="order-details">
                <img src="https://storage.googleapis.com/a1aa/image/hL0xv-8V5EYOFaFBhbC0bSiKeIwhDrRLvNjRSyVzVGI.jpg" alt="T-shirt">
                <div class="order-info">
                    <h2>Men Round Neck Pure Cotton T-shirt</h2>
                    <p>$54 Quantity: 1 Size: XL</p>
                    <p>Date: Fri Aug 16 2024</p>
                    <p>Payment: COD</p>
                </div>
            </div>
            <div class="order-status">â Order Placed</div>
            <button class="track-button">Track Order</button>
        </div>
        <div class="order-card">
            <div class="order-details">
                <img src="https://storage.googleapis.com/a1aa/image/hL0xv-8V5EYOFaFBhbC0bSiKeIwhDrRLvNjRSyVzVGI.jpg" alt="T-shirt">
                <div class="order-info">
                    <h2>Men Round Neck Pure Cotton T-shirt</h2>
                    <p>$54 Quantity: 1 Size: XL</p>
                    <p>Date: Fri Aug 16 2024</p>
                    <p>Payment: COD</p>
                </div>
            </div>
            <div class="order-status">â Order Placed</div>
            <button class="track-button">Track Order</button>
        </div>
    </main>
</body>
</html>