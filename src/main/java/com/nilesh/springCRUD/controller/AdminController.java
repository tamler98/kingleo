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
        return "redirect:/admin/manager";
    }

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
    @GetMapping("dashboard")
    public String viewDashboard(){
        return "admin/dashboard";
    }
    @GetMapping("productView")
    public String viewAllProduct(){
        return "admin/product";
    }
    @GetMapping("addProduct")
    public String addProduct(){
        return "admin/add_product";
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
