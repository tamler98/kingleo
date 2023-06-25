package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.ProductEntity;
import com.nilesh.springCRUD.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    ProductService productService;

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
    @PostMapping(value ="newProduct", produces = "text/plain;charset=UTF-8")
    public String addNewProduct(@ModelAttribute(name="product") ProductEntity product){
        productService.save(product);
        return "redirect:/admin/manager";
    }

    @GetMapping("deleteProduct/id={id}")
    public String deleteProduct(Model model, @PathVariable int id){
        productService.deleteById(id);
        return "redirect:/admin/manager";
    }
}
