package com.example.website.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.website.table.Address;

public interface AddressRepositary extends JpaRepository<Address, Integer> {

	List<Address> findByCustomerId(int customerId);





}
