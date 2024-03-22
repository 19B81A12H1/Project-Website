package com.example.website.repo;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.website.table.Cart;

public interface CartRepositary extends JpaRepository<Cart, Integer> {

	void save(Optional<Cart> cart);

	List<Cart> findByEmail(String email);



}
