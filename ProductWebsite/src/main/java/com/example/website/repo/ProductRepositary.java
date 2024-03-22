package com.example.website.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.website.table.Product;

public interface ProductRepositary extends JpaRepository<Product, Integer> {

}
