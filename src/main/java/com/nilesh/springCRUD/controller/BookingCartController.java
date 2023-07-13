package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.enums.OrderStatus;
import com.nilesh.springCRUD.model.*;
import com.nilesh.springCRUD.repository.BookingCartItemRepository;
import com.nilesh.springCRUD.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    DiscountService discountService;

    @Autowired
    AccountService accountService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    ProductDetailService productDetailService;
    @Autowired
    private BookingCartItemRepository bookingCartItemRepository;

    @GetMapping()
    public String bookingCart(@ModelAttribute("accountEntity") AccountEntity account,
                              Model model,
                              HttpSession session) {
        AccountEntity accountEntity = (AccountEntity) session.getAttribute("account");
        List<BookingCartItemEntity> bookingCartItemEntities = new ArrayList<>();
        if (accountEntity == null) {
            bookingCartItemEntities = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemListSession");
            // Booking Cart Item List by Session is null
            if(bookingCartItemEntities == null) {
                bookingCartItemEntities = new ArrayList<>();
                setSessionValue(bookingCartItemEntities, session);
                return "bookingcart";
            }
            // Booking Cart Item List by Session not null
            setSessionValue(bookingCartItemEntities, session);
            return "bookingcart";
            // Account Entity is not null
        } else {
            session.setAttribute("account", accountEntity);
            BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(accountEntity.getId());
            List<BookingCartItemEntity> bookingCartItemEntity = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
            // Get list from session
            List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
            if(bookingCartItemEntitiesSession != null) {
                // show price of all product and total price
                setSessionValue(bookingCartItemEntity, session);
            }
        }
        return "bookingcart";
    }

    @PostMapping("/decreaseitemid={id}")
    public String decreaseQuantity(@PathVariable("id") int id, HttpSession session){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        if(account != null) {
            BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(account.getId());
            List<BookingCartItemEntity> bookingCartItemEntityList = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
            bookingCartItemEntityList.get(id).setQuantity(bookingCartItemEntityList.get(id).getQuantity() - 1);
            bookingCartItemService.save(bookingCartItemEntityList.get(id));

            bookingCartItemEntitiesSession.get(id).setQuantity(bookingCartItemEntitiesSession.get(id).getQuantity() - 1);
            if (bookingCartItemEntitiesSession.get(id).getQuantity() == 0) {
                bookingCartItemEntitiesSession.remove(bookingCartItemEntitiesSession.get(id));
                bookingCartItemService.deleteById(bookingCartItemEntityList.get(id).getId());
            }
        }else{
            bookingCartItemEntitiesSession.get(id).setQuantity(bookingCartItemEntitiesSession.get(id).getQuantity() - 1);
            if (bookingCartItemEntitiesSession.get(id).getQuantity() == 0) {
                bookingCartItemEntitiesSession.remove(bookingCartItemEntitiesSession.get(id));
            }
            session.setAttribute("bookingCartItemListSession", bookingCartItemEntitiesSession);
        }
        setSessionValue(bookingCartItemEntitiesSession, session);
        return "redirect:/cart";
    }
    @PostMapping("/increaseitemid={id}")
    public String increaseQuantity(@PathVariable("id") int id, HttpSession session){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if(account != null) {
            BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(account.getId());
            List<BookingCartItemEntity> bookingCartItemEntityList = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
            bookingCartItemEntityList.get(id).setQuantity(bookingCartItemEntityList.get(id).getQuantity() + 1);
            bookingCartItemService.save(bookingCartItemEntityList.get(id));
        }
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        bookingCartItemEntitiesSession.get(id).setQuantity(bookingCartItemEntitiesSession.get(id).getQuantity()+1);

        setSessionValue(bookingCartItemEntitiesSession, session);
        return "redirect:/cart";
    }

    @GetMapping("/deleteItem{id}")
    public String deleteItem(@PathVariable("id") int id, HttpSession session){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if(account != null) {
            BookingCartEntity bookingCartEntity = bookingCartService.findByAccountId(account.getId());
            List<BookingCartItemEntity> bookingCartItemEntityList = bookingCartItemService.findByBookingCartId(bookingCartEntity.getId());
            bookingCartItemService.deleteById(bookingCartItemEntityList.get(id).getId());
        }
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        bookingCartItemEntitiesSession.remove(bookingCartItemEntitiesSession.get(id));
        setSessionValue(bookingCartItemEntitiesSession, session);
        return "redirect:/cart";
    }

    @GetMapping(value = "/checkout", produces = "text/plain;charset=UTF-8")
    public String checkout(HttpSession session, Model model){
//        AccountEntity account = accountService.findById(2);
//        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
      AccountEntity account = (AccountEntity) session.getAttribute("account");
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        if(account == null ){
            return "redirect:/login";
        }
        if(bookingCartItemEntitiesSession.size() == 0){
            session.setAttribute("msg", "Giỏ hàng trống, hãy thêm hàng vào giỏ trước!");
            return "redirect:/cart";
        }
        model.addAttribute("account", account);
         return "checkout";
    }
    @PostMapping(value = "/addDiscount", produces = "text/plain;charset=UTF-8")
    public String addDiscount(HttpSession session,
                              @RequestParam("discount_code") String discount_code,
                              Model model){
        DiscountEntity discountEntity = discountService.findByDiscountCode(discount_code);
        if(discount_code == ""){
            model.addAttribute("Chưa nhập discount!");
        }else if (discount_code.equals(discountEntity.getDiscount_code())){
            double discount = discountEntity.getValue();
            session.setAttribute("discount", discount);
        }
        session.setAttribute("discountEntity", discountEntity);
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        setSessionValue(bookingCartItemEntitiesSession, session);
        return "redirect:/cart";
    }
    @PostMapping(value = "/checkout", produces = "text/plain;charset=UTF-8")
    public String checkout(@RequestParam("first_name") String firstName,
                           @RequestParam("customer_phone") String phone,
                           @RequestParam("customer_address") String address,
                           @RequestParam("order_note") String note,
                           Model model,
                           HttpSession session) {
        // Find account
        AccountEntity account = (AccountEntity) session.getAttribute("account");
        if(account != null) {
            // Save information
            account.setFirst_name(firstName);
            account.setPhone(phone);
            account.setAddress(address);
            account.setCount_of_order(account.getCount_of_order() + 1);
            accountService.save(account);
        }
        // Create new order
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrder_note(note);
        orderEntity.setCustomer_name(firstName);
        orderEntity.setCustomer_phone(phone);
        orderEntity.setCustomer_address(address);
        orderEntity.setOrderDate(LocalDate.now());
        orderEntity.setAccountEntity(account);
        orderEntity.setShippingCod(setShipping_cod());
            // Create new orderCode
        Random random = new Random();
        int randomNumber = random.nextInt(900000000) + 100000000;
        orderEntity.setOrderCode(String.valueOf(randomNumber));
        orderEntity.setOrderStatus(String.valueOf(OrderStatus.ORDERED));
            // Set values in session
        List<BookingCartItemEntity> bookingCartItemEntitiesSession = (List<BookingCartItemEntity>) session.getAttribute("bookingCartItemList");
        setSessionValue(bookingCartItemEntitiesSession,session);
        double totalPrice = totalPrice(bookingCartItemEntitiesSession);
        orderEntity.setTotalPrice(totalPrice - setDiscount(session) + setShipping_cod());
        orderService.save(orderEntity);
        // Create new order detail list
        List<OrderDetailEntity> orderDetailEntityList = new ArrayList<>();
        for (BookingCartItemEntity item : bookingCartItemEntitiesSession) {
            //Create new orderDetail
            OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
            createNewOrderDetail(orderDetailEntity ,item, orderEntity, address, phone,firstName);
            orderDetailEntityList.add(orderDetailEntity);
            // reduce count of product detail
            ProductDetailEntity productDetail = productDetailService.findById(item.getProductDetailEntity().getId());
            productDetail.setQuantity(productDetail.getQuantity() - item.getQuantity());
            productDetail.getProductEntity().setCount_sold(productDetail.getProductEntity().getCount_sold() + item.getQuantity());
            productDetailService.save(productDetail);
        }
        orderDetailService.saveAll(orderDetailEntityList);
        // remove session
        removeValueSession(session);
        // remove item in DB
        List<BookingCartItemEntity> bookingCartItemEntities = bookingCartItemService.findByBookingCartId(bookingCartService.findByAccountId(account.getId()).getId());
        for (BookingCartItemEntity item: bookingCartItemEntities) {
            bookingCartItemService.deleteById(item.getId());
        }
        model.addAttribute("orderEntity",orderEntity);
        return "successpage";
    }

    private double totalPrice(List<BookingCartItemEntity> bookingCartItemEntities) {
        double sum = 0;
        for (BookingCartItemEntity bookingCartItemEntity: bookingCartItemEntities) {
            sum += bookingCartItemEntity.getProductDetailEntity().getProductEntity().getPrice() * bookingCartItemEntity.getQuantity();
        }
        return sum;
    }
    private int countItem(List<BookingCartItemEntity> bookingCartItemEntities) {
        int count = 0;
        for (BookingCartItemEntity item: bookingCartItemEntities) {
            count += item.getQuantity();
        }
        return count;
    }

    @PostMapping("/remove-session")
    public ResponseEntity<String> removeSession(HttpServletRequest request) {
        // Xóa session
        HttpSession session = request.getSession();
        session.removeAttribute("msg");
        // Trả về kết quả thành công
        return ResponseEntity.ok("Session removed");
    }
    private void setSessionValue(List<BookingCartItemEntity> bookingCartItemEntities, HttpSession session) {
        double totalPrice = totalPrice(bookingCartItemEntities);
        double lastTotalPrice = totalPrice - setDiscount(session) + setShipping_cod();
        session.setAttribute("shipping_cod", setShipping_cod());
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("lastTotalPrice", lastTotalPrice);
        session.setAttribute("bookingCartItemList", bookingCartItemEntities);
        int count = countItem(bookingCartItemEntities);
        session.setAttribute("count", count);
        DiscountEntity discountEntity = null;
        DiscountEntity discountSession = (DiscountEntity) session.getAttribute("discountEntity");
        if (discountSession != null) {
            discountEntity = discountSession;
        }
        session.setAttribute("discountEntity", discountEntity);
    }
    private  void removeValueSession(HttpSession session) {
        session.removeAttribute("count");
        session.removeAttribute("totalPrice");
        session.removeAttribute("lastTotalPrice");
        session.removeAttribute("bookingCartItemList");
        session.removeAttribute("discount");
        session.removeAttribute("shipping_cod");
    }

    private double setDiscount(HttpSession session){
        Double discountSession = (Double) session.getAttribute("discount");
        double discount = 0.0;
        if (discountSession != null) {
            discount = discountSession;
        }
        session.setAttribute("discount", discount);
        return discount;
    }
    private double setShipping_cod(){
        double shipping_cod = 20000.0;
        return shipping_cod;
    }

    private void createNewOrderDetail(OrderDetailEntity orderDetailEntity, BookingCartItemEntity item,OrderEntity orderEntity, String address, String phone, String firstName) {
        orderDetailEntity.setProductEntity(item.getProductDetailEntity().getProductEntity());
        orderDetailEntity.setPrice(item.getProductDetailEntity().getProductEntity().getPrice());
        orderDetailEntity.setQuantity(item.getQuantity());
        orderDetailEntity.setOrderEntity(orderEntity);
        orderDetailEntity.setColor(item.getColor());
        orderDetailEntity.setSize(item.getSize());
        orderDetailEntity.setCustomer_address(address);
        orderDetailEntity.setCustomer_phone(phone);
        orderDetailEntity.setCod_shipping(setShipping_cod());
        orderDetailEntity.setCustomer_name(firstName);
    }
}
