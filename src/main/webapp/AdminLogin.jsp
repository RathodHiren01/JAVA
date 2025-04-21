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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
            margin: 0;
        }
        .admin-panel {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align: center;
        }
        .admin-panel h2 {
            margin-bottom: 30px;
            font-size: 28px;
        }
        .admin-panel label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-top: 10px;
        }
        .admin-panel input[type="email"],
        .admin-panel input[type="password"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .admin-panel button {
            width: calc(100% - 22px);
            padding: 12px;
            background-color: #000;
            color: #fff;.
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin: 20px 0;
        }
        .admin-panel button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <div class="admin-panel">
        <h2>Admin Panel</h2>
        <form action="adminloginServlet" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="your@email.com" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
