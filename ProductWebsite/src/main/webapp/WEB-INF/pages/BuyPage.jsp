<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Details</title>
<!-- Add your CSS stylesheets here -->
<style>
/* Add your CSS styles here */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 0 20px;
}

.product-details {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	background-color: #f9f9f9;
	overflow: hidden;
}

.product-image {
	float: left;
	width: 30%;
	margin-right: 20px;
}

.product-image img {
	max-width: 100%;
	height: auto;
}

.product-info {
	float: left;
	width: 70%;
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

.order-message {
            font-size: 24px;
            font-weight: bold;
        }
   .address-details {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 20px;
	background-color: #f9f9f9;
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

  <div style="display: flex">
        <h2>Buy details</h2>
        <div style="display:flex; justify-content: space-between; align-items: center;">
        <h2> Smith Phone Shop</h2>
        </div>
        <a href="/showAddress" class="add-product-btn">Back</a>
    </div>
    <hr>
    <div class="container">
        <div class="product-box">
            <div class="product-image">
              
                    <img src="${product.getImage()}" alt="${product.getProductName()}">
               
            </div>
            <div class="product-details">
                <div class="product-name">Product Name: ${product.getProductName()}</div>
                <div class="product-description">Description: ${product.getDiscription()}</div>
                <div class="product-price">Price: ${product.getPrice()}</div>
                
            </div>
        </div>
        
         <h2>Address Details</h2>
        <div class="address-details">
           
            <p>House Number :${address.getHouseNumber()}</p>
            <p>Area :${address.getArea()}</p>
            
					<p>City :${address.getCity()}</p>
					<p> State :${address.getState()}</p>
					<p> PinCode :${address.getPincode()}</p><br>
        </div> 
    
    </div>
 <!-- Display order confirmation message -->
    <div  class="order-message">
        <h3>Order Confirmation</h3>
        <p>Your order has been placed successfully!</p>
    </div>
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
