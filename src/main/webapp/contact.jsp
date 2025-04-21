<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Forever</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: white;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 16px;
            margin-left: 150px;
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
            padding: 16px 0;
            display: flex;
            gap: 16px;
            align-items: flex-start;
        }
        .text-content {
            flex: 1;
        }
        h1, h2 {
            font-weight: bold;
            margin-bottom: 16px;
        }
        .contact-info, .careers {
            margin-bottom: 32px;
            margin-left: 200px;
            margin-top: 50px;
        }
        .button {
            display: inline-block;
            padding: 12px 24px;
            border: 1px solid #333;
            color: #333;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .button:hover {
            background-color: #333;
            color: white;
        }
        .image {
            max-width: 40%;

            height: auto;
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
    <main class="container">
        <img style="margin-top: 75px;" src="https://storage.googleapis.com/a1aa/image/eIQWk5bEBfcSQAxVKg7yQKOy2ZamFdcb8Yi3jH4LHhY.jpg" alt="A cup of coffee on a coaster, a small potted plant, an iPhone, and a laptop on a white desk" class="image">
        <div class="text-content">
            <h1 style="text-align:left;">CONTACT US</h1>
            <div class="contact-info">
                <h2>Our Store</h2>
                <p>54709 Wilms Station<br>Suite 350, Washington, USA</p>
                <p>Tel: (415) 555-0132<br>Email: admin@forever.com</p>
            </div>
            <div class="careers">
                <h2>Careers at Forever</h2>
                <p>Learn more about our teams and job openings.</p>
                <a href="#" class="button">Explore Jobs</a>
            </div>
        </div>
    </main>
</body>
</html>
