package com.example.website.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.website.repo.AddressRepositary;
import com.example.website.repo.CustomerRepositary;
import com.example.website.table.Address;
import com.example.website.table.Customer;

@Service
public class CustomerService {

	@Autowired
	CustomerRepositary customerRepositary;
	@Autowired
	AddressRepositary addressRepositary;

	public Customer saveCustomer(Customer c) {
		// Encrypt the password before saving
		String encodedPassword = encodePassword(c.getPassword());
		c.setPassword(encodedPassword);
		return customerRepositary.save(c);
	}

	public List<Customer> getAllDetails() {
		List<Customer> c = customerRepositary.findAll();
		return c;
	}

	private String encodePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}

	public void saveAddress(Address address) {
		
		addressRepositary.save(address);
	}
	
	public void assignAddressToCustomer(int customerId,  Address address) {
		address.setCustomerId(customerId);
		 addressRepositary.save(address);
	        System.out.println("Address is saved with customer ID: " + customerId);
	    }

		
	
//	public void assignAddressToCustomer(int customerId, int id) {
//		Customer customer = customerRepositary.findById(customerId).orElse(null);
//		Address address = addressRepositary.findById(id).orElse(null);
//		if (customer != null && address != null) {
//
//			address.setCustomer(customer);
//
//			List<Address> addresses = customer.getAddress();
//			addresses.add(address);
//			customer.setAddress(addresses);
//			customerRepositary.save(customer);
//		}
//	}

    public Customer getCustomerByEmail(String email) {
        Optional<Customer> optionalCustomer = customerRepositary.findByEmail(email);
        return optionalCustomer.orElse(null);
    }
//    public Optional<Address> getAddressesByCustomerId(int customerId) {
//        return addressRepositary.findByCustomerId(customerId);
//    }
//   
    public List<Address> AddressByCustomerId(int customerId) {
        return addressRepositary.findByCustomerId(customerId);
    }

	public Optional<Address> getAddressById(int addressId) {
		
		return addressRepositary.findById(addressId);
	}
}