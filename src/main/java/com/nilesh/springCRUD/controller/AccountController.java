package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.enums.OrderStatus;
import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.OrderDetailEntity;
import com.nilesh.springCRUD.model.OrderEntity;
import com.nilesh.springCRUD.repository.OrderDetailRepository;
import com.nilesh.springCRUD.services.AccountService;
import com.nilesh.springCRUD.services.OrderDetailService;
import com.nilesh.springCRUD.services.OrderService;
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("account")
public class AccountController {
    @Autowired
    AccountService accountService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    private OrderDetailRepository orderDetailRepository;

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

    @GetMapping("order")
    public String viewOrder(Model model, HttpSession session){
        AccountEntity account = (AccountEntity) session.getAttribute("account");
//        AccountEntity account = accountService.findById(2);
        if(account == null){
            return "redirect:/login";
        }
        List<OrderEntity> orderEntities = orderService.findByAccountId(account.getId());
        model.addAttribute("orderList", orderEntities);
        return "order_list_page";
    }

    @GetMapping("orderDetail&orderid={id}")
    public String viewOrderDetail(Model model, @PathVariable("id") int orderId){
        List<OrderDetailEntity> orderDetailEntityList = orderDetailService.findByOrderId(orderId);
        model.addAttribute("orderDetailList", orderDetailEntityList);
        return "order_detail";
    }

    @GetMapping("cancelorderid={id}")
    public String cancelOrder(@PathVariable("id") int id, Model model) {
        OrderEntity order = orderService.findById(id);
        if(order.getOrderStatus().equals("ORDERED") || order.getOrderStatus().equals("RECEIVED")) {
            order.setOrderStatus(String.valueOf(OrderStatus.CANCEL));
            orderService.save(order);
        }else{
            model.addAttribute("msg","Đơn hàng đang được giao, không thể hủy!");
        }
        return "redirect:/account/order";
    }

    @GetMapping("repayorderid={id}")
    public String repayOrder(@PathVariable("id") int id, HttpSession session){
        OrderEntity order = orderService.findById(id);
        session.setAttribute("orderEntity", order);
        List<OrderDetailEntity> orderDetailEntities = orderDetailService.findByOrderId(id);
        session.setAttribute("orderDetailList", orderDetailEntities);
        return "repay_order";
    }
    @PostMapping("repayorder")
    public String repayOrder(HttpSession session){
        OrderEntity order = (OrderEntity) session.getAttribute("orderEntity");
        OrderEntity newOrder = new OrderEntity();
        newOrder.setOrderCode(order.getOrderCode());
        newOrder.setOrderStatus(String.valueOf(OrderStatus.ORDERED));
        newOrder.setOrderDate(LocalDate.now());
        newOrder.setTotalPrice(order.getTotalPrice());
        newOrder.setAccountEntity(order.getAccountEntity());
        newOrder.setShippingCod(order.getShippingCod());
        newOrder.setOrderDetailEntityList(order.getOrderDetailEntityList());
        orderService.save(newOrder);
        List<OrderDetailEntity> orderDetailEntities = (List<OrderDetailEntity>) session.getAttribute("orderDetailList");
        List<OrderDetailEntity> orderDetailEntity = new ArrayList<>();
        for (OrderDetailEntity orderDetail: orderDetailEntities) {
            OrderDetailEntity newOrderDetail = new OrderDetailEntity();
            newOrderDetail.setPrice(orderDetail.getPrice());
            newOrderDetail.setQuantity(orderDetail.getQuantity());
            newOrderDetail.setOrderEntity(newOrder);
            newOrderDetail.setProductEntity(orderDetail.getProductEntity());
            newOrderDetail.setCod_shipping(orderDetail.getCod_shipping());
            newOrderDetail.setColor(orderDetail.getColor());
            newOrderDetail.setCustomer_name(orderDetail.getCustomer_name());
            newOrderDetail.setCustomer_address(orderDetail.getCustomer_address());
            newOrderDetail.setCustomer_phone(orderDetail.getCustomer_phone());
            newOrderDetail.setDiscount(orderDetail.getDiscount());
            newOrderDetail.setSize(orderDetail.getSize());
            orderDetailEntity.add(newOrderDetail);
        }
        orderDetailService.saveAll(orderDetailEntity);

        session.removeAttribute("orderDetailList");
        session.removeAttribute("orderEntity");
        return "redirect:/account/order";
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
