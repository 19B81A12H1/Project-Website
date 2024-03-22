package com.example.website.controll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.website.service.CartService;
import com.example.website.service.CustomerService;
import com.example.website.table.Address;
import com.example.website.table.Cart;
import com.example.website.table.Customer;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {

	@Autowired
	CustomerService service;
	
	@Autowired
	CartService cservice;


	@GetMapping("/")
	public String getToStart() {
		return "LoginPage";
	}

	@GetMapping("/regist")
	public String toRegisterCustomer() {
		return "Register";
	}

	@PostMapping("/loginSave")
	public String toSaveCustomer(@ModelAttribute Customer c) {
		service.saveCustomer(c);
		return "LoginPage";

	}

	@GetMapping(value = "/login")
	public String toLogin(HttpSession session, Model m, @RequestParam String email, @RequestParam String password) {
		// Retrieve customer by email
		Customer customer = service.getCustomerByEmail(email);

		if (customer != null) {
			// Check if the provided password matches the stored encrypted password
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if (encoder.matches(password, customer.getPassword())) {
				// Set the logged-in user in the session
				session.setAttribute("loggedInUser", customer);
				System.out.println("You are logged in");
				return "redirect:/ProductPage";
			} else {
				// Password does not match
				m.addAttribute("error", "Invalid username or password");
				return "redirect:/LoginPage";
			}
		} else {
			// Customer with the provided email not found
			m.addAttribute("error", "Invalid username or password");
			return "redirect:/LoginPage";
		}
	}

	@PostMapping("/address")
	public String toCreateAddress(@ModelAttribute Address address, HttpSession session) {
		Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");
	    if (loggedInUser != null) {
	        // Set the customer ID for the address
	        address.setCustomerId(loggedInUser.getId());
		service.saveAddress(address);
		 System.out.println("Address is saved");
	    } else {
	        // User is not logged in, redirect to login page
	        System.out.println("User not logged in");
	        return "redirect:/LoginPage";
	    }
	    return "redirect:/CartPage";
	}


	@GetMapping("/showAddress")
	public String showCustomerAddresses(HttpSession session, Model model) {
	    // Retrieve customer ID from the session
	    Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");
	    if (loggedInUser != null) {
	        int customerId = loggedInUser.getId();

	        // Get addresses for the logged-in customer
	        List<Address> address = service.AddressByCustomerId(customerId);
	        if (!address.isEmpty()) {
	            model.addAttribute("address", address);
	            System.out.println("Address details for customer ID: " + customerId + " - " + address);
	        } else {
	            // Handle case when no address is found for the customer
	            // For example, you can redirect to an error page
	            return "CartPage"; // Replace "errorPage" with your actual error page
	        }

	        // Get cart details for the logged-in customer
	        List<Cart> carts = cservice.getDetailsCart(loggedInUser.getEmail());
	        model.addAttribute("carts", carts);

	        return "ConformationPage"; // This will be the name of your JSP page
	    } else {
	        // User is not logged in, redirect to login page
	        System.out.println("User not logged in");
	        return "redirect:/LoginPage";
	    }
	}

}
