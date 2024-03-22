package com.example.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.website.repo.BuyRepositary;
import com.example.website.table.Address;
import com.example.website.table.Buy;

@Service
public class BuyService {
	
	@Autowired
	BuyRepositary buyRepositary;
	
	
	
	 public void saveToBuy( int  cartId, int productId) {
	        try {
	            Buy buy = new Buy();
	            buy.setCartId(cartId);
	            buy.setProductId(productId);
	            buyRepositary.save(buy);
	            System.out.println("Product saved to buy successfully");
	        } catch (Exception e) {
	            System.err.println("Error saving product to buy: " + e.getMessage());
	            e.printStackTrace();
	        }
	        }



	 public void saveToBuyWithAddress(int cartId, int productId, Address address) {
	        // Assuming you have a Buy entity and a corresponding repository
	        // Create a new Buy entity with the provided cartId, productId, and address
	        Buy buy = new Buy();
	        buy.setCartId(cartId);
	        buy.setProductId(productId);
	        buy.setAddress(address);

	        // Save the Buy entity
	        buyRepositary.save(buy);
	    }
		

	 
}
