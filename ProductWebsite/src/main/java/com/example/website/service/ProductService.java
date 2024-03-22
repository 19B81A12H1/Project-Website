package com.example.website.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.website.repo.ProductRepositary;
import com.example.website.table.Product;

@Service
public class ProductService {

	@Autowired
	ProductRepositary productRepositary;
	
	public Product saveCustomer(Product p) {
		return productRepositary.save(p);

	}

	public List<Product> getAllDetails() {
		List<Product> p = productRepositary.findAll();
		return p;
	}
	

    public Optional<Product> getProductById(int id) {
        Optional<Product> product = productRepositary.findById(id);
        return product;
    }
}
