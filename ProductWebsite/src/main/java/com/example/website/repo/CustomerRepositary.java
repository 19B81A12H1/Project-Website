package com.example.website.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.website.table.Customer;


public interface CustomerRepositary extends JpaRepository<Customer, Integer> {

	void save(Optional<Customer> customer);

	Optional<Customer> findByEmail(String email);

}
