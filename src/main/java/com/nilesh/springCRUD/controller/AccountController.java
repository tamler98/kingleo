package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.services.AccountService;
import com.nilesh.springCRUD.services.ProductImageService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

@Controller
@RequestMapping("account")
public class AccountController {
    @Autowired
    AccountService accountService;
    @Autowired
    ProductImageService productImageService;
    @GetMapping("profile")
    public String viewProfile(Model model, HttpSession session){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if(account == null){
            return "redirect:/login";
        }else{
        model.addAttribute("account", account);
        return "account_page";
        }

    }

    @PostMapping(value="update")
    public String updateInfo(@ModelAttribute("account") AccountEntity accountEntity, Model model) throws IOException {
        AccountEntity account = accountService.findByUsername(accountEntity.getUsername());
        account.setEmail(accountEntity.getEmail());
        account.setPhone(accountEntity.getPhone());
        account.setUsername(accountEntity.getUsername());
        account.setDistrict(accountEntity.getDistrict());
        account.setProvince(accountEntity.getProvince());
        account.setAddress(accountEntity.getAddress());
        account.setDescription(accountEntity.getDescription());
        account.setFirst_name(accountEntity.getFirst_name());
        accountService.save(account);
        model.addAttribute("account", account);
        return "account_page";
    }

    @PostMapping(value="updateAvatar", produces = MediaType.APPLICATION_JSON_UTF8_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> updateImage(@RequestPart(name = "photo") MultipartFile photo, HttpSession session) throws IOException {
        try{
            AccountEntity account = (AccountEntity) session.getAttribute("account");
            account.setPhoto(photo.getBytes());
            accountService.save(account);
            return ResponseEntity.ok().body("{\"status\": \"success\"}");
        } catch (Exception e) {
            return ResponseEntity.ok().body("{\"status\": \"fail\"}");
        }

    }

    @GetMapping("getImagePhoto/{id}")
    public void getImagePhoto(HttpServletResponse response, Model model, @PathVariable("id") int id) throws Exception {
        response.setContentType("image/jpeg");
        AccountEntity accountEntity = accountService.findById(id);
        byte[] ph = accountEntity.getPhoto();

        if (ph != null) {
            InputStream inputStream = new ByteArrayInputStream(ph);
            IOUtils.copy(inputStream, response.getOutputStream());
        } else {
            InputStream defaultImage = getClass().getResourceAsStream("/static/images/avatar_default.jpg");
            System.out.println(defaultImage);
            IOUtils.copy(defaultImage, response.getOutputStream());
        }
    }
}
