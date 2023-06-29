package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.*;
import com.nilesh.springCRUD.services.*;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    ProductService productService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductColorService productColorService;
    @Autowired
    ProductDetailService productDetailService;

    @GetMapping("manager")
    public String manageProduct(Model model){
        List<ProductEntity> productEntityList = productService.findAll();
        model.addAttribute("productList", productEntityList);
        return "admin/manageProduct";
    }
//    @GetMapping("newProduct")
//    public String newProduct(Model model){
//        ProductEntity productEntity = new ProductEntity();
//        model.addAttribute("product", productEntity);
//        productDropDown(model);
//        categoryDropDown(model);
//        return "admin/newProduct";
//    }
//    @PostMapping(value ="newProduct",
//            produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
//            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public String addNewProduct(@ModelAttribute(name="product") ProductEntity product,
//                                @RequestPart(name = "photo") MultipartFile photo,
//                                @RequestParam(name="product_category") Integer product_category
//                                ) throws IOException {
//        CategoryEntity category = categoryService.findById(product_category);
//        product.setCategoryEntity(category);
//        productService.save(product);
//
//        ProductImageEntity image = new ProductImageEntity();
//        image.setImage_name(product.getId()+"_Do");
//        image.setUrl(photo.getBytes());
//        image.setProductEntity(product);
//        productImageService.save(image);
//        return "redirect:/admin/manager";
//    }
    @GetMapping("newProduct")
    public String newProduct(Model model){
        ProductEntity productEntity = new ProductEntity();
        model.addAttribute("product", productEntity);
        categoryDropDown(model);
        List<Integer> sizeList = createShoeSizeList();
        model.addAttribute("sizeList", sizeList);
        return "admin/newProduct";
    }
    @PostMapping(value = "newProduct", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String addNewProduct(@ModelAttribute(name = "product") ProductEntity product,
                                @RequestParam(name = "product_category") Integer product_category,
                                @RequestParam(name = "product_colors") List<String> productColors,
                                @RequestParam(name = "photos") List<MultipartFile> photos
//                                @RequestParam(name = "quantity") List<List<Integer>> quantities
    ) throws IOException {
        CategoryEntity category = categoryService.findById(product_category);
        product.setCategoryEntity(category);
        productService.save(product);

        addProductColor(product, productColors);
        createProductDetail(product, productColors);
        addProductColorImage(product, productColors, photos);
//        addProductQuantities(product, productColors, quantities);

        return "redirect:/admin/manager";
    }
//    private void addProductQuantities(ProductEntity product, List<String> productColors, List<List<Integer>> quantities) {
//        List<ProductColorEntity> colors = product.getProductColorEntities();
//        for (int i = 0; i < colors.size(); i++) {
//            ProductColorEntity color = colors.get(i);
//            List<Integer> quantityList = quantities.get(i);
//            for (int j = 0; j < quantityList.size(); j++) {
//                SizeEntity size = sizeService.findBySizeNumber(j + 39); // Kích cỡ giày từ 39 đến 43
//                int quantity = quantityList.get(j);
//                ProductDetailEntity productDetail = productDetailService.findByProductAndColorAndSize(product, color, size);
//                productDetail.setQuantity(quantity);
//                productDetailService.save(productDetail);
//            }
//        }
//    }

    private void createProductDetail(ProductEntity product, List<String> productColors) {
        List<Integer> sizeList = createShoeSizeList();
        for (String color:productColors) {
            for (Integer size : sizeList) {
                ProductDetailEntity productDetailEntity = new ProductDetailEntity();
                productDetailEntity.setProductEntity(product);
                productDetailEntity.setQuantity(10);
                productDetailEntity.setSize(size);
                productDetailEntity.setColor(color);
                productDetailService.save(productDetailEntity);
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
    }

    @GetMapping("updateProduct/{id}")
    public String updateProduct(Model model, @PathVariable int id){
        ProductEntity productEntity = productService.findById(id);
        model.addAttribute("product", productEntity);
        return "admin/newProduct";
    }
    @GetMapping("deleteProduct/id={id}")
    public String deleteProduct(Model model, @PathVariable int id){
        productService.deleteById(id);
        return "redirect:/admin/manager";
    }
    @GetMapping("newImage")
    public String newImage(Model model){
        return "newImage";
    }
    @RequestMapping(value = "/newImage", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String saveUser(
            @RequestPart(name = "photo") MultipartFile photo) throws IOException {
        ProductImageEntity image = new ProductImageEntity();
        ProductEntity product = productService.findById(1);
        image.setImage_name("anh1");
        image.setImage_type("jsp");
        image.setUrl(photo.getBytes());
        image.setProductEntity(product);
        productImageService.save(image);
        return "redirect:/admin/manager";
    }
    @GetMapping("/viewProduct/{id}")
    public String viewProduct(@PathVariable int id, Model model) {
        ProductEntity product = productService.findById(id);
        model.addAttribute("product", product);
        return "product2";
    }
    @GetMapping("getImagePhoto/{id}")
    public void getImagePhoto(HttpServletResponse response,Model model, @PathVariable("id") int id) throws Exception {
        response.setContentType("image/jpeg");
        List<ProductImageEntity> i = (List<ProductImageEntity>) productImageService.findByProductId(id);
        byte[] ph = i.get(0).getUrl();
        InputStream inputStream = new ByteArrayInputStream(ph);
        IOUtils.copy(inputStream, response.getOutputStream());
    }
    public void categoryDropDown(Model model) {
        List<CategoryEntity> categoryEntities = categoryService.findAll();

        Map<Integer, String> categoryList = new HashMap<>();
        for (CategoryEntity category : categoryEntities) {
            categoryList.put(category.getId(), category.getCategory_name());
        }
        model.addAttribute("categoryList", categoryList);
    }

    public void productColorDropDown(Model model) {
        Map<Integer, String> productColorList = new HashMap<>();
        productColorList.put(1, "Do");
        productColorList.put(2, "Xanh");
        model.addAttribute("productColorList", productColorList);
    }

    public void addProductColorImage(ProductEntity product, List<String> productColors, List<MultipartFile> photos) throws IOException {
        List<String> colorAdd = new ArrayList<>();
        for (String color : productColors) {
            colorAdd.add(color);
        }
        List<MultipartFile> photoAdd = new ArrayList<>();
        for (MultipartFile photo : photos) {
            if(!photo.getOriginalFilename().equals("")){
                photoAdd.add(photo);
            }
        }
        for(int i=0; i< colorAdd.size(); i++) {
            ProductImageEntity image = new ProductImageEntity();
            image.setImage_name(product.getId()+"_"+colorAdd.get(i));
            image.setUrl(photoAdd.get(i).getBytes());
            image.setProductEntity(product);
            productImageService.save(image);
        }


        for (String color: colorAdd) {
            ProductImageEntity image = new ProductImageEntity();
            image.setImage_name(product.getId()+"_"+color);
            image.setUrl(photoAdd.get(color.indexOf(color)).getBytes());
            image.setProductEntity(product);
            productImageService.save(image);
        }
    }
    public void addProductColor(ProductEntity product, List<String> productColors) {
        for (String color: productColors) {
            ProductColorEntity productColorEntity = new ProductColorEntity();
            productColorEntity.setColor_name(color);
            productColorEntity.setProductEntity(product);
            productColorService.save(productColorEntity);
        }
    }
    public List<Integer> createShoeSizeList() {
        List<Integer> shoeSizes = new ArrayList<>();
        for (int i = 39; i <= 43; i++) {
            shoeSizes.add(i);
        }
        return shoeSizes;
    }
}
