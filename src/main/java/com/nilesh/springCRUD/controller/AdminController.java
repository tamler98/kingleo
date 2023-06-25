package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.ProductEntity;
import com.nilesh.springCRUD.model.ProductImageEntity;
import com.nilesh.springCRUD.services.ProductImageService;
import com.nilesh.springCRUD.services.ProductService;
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
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    ProductService productService;
    @Autowired
    ProductImageService productImageService;

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
        return "admin/newProduct";
    }
    @PostMapping(value ="newProduct",
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String addNewProduct(@ModelAttribute(name="product") ProductEntity product,
                                @RequestPart(name = "photo") MultipartFile photo,
                                @RequestParam("image_name") String image_name,
                                @RequestPart("image_url") MultipartFile image_url) throws IOException {
        productService.save(product);
        ProductImageEntity image = new ProductImageEntity();
        image.setImage_name(image_name);
        image.setUrl(photo.getBytes());
        image.setProductEntity(product);
        productImageService.save(image);
        return "redirect:/admin/manager";
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
        System.out.println(photo.getBytes());
        image.setProductEntity(product);
        productImageService.save(image);
        return "newImage";
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
}
