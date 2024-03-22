package com.example.website.controll;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.website.service.BuyService;
import com.example.website.service.CartService;
import com.example.website.service.CustomerService;
import com.example.website.service.ProductService;
import com.example.website.table.Address;
import com.example.website.table.Cart;
import com.example.website.table.Customer;
import com.example.website.table.Product;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@Autowired
	CustomerService service;

	@Autowired
	ProductService pservice;

	@Autowired
	CartService cservice;

	@Autowired
	BuyService bservice;

	@GetMapping("/add-product")
	public String add() {
		return "AddProduct";
	}

	@PostMapping("/saveProduct")
	public String savep(@ModelAttribute Product p) {
		pservice.saveCustomer(p);

		return "redirect:/ProductPage";
	}

	@GetMapping("/ProductPage")
	public String showProduct(Model m) {
		List<Product> products = pservice.getAllDetails();
		m.addAttribute("products", products);
		System.out.println("list" + products);
		return "ProductPage";
	}

	@GetMapping("/bookCart/{id}")
	public String saveToCart(HttpSession session, @PathVariable int id) {
		Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {

			Optional<Product> product = pservice.getProductById(id);

			if (product.isPresent()) {

				cservice.addToCart(loggedInUser.getEmail(), product.get().getProductName(), id, 1);
				System.out.println("Product added to cart successfully");
			} else {
				System.out.println("Product not found for the provided id");
			}
		} else {
			// User is not logged in, redirect to login page
			System.out.println("User not logged in");
			return "redirect:/LoginPage";
		}

		return "redirect:/ProductPage";
	}

	@GetMapping("/addQuantity/{id}")
	public String toAddQuantity(@PathVariable int id, @RequestParam int quantity) {
		cservice.addQuantity(id, quantity);
		System.out.println("quantity increased");
		return "redirect:/CartPage";
	}

	@GetMapping("/reduceQuantity/{id}")
	public String toReduceQuantity(@PathVariable int id, @RequestParam int quantity) {
		cservice.reduceQuantity(id, quantity);
		System.out.println("quantity degreased");
		return "redirect:/CartPage";
	}

	@GetMapping("/CartPage")
	public String showSlotPage(Model model, HttpSession session) {
		Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			List<Cart> carts = cservice.getDetailsCart(loggedInUser.getEmail());

			model.addAttribute("carts", carts);
			System.out.println("list " + carts);
			return "CartPage";
		} else {
			// User is not logged in, redirect to login page
			return "redirect:/LoginPage";
		}
	}

	@GetMapping("/delete/{id}")
	private String deleteCart(@PathVariable int id) {
		cservice.deleteCart(id);
		return "redirect:/CartPage";
	}

	@GetMapping("/buyFromCart/{id}")
	public String buyProductFromCart(@PathVariable int id, @RequestParam int selectedAddressId, HttpSession session) {
		// Retrieve logged-in user details
		Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			Optional<Address> selectedAddress = service.getAddressById(selectedAddressId);

			if (selectedAddress.isPresent()) {
				Optional<Cart> cartItem = cservice.getCartItemById(id);

				if (cartItem.isPresent()) {
					// Retrieve cart item details
					int cartId = cartItem.get().getId(); // Assuming the ID of the cart item
					int productId = cartItem.get().getProductId(); // Assuming the ID of the product

					// Save the purchase in the buy table
					bservice.saveToBuyWithAddress(cartId, productId, selectedAddress.get());
					System.out.println("Product purchased successfully");

					// Redirect to the product details page
					return "redirect:/productDetails?id=" + productId + "&selectedAddressId=" + selectedAddressId;
				} else {
					System.out.println("Product not found in the cart");
					// Redirect to the cart page or any appropriate page
					return "redirect:/ComformationPage";
				}
			} else {
				System.out.println("Selected address not found");
				// Handle the case where the selected address is not found
				return "redirect:/CartPage";
			}
		} else {
			// User is not logged in, redirect to login page
			System.out.println("User not logged in");
			return "redirect:/LoginPage";
		}
	}

	@GetMapping("/productDetails")
	public String showProductDetails(@PathVariable int selectedAddressId, @PathVariable  int id, HttpSession session,
			Model model) {
		// Retrieve logged-in user details
		Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			// Get customer ID
			int customerId = loggedInUser.getId();

			// Get addresses for the logged-in customer
			List<Address> ad = service.AddressByCustomerId(customerId);

			// Get product details
			Optional<Product> product = pservice.getProductById(id);

			if (!ad.isEmpty() && product.isPresent()) {
				  Optional<Address> selectedAddress = ad.stream().filter(address -> address.getId() == selectedAddressId).findFirst();
				  
				  if (selectedAddress.isPresent()) {
				// Add address and product details to the model
					  model.addAttribute("address", selectedAddress.get());
				model.addAttribute("product", product.get());
				
				System.out.println("Address details for customer ID: " + customerId + " - " +  selectedAddress.get());
				System.out.println("Product details: " + product.get());
				 return "BuyPage"; // Return the page where both address and product details are displayed	
				  } else {
		                // Handle the case where the selected address is not found in the list
		                return "redirect:/ConformationPage"; // Redirect to an appropriate page
		            }
		        } else {
		            // Handle the case where either address or product is not found
		            return "redirect:/CartPage";
		        }
		    } else {
		        // User is not logged in, redirect to login page
		        System.out.println("User not logged in");
		        return "redirect:/LoginPage";
		    }

	}
	

}
