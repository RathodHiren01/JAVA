<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Best Sellers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: #2d3748;
            padding: 20px;
            margin: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
            font-size: 2em;
            font-weight: 300;
            margin-bottom: 10px;
        }
        h2 span {
            font-weight: bold;
        }
        p {
            text-align: center;
            color: #718096;
            margin-bottom: 20px;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            justify-content: center;
        }
        .card {
            text-align: center;
            width: 100%;
        }
        .card img {
            width: 100%;
            height: auto;
        }
        .card p {
            margin-top: 10px;
            margin-bottom: 5px;
        }
        .price {
            color: #718096;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>BEST <span>SELLERS</span></h2>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the.</p>
        <div class="grid">
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/4K7lH6lvOVF0ED_3uC1n-9SQAZkX-tlovjjRwElBO1g.jpg" alt="Men Slim Fit Relaxed Denim Jacket">
                <p>Men Slim Fit Relaxed Denim Jacket</p>
                <p class="price">$86</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/VPNchdiOW9BxhRgkU85bh20tJhdIjNOa-Od9Ez8f5Kg.jpg" alt="Women Zip-Front Relaxed Fit Jacket">
                <p>Women Zip-Front Relaxed Fit Jacket</p>
                <p class="price">$78</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/4K7lH6lvOVF0ED_3uC1n-9SQAZkX-tlovjjRwElBO1g.jpg" alt="Men Slim Fit Relaxed Denim Jacket">
                <p>Men Slim Fit Relaxed Denim Jacket</p>
                <p class="price">$84</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/4K7lH6lvOVF0ED_3uC1n-9SQAZkX-tlovjjRwElBO1g.jpg" alt="Men Slim Fit Relaxed Denim Jacket">
                <p>Men Slim Fit Relaxed Denim Jacket</p>
                <p class="price">$72</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/VPNchdiOW9BxhRgkU85bh20tJhdIjNOa-Od9Ez8f5Kg.jpg" alt="Women Zip-Front Relaxed Fit Jacket">
                <p>Women Zip-Front Relaxed Fit Jacket</p>
                <p class="price">$68</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/VPNchdiOW9BxhRgkU85bh20tJhdIjNOa-Od9Ez8f5Kg.jpg" alt="Women Zip-Front Relaxed Fit Jacket">
                <p>Women Zip-Front Relaxed Fit Jacket</p>
                <p class="price">$68</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/VPNchdiOW9BxhRgkU85bh20tJhdIjNOa-Od9Ez8f5Kg.jpg" alt="Women Zip-Front Relaxed Fit Jacket">
                <p>Women Zip-Front Relaxed Fit Jacket</p>
                <p class="price">$68</p>
            </div>
            <div class="card">
                <img src="https://storage.googleapis.com/a1aa/image/VPNchdiOW9BxhRgkU85bh20tJhdIjNOa-Od9Ez8f5Kg.jpg" alt="Women Zip-Front Relaxed Fit Jacket">
                <p>Women Zip-Front Relaxed Fit Jacket</p>
                <p class="price">$68</p>
            </div>
        </div>
    </div>
</body>
</html>
