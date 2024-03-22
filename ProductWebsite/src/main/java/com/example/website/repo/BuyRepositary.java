package com.example.website.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.website.table.Buy;

public interface BuyRepositary extends JpaRepository<Buy, Integer> {

	
}
