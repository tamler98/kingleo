package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.BookingCartEntity;
import com.nilesh.springCRUD.model.BookingCartItemEntity;
import com.nilesh.springCRUD.services.BookingCartItemService;
import com.nilesh.springCRUD.services.BookingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value="/cart")
public class BookingCartController {
    @Autowired
    BookingCartItemService bookingCartItemService;
    @Autowired
    BookingCartService bookingCartService;
    @GetMapping()
    public String bookingCart(Model model){
        BookingCartEntity bookingCartEntity = bookingCartService.findById(1);
        List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
        model.addAttribute("bookingCartItemList", bookingCartItemEntities);
        return "bookingcart";
    }
}
