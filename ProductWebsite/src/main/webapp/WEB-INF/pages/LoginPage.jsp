<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 0 20px;
}
        h2 {
            text-align: center;
            color: #333;
            margin-top: 50px;
        }

        form {
            max-width: 300px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        footer {
            background-color: #333;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        footer a {
            color: white;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        footer div {
            padding: 10px;
        }

        footer hr {
            border-color: white;
            margin: 20px 0;
        }

      

        .admin-notice {
            font-size: 12px;
            color: #888;
            text-align: center;
        }
    </style>
</head>
<body>
 <div style="display: flex">
        
        <div style="display:flex; justify-content: space-between; align-items: center;">
        <h2> Smith Phone Shop</h2>
        </div>
        </div>
        <hr>
<h2>Login</h2>

<form method="GET" action="login">
    <label for="email"> Email:</label>
    <input type="email" id="email" name="email" required>
    <br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>

    <input type="submit" value="login"/>
    <a href="regist"> new customer</a>
</form>
<hr>
<footer>
    <div>
        <h4>COMPANY</h4>
        <p>Blog Contact Us Our Stores</p>
    </div>
    <div>
        <h4>POLICIES AND ORDER</h4>
        <p>Authenticity Guarantee Privacy Policy Return, Exchange & Refund Policy Terms and Conditions Warranty
            Information</p>
    </div>
    <div>
        <h4>HELP</h4>
        <p>FAQ's My Account</p>
    </div>
    <div>
        <h4>SUBSCRIBE TO OUR NEWSLETTER</h4>
        <p>Be the first to hear about new arrivals, by-invitation-only sales and special events</p>
    </div>
    
    <div>
        <p>© 2023, Smith Phone Shop, Online Retailer - TENX COMMERCE LLP</p>
    </div>
</footer>
</body>
</html>
