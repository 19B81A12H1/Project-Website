package com.example.website.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.website.repo.CartRepositary;
import com.example.website.table.Cart;

@Service
public class CartService {
	
	@Autowired
	CartRepositary cartRepositary;
	
	public void addToCart(String email, String productName, int productId, int quantity) {
	   
	        
	        try {
	            Cart cart = new Cart();
	            cart.setEmail(email);
	            cart.setProductName(productName);
	            cart.setProductId(productId);
	            cart.setQuantity(quantity);
	       
	        
	        cartRepositary.save(cart);
	        System.out.println("Product(s) added to cart successfully");
	    } catch (Exception e) {
	        System.err.println("Error adding product(s) to cart: " + e.getMessage());
	        e.printStackTrace();
	    }
	}

	public void addQuantity(int id,int quantity) {
		
		    try {
		        Cart cart = cartRepositary.findById(id).orElse(null);
		        
		        if (cart != null) {
		            int updatedQuantity = cart.getQuantity() + quantity;
		            // Update the quantity in the cart
		            cart.setQuantity(updatedQuantity);
		            cartRepositary.save(cart);
		            System.out.println("Product quantity added successfully");
		        } else {
		            System.out.println("Cart item not found");
		        }
		    } catch (Exception e) {
		        System.err.println("Error adding product quantity: " + e.getMessage());
		        e.printStackTrace();
		    }
		}

	
	public void reduceQuantity(int id, int quantity) {
	    try {
	        Cart cart = cartRepositary.findById(id).orElse(null);
	        
	        if (cart != null) {
	            int updatedQuantity = cart.getQuantity() - quantity;
	            if (updatedQuantity <= 0) {
	                // If quantity becomes zero or negative, remove the product from the cart
	                cartRepositary.deleteById(id);
	            } else {
	                // Update the quantity in the cart
	                cart.setQuantity(updatedQuantity);
	                cartRepositary.save(cart);
	            }
	            System.out.println("Product quantity reduced successfully");
	        } else {
	            System.out.println("Cart item not found");
	        }
	    } catch (Exception e) {
	        System.err.println("Error reducing product quantity: " + e.getMessage());
	        e.printStackTrace();
	    }
	}

	 public List<Cart> getDetailsCart(String email) {
	        return cartRepositary.findByEmail(email);
	    }
	    
	 public void deleteCart(int id) {
		 cartRepositary.deleteById(id);
	 }

	public Optional<Cart> getCartItemById(int id) {
		
		return cartRepositary.findById(id);
	}
	 

}
