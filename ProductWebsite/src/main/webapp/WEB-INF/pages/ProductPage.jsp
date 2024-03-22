<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Smith Phone Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            position: relative;
            min-height: 100vh; /* Ensure the body stretches to at least the height of the viewport */
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }

        h2 {
            margin-top: 0;
        }

        .product-box {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            background-color: #f9f9f9;
            overflow: hidden;
        }

        .product-details {
            float: left;
            width: 70%;
        }

        .product-image {
            float: left;
            width: 30%;
            margin-right: 20px;
        }

        .product-image img {
            max-width: 100%;
            height: auto;
            cursor: pointer;
        }

        .product-name {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .product-description {
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 18px;
            color: #333;
        }

        .add-product-btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
        }

        .add-product-btn:hover {
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

        /* Styles for the "New Product" button */
        .new-product-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }

        .admin-notice {
            font-size: 12px;
            color: #888;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div style="display:flex; justify-content: space-between; align-items: center;">
        <h2>Smith Phone Shop</h2>
        <div>
            <a href="CartPage" class="add-product-btn" style="margin-right: 10px;">Cart</a>
            <a href="productDetails" class="add-product-btn">Order</a>
        </div>
    </div>
    <c:forEach var="product" items="${products}">
        <div class="product-box">
            <div class="product-image">
                <a href="productDetails?id=${product.getId()}"><img
                        src="${product.getImage()}" alt="${product.getProductName()}"></a>
            </div>
            <div class="product-details">
                <div class="product-name">Product ID:${product.getId()}</div>
                <div class="product-name">Product Name:${product.getProductName()}</div>
                <div class="product-description">Discription :${product.getDiscription()}</div>
                <div class="product-price">Price: ${product.getPrice()}</div>
                <div>
                    <a href="bookCart/${product.getId()}"><button class="edit-button">ADD  TO  CART</button></a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

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
    <div class="new-product-btn">
        <a href="add-product" class="add-product-btn">New Product</a>
        <div class="admin-notice">(This button is applicable only to admins)</div>
    </div>
    <div>
        <p>© 2023, Smith Phone Shop, Online Retailer - TENX COMMERCE LLP</p>
    </div>
</footer>
</body>
</html>
