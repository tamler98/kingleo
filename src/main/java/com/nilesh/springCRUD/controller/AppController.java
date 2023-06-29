package com.nilesh.springCRUD.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.nilesh.springCRUD.model.*;
import com.nilesh.springCRUD.services.*;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
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

	@Autowired
	ProductImageService productImageService;

	@RequestMapping("/")
	public String viewHomePage(Model model, HttpSession session,
							   @RequestParam(name = "page", defaultValue = "0") int pageNumber,
							   @RequestParam(name = "size", defaultValue = "8") int pageSize) {
		//Authen
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = principal.toString();
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
			session.setAttribute("userEmail", username);
		}
		AccountEntity accountEntity = accountService.findByUsername(username);
		session.setAttribute("account", accountEntity);

		List<BookingCartItemEntity> bookingCartItemBySession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");
		if(accountEntity == null){
			if(bookingCartItemBySession == null) {
				session.setAttribute("count", 0);
			}
		}else {
			BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
			List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
            if (bookingCartItemBySession == null || bookingCartItemBySession.isEmpty()) {
                if (bookingCartItemEntities.size() == 0) {
                    session.setAttribute("count", 0);
                } else {
                    session.setAttribute("bookingCartItemList", bookingCartItemEntities);
                    int count = listSize(bookingCartItemEntities);
                    session.setAttribute("count", count);
                }
            } else {
                if (bookingCartItemEntities.size() == 0) {
                    if(bookingCartItemBySession.size() == 1){
                        bookingCartItemBySession.get(0).setBookingCartEntity(bookingCartEntity);
                        bookingCartItemEntities.add(bookingCartItemBySession.get(0));
                        bookingCartItemService.save(bookingCartItemBySession.get(0));
                        bookingCartItemBySession.remove(bookingCartItemBySession.get(0));
                    }else {
                        for (BookingCartItemEntity item : bookingCartItemBySession) {
                            item.setBookingCartEntity(bookingCartEntity);
                            bookingCartItemEntities.add(item);
                            bookingCartItemService.save(item);
                            bookingCartItemBySession.remove(item);
                        }
                    }
                } else if (bookingCartItemEntities.size() > 0) {
					if (bookingCartItemBySession.size() == 1) {
						for (BookingCartItemEntity item : bookingCartItemEntities) {
							if (bookingCartItemBySession.get(0).getProductDetailEntity().getId() == item.getProductDetailEntity().getId()) {
								item.setQuantity(item.getQuantity() + bookingCartItemBySession.get(0).getQuantity());
								bookingCartItemService.save(item);
								break;
							} else {
								bookingCartItemBySession.get(0).setBookingCartEntity(bookingCartEntity);
								bookingCartItemEntities.add(bookingCartItemBySession.get(0));
								bookingCartItemService.save(bookingCartItemBySession.get(0));
								break;
							}
						}
					} else {
						for (BookingCartItemEntity itemSession : bookingCartItemBySession) {
							boolean isFound = false;

							for (BookingCartItemEntity item : bookingCartItemEntities) {
								if (item.getProductDetailEntity().getId() == itemSession.getProductDetailEntity().getId()) {
									item.setQuantity(item.getQuantity() + itemSession.getQuantity());
									bookingCartItemService.save(item);
									isFound = true;
									break;
								}
							}

							if (!isFound) {
								itemSession.setBookingCartEntity(bookingCartEntity);
								bookingCartItemService.save(itemSession);
								bookingCartItemEntities.add(itemSession);
							}
						}
					}
				}
				session.removeAttribute("bookingCartItemList");
			}
			session.setAttribute("bookingCartItemList", bookingCartItemEntities);
			int count = listSize(bookingCartItemEntities);
			session.setAttribute("count", count);
            }

			// Show list
			PageRequest pageRequest = PageRequest.of(pageNumber, pageSize);
			Page<ProductEntity> listProduct = productService.getProductList(pageRequest);
			model.addAttribute("productList", listProduct.getContent());
			model.addAttribute("currentPage", listProduct.getNumber());
			model.addAttribute("totalPages", listProduct.getTotalPages());
			List<Integer> sizeList = createShoeSizeList();
			model.addAttribute("sizeList", sizeList);
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
							  @RequestParam(name = "size") String sizeShoe,
							  @RequestParam(name = "color") String color,
							  HttpSession session) {
		try {
			int size = Integer.parseInt(sizeShoe);
			ProductDetailEntity product = findProduct(id, color, size);
			int checkExist = exist(id, color, size);
			AccountEntity accountEntity = (AccountEntity) session.getAttribute("account");
			if(accountEntity == null) {
				List<BookingCartItemEntity> listItem = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");
				if(listItem == null || listItem.size() == 0) {
					listItem = new ArrayList<>();
				}
				int checkExistInSession = existInSession(listItem, id, color, size);
				if (checkExistInSession == -1) {
					createNewBookingCartItemNoBookingCartId(product, listItem, color, size);
				}else {
					BookingCartItemEntity bookingCartItemEntity = listItem.get(checkExistInSession);
					bookingCartItemEntity.setQuantity(bookingCartItemEntity.getQuantity()+1);
				}
				session.setAttribute("bookingCartItemListSession",listItem);
				int count = listSize(listItem);
				session.setAttribute("count", count);
			}else {
				BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
				if (checkExist == -1) {
					createNewBookingCartItem(product, bookingCartEntity, color, size);
				} else {
					BookingCartItemEntity bookingCartItemEntity = bookingCartItemService.findByProductDetailId(product.getId());
					bookingCartItemEntity.setQuantity(bookingCartItemEntity.getQuantity() + 1);
					bookingCartItemService.save(bookingCartItemEntity);
				}
			}
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "khong tim thay san pham");
		}
		return "redirect:/";
	}

	@GetMapping("getImagePhoto/{id}_{color}")
	public void getImagePhoto(HttpServletResponse response, Model model, @PathVariable("id") int id,@PathVariable("color") String color) throws Exception {
		response.setContentType("image/jpeg");
		List<ProductImageEntity> imageList = (List<ProductImageEntity>) productImageService.findByProductId(id);
		byte[] ph = new byte[0];
		String name = new String(id+"_"+color);
		for (ProductImageEntity productImage:imageList) {
			if(productImage.getImage_name().equals(name)) {
				ph = productImage.getUrl();
				break;
			}
		}
		InputStream inputStream = new ByteArrayInputStream(ph);
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@GetMapping(value = "search")
	public String searchProduct(@RequestParam(name = "keyword") String keyword,
								@RequestParam(name = "page", defaultValue = "0") int pageNumber,
								@RequestParam(name = "size", defaultValue = "8") int pageSize, Model model) {
		PageRequest pageRequest = PageRequest.of(pageNumber, pageSize);
		Page<ProductEntity> listProduct = productService.getProductListBySearchInput(pageRequest, keyword);

		if(listProduct.isEmpty()) {
			listProduct = productService.getProductList(pageRequest);
			model.addAttribute("productList", listProduct.getContent());
			model.addAttribute("currentPage", listProduct.getNumber());
			model.addAttribute("totalPages", listProduct.getTotalPages());
		}else {
			model.addAttribute("productList", listProduct.getContent());
			model.addAttribute("currentPage", listProduct.getNumber());
			model.addAttribute("totalPages", listProduct.getTotalPages());
		}
		model.addAttribute("sizeList", createShoeSizeList());
		return "search_page";
	}

	public int exist(int product_id, String color, int size){
		List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(1);
		ProductEntity product = productService.findById(product_id);
		for (BookingCartItemEntity item: bookingCartItemEntities) {
			if (item.getSize() == size && item.getColor().equals(color) && item.getProductDetailEntity().getProductEntity().getProduct_name().equals(product.getProduct_name())) {
				return item.getId();
			}
		}
		return -1;
	}
	public int existInSession(List<BookingCartItemEntity> listItem, int product_id, String color, int size){
		ProductEntity product = productService.findById(product_id);
		for (BookingCartItemEntity item: listItem) {
			if (item.getSize() == size && item.getColor().equals(color) && item.getProductDetailEntity().getProductEntity().getProduct_name().equals(product.getProduct_name())) {
				return item.getId();
			}
		}
		return -1;
	}

	private int listSize(List<BookingCartItemEntity> listItem){
		int count = 0;
		for (BookingCartItemEntity item: listItem) {
			count += item.getQuantity();
		}
		return count;
	}
	public int countProduct(BookingCartEntity bookingCartEntity){
		List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
		int count = 0;
		for (BookingCartItemEntity item:bookingCartItemEntities) {
			count += item.getQuantity();
		}
		return count;
	}

	public ProductDetailEntity findProduct(int id,String color,int size) {
		List<ProductDetailEntity> productDetailEntities = productDetailService.findAllByProductId(id);
		for (ProductDetailEntity item: productDetailEntities) {
			if (item.getColor().equals(color) && item.getSize() == size) {
				return item;
			}
		}
		return null;
	}

	public void createNewBookingCartItemNoBookingCartId(ProductDetailEntity product, List<BookingCartItemEntity> listItem, String color, int size){
		BookingCartItemEntity bookingCartItemEntity = new BookingCartItemEntity();
		bookingCartItemEntity = new BookingCartItemEntity();
		bookingCartItemEntity.setProductDetailEntity(product);
		bookingCartItemEntity.setColor(color);
		bookingCartItemEntity.setQuantity(1);
		bookingCartItemEntity.setSize(size);
		listItem.add(bookingCartItemEntity);
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

		public List<Integer> createShoeSizeList() {
			List<Integer> shoeSizes = new ArrayList<>();
			for (int i = 39; i <= 43; i++) {
				shoeSizes.add(i);
			}
			return shoeSizes;
		}
}
