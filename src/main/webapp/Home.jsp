<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forever | Home</title>
    
    <!-- Fonts and Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">

    <!-- Styles -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #fff;
            color: #444;
            margin: 0;
        }
        h1, h2 {
            font-family: 'Playfair Display', serif;
            color: #2c3e50;
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
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        main {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }
        section {
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 40px;
            background: #fdfdfd;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }
        .flex {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }
        @media (min-width: 768px) {
            .flex {
                flex-direction: row;
                align-items: center;
            }
            .flex > div {
                flex: 1;
                padding: 10px;
            }
        }
        img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .text-center {
            text-align: center;
        }
        .mb-2 {
            margin-bottom: 20px;
        }
        .mb-4 {
            margin-bottom: 40px;
        }
        .py-12 {
            padding: 60px 0;
        }
        .font-bold {
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 12px 24px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
            transition: background 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <!-- Header / Navigation -->
    <header>
        <div style="font-size: 24px; font-weight: bold;">FOREVER</div>
        <nav>
            <a href="Home.jsp">HOME</a>
            <a href="Collection.jsp">COLLECTION</a>
            <a href="#">ABOUT</a>
            <a href="contact.jsp">CONTACT</a>
        </nav>
        <div class="icons">
            <!-- Search Form -->
            <form action="search" method="get">
                <input type="text" name="query" placeholder="Search..." aria-label="Search">
                <button type="submit">🔍</button>
            </form>
            <!-- Cart Icon -->
            <a href="cart.jsp" title="View Cart">🛒</a>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <section class="flex">
            <div>
                <p class="mb-2" style="letter-spacing: 1px; color: #3498db;">OUR BESTSELLERS</p>
                <h2 class="mb-4">Latest Arrivals</h2>
                <a href="Collection.jsp" class="btn">SHOP NOW</a>
            </div>
            <div>
                <img src="https://storage.googleapis.com/a1aa/image/BGx54K-MQmGHP8iFtxVKuPq-5lD7hd_4pCYrgQDTAL4.jpg" alt="Fashionable Women Sitting">
            </div>
        </section>
    </main>
</body>
</html>
