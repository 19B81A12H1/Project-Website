<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
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
	margin-bottom: 20px;
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

.cart-button {
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	text-decoration: none;
}

.cart-button:hover {
	background-color: #45a049;
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


<body>
    

	<div class="container">
	 <div style="display:flex; justify-content: space-between; align-items: center;">
        <h2> Smith Phone Shop</h2>
        </div>
        <hr>
		<h2>FINAL LIST</h2>
		<a href="CartPage" class="add-product-btn">Back </a>
		<c:forEach var="cartItem" items="${carts}">
			<div class="product-box">
				<div>
					<div class="product-name">Cart ID: ${cartItem.getId()}</div>
				</div>
				<div class="product-details">
					<div class="product-name">Product Name:
						${cartItem.getProductName()}</div>
					<div class="product-name">User Email: ${cartItem.getEmail()}</div>
					<div class="product-name">Product Id:
						${cartItem.getProductId()}</div>
					<div>
						
							
							<a href="/buyFromCart/${cartItem.getId()}?selectedAddressId=${selectedAddressId}" class="cart-button">Buy Now</a>
							
							<a href="/delete/${cartItem.getId()}"><button
								class="cart-button">Delete</button></a>
					</div>
				</div>
				</div>
		</c:forEach> 
		</div>

		<!-- Display list of addresses for selection -->
    <div class="container">
        <h3>Select Address:</h3>
        <form >
            <select name="selectedAddressId">
                <c:forEach var="address" items="${address}">
                    <option value="${address.getId()}">${address.getHouseNumber()},${address.getArea()},
					${address.getCity()}, ${address.getState()},
					${address.getPincode()}</option>
                </c:forEach>
            </select>
            
           
        </form>
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
    
    <div>
        <p>© 2023, Smith Phone Shop, Online Retailer - TENX COMMERCE LLP</p>
    </div>
</footer>
</body>
</html>
