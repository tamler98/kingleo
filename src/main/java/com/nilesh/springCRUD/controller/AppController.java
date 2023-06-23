package com.nilesh.springCRUD.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.nilesh.springCRUD.model.*;
import com.nilesh.springCRUD.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class AppController {

	@Autowired
	AccountService accountService;
	@Autowired
	ProductService productService;
	@Autowired
	BookingCartService bookingCartService;

	@Autowired
	BookingCartItemService bookingCartItemService;

	@Autowired
	ProductDetailService productDetailService;

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
	@PostMapping(value="addToCart/{id}", produces = "text/plain;charset=UTF-8")
	public String showAddRoom(Model model, @PathVariable int id,
							  @RequestParam(name = "size") int size,
							  @RequestParam(name = "color") String color) {
		try {
				ProductDetailEntity product = findProduct(id, color, size);
			BookingCartEntity bookingCartEntity = bookingCartService.findById(1);
			int checkExist = exist(product.getId(), color, size);
			if(checkExist == -1) {
				createNewBookingCartItem(product, bookingCartEntity, color, size);
			}else {
				BookingCartItemEntity bookingCartItemEntity = bookingCartItemService.findByProductDetailId(product.getId());
				bookingCartItemEntity.setQuantity(bookingCartItemEntity.getQuantity() + 1);
				bookingCartItemService.save(bookingCartItemEntity);
			}
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "khong tim thay san pham");
		}
		return "redirect:/";
	}

	public int exist(int product_id, String color, int size){
		List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(1);
		for (BookingCartItemEntity item: bookingCartItemEntities) {
			if (item.getSize() == size && item.getColor().equals(color)) {
				return item.getId();
			}
		}
		return -1;
	}
	public int countProduct(List<BookingCartItemEntity> bookingCartItemEntities){
		int count = 0;
		for (BookingCartItemEntity item:bookingCartItemEntities) {
			count += item.getQuantity();
		}
		return count;
	}

	public ProductDetailEntity findProduct(int id,String color,int size) {
		List<ProductDetailEntity> productDetailEntities = productDetailService.findAllByProductId(id);
		ProductDetailEntity product = new ProductDetailEntity();
		for (ProductDetailEntity item: productDetailEntities) {
			if (item.getColor().equals(color) && item.getSize() == size) {
				product = item;
				break;
			}
		}
		return product;
	}

	public void createNewBookingCartItem(ProductDetailEntity product, BookingCartEntity bookingCartEntity, String color, int size){
		BookingCartItemEntity bookingCartItemEntity = new BookingCartItemEntity();
		bookingCartItemEntity = new BookingCartItemEntity();
		bookingCartItemEntity.setProductDetailEntity(product);
		bookingCartItemEntity.setBookingCartEntity(bookingCartEntity);
		bookingCartItemEntity.setColor(color);
		bookingCartItemEntity.setQuantity(1);
		bookingCartItemEntity.setSize(size);
		bookingCartItemService.save(bookingCartItemEntity);
	}

	public List<ProductEntity> setListProduct(){
		List<ProductEntity> productEntities = productService.findAll();
		Set<String> uniqueProductName = new HashSet<>();
		List<ProductEntity> newProductShow = new ArrayList<>();
		if (!productEntities.isEmpty()) {
			for (ProductEntity item : productEntities) {
				if(!uniqueProductName.contains(item.getProduct_name())){
					uniqueProductName.add(item.getProduct_name());
					newProductShow.add(item);
				}
			}
		}
		return newProductShow;
	}
}
