<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
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
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
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
            font-size: 16px;
        }
        .sidebar ul li button.active {
            background-color: #ffe4e1;
            border-radius: 5px;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        .main-content .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .main-content .header .title {
            font-size: 24px;
            font-weight: bold;
        }
        .main-content .header .logout-btn {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .order-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .order-card img {
            width: 50px;
            height: 50px;
            margin-right: 20px;
            vertical-align: top;
        }
        .order-card .order-details {
            display: flex;
            justify-content: space-between;
        }
        .order-card .order-info {
            max-width: 70%;
            margin-left: -250px;        }
        .order-card .order-info p {
            margin: 5px 0;
        }
        .order-card .order-status select {
            
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            
            
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="title">FOREVER.</div>
            <ul>
                <li><a href="additem.jsp"><button>Add Items</button></a></li>
                <li><a href="listitem.jsp"><button>List Items</button></a></li>
                <li><a href="orders.jsp"><button class="active">Orders</button></a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="header">
                <div class="title">Order Page</div>
               <a href="AdminLogin.jsp"> <button class="logout-btn">Logout</button></a>
            </div>
            <div class="order-card">
                <div class="order-details">
                    <img src="https://storage.googleapis.com/a1aa/image/IYABcOwpVncy3HYa4tGiqsSHnVsjMqbeqggmVYY16XU.jpg" alt="Package icon">
                    <div class="order-info">
                        <p>Men Round Neck Pure Cotton T-shirt x 2 M,</p>
                        <p>Men Round Neck Pure Cotton T-shirt x 1 S,</p>
                        <p>Men Round Neck Pure Cotton T-shirt x 1 XL</p>
                        <p>Avinash kr</p>
                        <p>some street,</p>
                        <p>Bangalore, KA, IN, 5600001</p>
                        <p>1234567890</p>
                    </div>
                    <div class="order-status">
                        <p style="margin-left: -300px;">Items: 3</p>
                        <p class="text-xl font-semibold" style="margin-left: -100px;">$304</p>
                        <p style="margin-left: -300px;">Method: COD</p>
                        <p style="margin-left: -300px;">Payment: Pending</p>
                        <p style="margin-left: -300px;">Date: 8/16/2024</p>
                        <select>
                            <option>Order Placed</option>
                            <option>Packing</option>
                            <option>Shipped</option>
                            <option>Out for delivery</option>
                            <option>Delivered</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="order-card">
                <div class="order-details">
                    <img src="https://storage.googleapis.com/a1aa/image/IYABcOwpVncy3HYa4tGiqsSHnVsjMqbeqggmVYY16XU.jpg" alt="Package icon">
                    <div class="order-info">
                        <p>Girls Round Neck Cotton Top x 1 S,</p>
                        <p>Girls Round Neck Cotton Top x 1 M</p>
                        <p>Great Stack</p>
                        <p>Main Street,</p>
                        <p>Demo City, Demo State, US, 123456</p>
                        <p>9876543210</p>
                    </div>
                    <div class="order-status">
                        <p style="margin-left: -300px;">Items: 2</p>
                        <p class="text-xl font-semibold" style="margin-left: -100px;">$110</p>
                        <p style="margin-left: -300px;">Method: Stripe</p>
                        <p style="margin-left: -300px;">Payment: Done</p>
                        <p style="margin-left: -300px;">Date: 7/10/2024</p>
                        <select>
                            <option>Order Placed</option>
                            <option>Packing</option>
                            <option>Shipped</option>
                            <option>Out for delivery</option>
                            <option>Delivered</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="order-card">
                <div class="order-details">
                    <img src="https://storage.googleapis.com/a1aa/image/IYABcOwpVncy3HYa4tGiqsSHnVsjMqbeqggmVYY16XU.jpg" alt="Package icon">
                    <div class="order-info">
                        <p>Men Round Neck Pure Cotton T-shirt x 1 M,</p>
                        <p>Men Round Neck Pure Cotton T-shirt x 1 S,</p>
                        <p>Men Round Neck Pure Cotton T-shirt x 1 XL</p>
                        <p>Great Stack</p>
                        <p>Main Street,</p>
                        <p>Demo City, Demo State, US, 123456</p>
                        <p>9876543210</p>
                    </div>
                    <div class="order-status">
                        <p style="margin-left: -300px;">Items: 2</p>
                        <p class="text-xl font-semibold" style="margin-left: -100px;">$88</p>
                        <p style="margin-left: -300px;">Method: Razorpay</p>
                        <p style="margin-left: -300px;">Payment: Done</p>
                        <p style="margin-left: -300px;">Date: 7/10/2024</p>
                        <select >
                            <option>Order Placed</option>
                            <option>Packing</option>
                            <option>Shipped</option>
                            <option>Out for delivery</option>
                            <option>Delivered</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
