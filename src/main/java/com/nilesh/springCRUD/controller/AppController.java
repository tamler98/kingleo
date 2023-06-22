package com.nilesh.springCRUD.controller;

import java.util.List;

import com.nilesh.springCRUD.model.BookingCartItemEntity;
import com.nilesh.springCRUD.model.ProductEntity;
import com.nilesh.springCRUD.services.AccountService;
import com.nilesh.springCRUD.services.BookingCartItemService;
import com.nilesh.springCRUD.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.Student;
import com.nilesh.springCRUD.services.StudentServices;

import javax.servlet.http.HttpSession;

@Controller
public class AppController {

	@Autowired
	AccountService accountService;
	@Autowired
	ProductService productService;
	@Autowired
	BookingCartItemService bookingCartItemService;

	@RequestMapping("/")
	public String viewHomePage(Model model, HttpSession session,
							   @RequestParam(name = "page", defaultValue = "0") int pageNumber,
							   @RequestParam(name = "size", defaultValue = "8") int pageSize) {
		//Authen
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = principal.toString();
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		}
		AccountEntity user = accountService.findByUsername(username);
		if(user != null) {
			session.setAttribute("account", user);
		}

		// Show list
		PageRequest pageRequest = PageRequest.of(pageNumber, pageSize);
		Page<ProductEntity> listProduct = productService.getProductList(pageRequest);
		model.addAttribute("productList", listProduct.getContent());
		model.addAttribute("currentPage", listProduct.getNumber());
		model.addAttribute("totalPages", listProduct.getTotalPages());

		List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findAll();
		int count = countProduct(bookingCartItemEntities);
		session.setAttribute("count", count);
		return "index";
	}

	@GetMapping(value = "product/productId={id}", produces = "text/plain;charset=UTF-8")
	public String showProduct(Model model, @PathVariable int id) {
		ProductEntity product = productService.findById(id);
		model.addAttribute("product", product);
		return "product";
	}

	public int countProduct(List<BookingCartItemEntity> bookingCartItemEntities){
		int count = 0;
		for (BookingCartItemEntity item:bookingCartItemEntities) {
			count += item.getQuantity();
		}
		return count;
	}
}
