<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
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

.product-quantity-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 5px 10px;
}

.quantity-control {
	flex: 0 0 auto;
}

.quantity-link {
	text-decoration: none;
	color: #333;
	font-size: 18px;
}

.quantity-value {
	flex: 1;
	text-align: center;
	font-weight: bold;
}
 .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff; /* Button color */
        color: #ffffff; /* Text color */
        text-decoration: none; /* Remove underline */
        border-radius: 5px; /* Rounded corners */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    .button:hover {
        background-color: #0056b3; /* Darker button color on hover */
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
<script>
    // Function to add a new address field
    function addAddressField() {
        // Get the container element for new address fields
        var addressContainer = document.getElementById("newAddressFields");

        // Create a new div element for the address fields
        var addressDiv = document.createElement("div");
        addressDiv.className = "address-fields";

        // Add input fields for each address property
        var addressInputs = `
            <input type="text" name="houseNumber" placeholder="House Number"><br>
            <input type="text" name="area" placeholder="Area"><br>
            <input type="text" name="city" placeholder="City"><br>
            <input type="text" name="state" placeholder="State"><br>
            <input type="text" name="pincode" placeholder="Pincode"><br>
            `;

        // Set the HTML content of the address div
        addressDiv.innerHTML = addressInputs;

        // Append the address div to the container
        addressContainer.appendChild(addressDiv);
     // Add the Save Address button
        var saveButton = document.createElement("button");
        saveButton.type = "submit";
        saveButton.textContent = "Save Address";
        addressContainer.appendChild(saveButton);
    }
  


</script>


</head>
<body>

	<div class="container">
		<h2>Cart</h2>
		 <div style="display:flex; justify-content: space-between; align-items: center;">
        <h2> Smith Phone Shop</h2>
		<a href="ProductPage" class="add-product-btn">Back </a>
		</div>
		<hr>
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
					<div class="product-quantity-box">
						<div class="quantity-control">
							<a href="reduceQuantity/${cartItem.getId()}?quantity=1"
								class="quantity-link">-</a>
						</div>
						<div class="quantity-value">Quantity:
							${cartItem.getQuantity()}</div>
						<div class="quantity-control">
							<a href="addQuantity/${cartItem.getId()}?quantity=1"
								class="quantity-link">+</a>
						</div>

					</div>

					<div>
						 <a href="/delete/${cartItem.getId()}"><button
								class="cart-button">Delete</button></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div>
		<!-- Link to add address -->
		<a href="javascript:void(0);" onclick="addAddressField()"
			class="add-address-link">Add Address</a>
	</div>

	

	<form action="/address" method="post">
		<!-- Address fields -->
		<div id="newAddressFields"></div>

		
			
	</form>

	<a href="/showAddress" class="button">View Address</a>
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
