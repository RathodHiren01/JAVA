<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: black;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }

        header .logo {
            font-size: 24px;
            font-weight: bold;
        }

        header nav a, .icons a {
            margin: 0 10px;
            text-decoration: none;
            color: black;
        }

        header nav a:hover, .icons a:hover {
            color: #555;
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 32px;
        }

        form {
            width: 300px;
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .links {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .links a {
            text-decoration: none;
            color: #777;
        }

        .links a:hover {
            color: #333;
        }

        button {
            padding: 10px;
            border: none;
            background-color: black;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">FOREVER</div>
        <nav>
            <a href="#">HOME</a>
            <a href="#">COLLECTION</a>
            <a href="#">ABOUT</a>
            <a href="#">CONTACT</a>
        </nav>
        <div class="icons">
            <a href="#">🔍</a>
            <a href="#">👤</a>
            <a href="#">🔒</a>
        </div>
    </header>
    <main>
        <h1>Sign Up</h1>
        <form action="RegisterServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <div class="links">
                <a href="#">Forgot your Password?</a>
                <a href="login.jsp">Login Here</a>
            </div>

            <button type="submit">Sign Up</button>
        </form>
    </main>
</body>
</html>
