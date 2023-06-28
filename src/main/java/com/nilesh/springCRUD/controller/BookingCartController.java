package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.*;
import com.nilesh.springCRUD.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/cart")
public class BookingCartController {
    @Autowired
    BookingCartItemService bookingCartItemService;
    @Autowired
    BookingCartService bookingCartService;

    @Autowired
    AccountService accountService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;

    @GetMapping()
    public String bookingCart(@ModelAttribute("accountEntity") AccountEntity account,
                              Model model,
                              HttpSession session) {
        // auth
        String username = (String) session.getAttribute("userEmail");
        if (username == null) {
            return "login";
        }

        AccountEntity accountEntity = accountService.findByUsername(username);
        if (accountEntity == null) {
            return "login";
        }

        model.addAttribute("accountEntity", accountEntity);
        session.setAttribute("accountEntity", accountEntity);
        // find by account id
        BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
        List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());

        // show user's information
        accountEntity.setFirst_name(accountEntity.getFirst_name());
        accountEntity.setLast_name(accountEntity.getLast_name());
        accountEntity.setEmail(accountEntity.getEmail());
        accountEntity.setPhone(accountEntity.getPhone());
        accountEntity.setAddress(accountEntity.getAddress());

        // show price of all product and total price
        double priceOfAllProduct = 0.0;
        for (BookingCartItemEntity item : bookingCartItemEntities) {
            priceOfAllProduct += item.getProductDetailEntity().getProductEntity().getPrice();
        }
        double totalPrice = priceOfAllProduct + 20.00;

        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("priceOfAllProduct", priceOfAllProduct);

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("priceOfAllProduct", priceOfAllProduct);
        model.addAttribute("bookingCartItemList", bookingCartItemEntities);
        return "bookingcart";
    }

    @PostMapping(value = "/checkout", produces = "text/plain;charset=UTF-8")
    public String checkout(@RequestParam("first_name") String firstName,
                           @RequestParam("last_name") String lastName,
                           @RequestParam("email") String email,
                           @RequestParam("phone") String phone,
                           @RequestParam("address") String address,
                           Model model,
                           HttpSession session) {
        // Find account
        AccountEntity accountEntity = (AccountEntity) session.getAttribute("accountEntity");
        BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
        List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());


        // Save information
        accountEntity.setFirst_name(firstName);
        accountEntity.setLast_name(lastName);
        accountEntity.setEmail(email);
        accountEntity.setPhone(phone);
        accountEntity.setAddress(address);
        accountService.save(accountEntity);

        // Create new order
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderDate(LocalDate.now());
        orderEntity.setAccountEntity(accountService.findById(1));
        orderService.save(orderEntity);

        // Create new order detail list
        List<OrderDetailEntity> orderDetailEntityList = new ArrayList<>();

        for (BookingCartItemEntity item : bookingCartItemEntities) {
            OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
            orderDetailEntity.setProductEntity(item.getProductDetailEntity().getProductEntity());
            orderDetailEntity.setPrice(item.getProductDetailEntity().getProductEntity().getPrice());
            orderDetailEntity.setQuantity(item.getQuantity());
            orderDetailEntity.setOrderEntity(orderEntity);
            orderDetailEntityList.add(orderDetailEntity);
        }
        orderDetailService.saveAll(orderDetailEntityList);

        return "redirect:/cart/checkout-success";
    }

    @GetMapping("/checkout-success")
    public String showCheckoutSuccess(Model model, HttpSession session) {
        double totalPrice = (double) session.getAttribute("totalPrice");
        double priceOfAllProduct = (double) session.getAttribute("priceOfAllProduct");

        AccountEntity accountEntity = (AccountEntity) session.getAttribute("accountEntity");

        accountEntity.setFirst_name(accountEntity.getFirst_name());
        accountEntity.setLast_name(accountEntity.getLast_name());
        accountEntity.setEmail(accountEntity.getEmail());
        accountEntity.setPhone(accountEntity.getPhone());
        accountEntity.setAddress(accountEntity.getAddress());

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("priceOfAllProduct", priceOfAllProduct);
        model.addAttribute("accountEntity", accountEntity);

        return "checkout-success";
    }


}
