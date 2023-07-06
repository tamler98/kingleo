package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.enums.OrderStatus;
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
import java.util.Random;

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
        AccountEntity accountEntity = accountService.findByEmailOrUsername(username);
//        List<BookingCartItemEntity> bookingCartItemEntities = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        List<BookingCartItemEntity> bookingCartItemEntities = new ArrayList<>();
        if (accountEntity == null) {
            bookingCartItemEntities = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");
            if(bookingCartItemEntities == null) {
                return "bookingcart1";
            }
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
            return "bookingcart1";
        } else {
            model.addAttribute("accountEntity", accountEntity);
            session.setAttribute("accountEntity", accountEntity);
            // find by account id
            BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
            bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());

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
            return "bookingcart1";
        }
    }
    @GetMapping(value = "/checkout", produces = "text/plain;charset=UTF-8")
    public String checkout(HttpSession session){
        String username = (String) session.getAttribute("userEmail");
        AccountEntity accountEntity = accountService.findByEmailOrUsername(username);
        return "checkout";
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
        accountEntity.setCount_of_order(accountEntity.getCount_of_order()+1);
        accountService.save(accountEntity);

        // Create new order
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderDate(LocalDate.now());
        orderEntity.setAccountEntity(accountEntity);
        orderEntity.setShippingCod(20000.0);

        Random random = new Random();
        int randomNumber = random.nextInt(900000000) + 100000000;

        orderEntity.setOrderCode(String.valueOf(randomNumber));
        orderEntity.setOrderStatus(String.valueOf(OrderStatus.ORDERED));
        orderEntity.setTotalPrice(totalPrice(bookingCartItemEntities));
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
            orderDetailEntity.setColor(item.getColor());
            orderDetailEntity.setSize(item.getSize());
            orderDetailEntity.setCustomer_address(address);
            orderDetailEntity.setCustomer_phone(phone);
            orderDetailEntity.setCod_shipping(30000.0);
            orderDetailEntity.setCustomer_name(firstName);
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

    @GetMapping("/deleteItem={id}")
    public String deleteCartItem(@PathVariable String id, HttpSession session, Model model) {
        List<BookingCartItemEntity> bookingCartItemEntities = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");

        if (bookingCartItemEntities != null) {
            for (BookingCartItemEntity cartItem : bookingCartItemEntities) {
                String cartItemId = String.valueOf(cartItem.getId());
                if (cartItemId.equals(id)) {
                    bookingCartItemEntities.remove(cartItem);
                    bookingCartItemService.deleteById(cartItem.getId());
                    break;
                }
            }
        }
        AccountEntity accountEntity = (AccountEntity) session.getAttribute("accountEntity");
        BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
        List<BookingCartItemEntity> bookingCartItemEntitiesDB =
                bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());

        for (BookingCartItemEntity cartItemDB : bookingCartItemEntitiesDB) {
            String cartItemId = String.valueOf(cartItemDB.getId());
            if (cartItemId.equals(id)) {
                bookingCartItemService.deleteById(cartItemDB.getId());
                break;
            }

        }

        model.addAttribute("bookingCartItemList", bookingCartItemEntities);
        session.setAttribute("bookingCartItemList", bookingCartItemEntities);

        return "redirect:/cart";
    }
    @PostMapping("/increase")
    public String increaseQuantity(@RequestParam("index") int index, HttpSession session, @RequestParam("quantity") int quantity){
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");
        List<BookingCartItemEntity> cartItems = bookingCartItemService.findAll();

        if (bookingCartItemEntitiesSession == null){
            // find index in booking cart item to increase. ex: index 0, index 1, index 2
            BookingCartItemEntity item = cartItems.get(index);
            item.setQuantity(quantity);

            bookingCartItemService.save(item);
            return "redirect:/cart";
        }
        BookingCartItemEntity item = bookingCartItemEntitiesSession.get(index);
        item.setQuantity(quantity);
        bookingCartItemService.save(item);

        return "redirect:/cart";
    }
    @PostMapping("/decrease")
    public String decreaseQuantity(@RequestParam("index") int index, HttpSession session, @RequestParam("quantity") int quantity){
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");
        List<BookingCartItemEntity> cartItems = bookingCartItemService.findAll();

        if (bookingCartItemEntitiesSession == null){
            // find index in booking cart item to increase. ex: index 0, index 1, index 2
            BookingCartItemEntity item = cartItems.get(index);
            if (quantity <=0 ){
                bookingCartItemService.deleteById(item.getId());
                return "redirect:/cart";
            }
            item.setQuantity(quantity);
            bookingCartItemService.save(item);
            return "redirect:/cart";
        }
        BookingCartItemEntity item = bookingCartItemEntitiesSession.get(index);
        if (quantity <=0){
            bookingCartItemService.deleteById(item.getId());
            return "redirect:/cart";
        }
        item.setQuantity(quantity);
        bookingCartItemService.save(item);

        return "redirect:/cart";
    }

    private double totalPrice(List<BookingCartItemEntity> bookingCartItemEntities) {
        double sum = 0;
        for (BookingCartItemEntity bookingCartItemEntity: bookingCartItemEntities) {
            sum += bookingCartItemEntity.getProductDetailEntity().getProductEntity().getPrice();
        }
        return sum;
    }

}
