package com.nilesh.springCRUD.controller;

import com.nilesh.springCRUD.model.BookingCartEntity;
import com.nilesh.springCRUD.model.RoleEntity;
import com.nilesh.springCRUD.services.AccountService;
import com.nilesh.springCRUD.services.BookingCartService;
import com.nilesh.springCRUD.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.nilesh.springCRUD.model.AccountEntity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class SignUpController {
    @Autowired
    AccountService accountService;
    @Autowired
    RoleService roleService;

    @Autowired
    BookingCartService bookingCartService;
    @GetMapping("/signup")
    public String registerNewAccount(){
        return "signup";
    }
    @PostMapping("/signup")
    public String registerNewAccount(@RequestParam(value = "username") String username,
                                     @RequestParam(value = "password") String password,
                                     @RequestParam(value = "email") String email,
                                     @RequestParam(value = "password_repeat") String password_repeat,
                                     @RequestParam(value = "phone") String phone, Model model){
        int checkAccount = (int) checkAccount(username);
        if (!password.equals(password_repeat)) {
            model.addAttribute("msg", "Mật khẩu nhập lại không đúng!");
            return "signup";
        }else if(checkAccount == -1) {
            AccountEntity newUser = new AccountEntity();
            newUser.setUsername(username);
            //Create password
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String newPassword = encoder.encode(password);
            newUser.setPassword(newPassword);

            //Create Booking Cart
            BookingCartEntity bookingCartEntity = new BookingCartEntity();
            bookingCartEntity.setAccountEntity(newUser);
            bookingCartService.save(bookingCartEntity);

            newUser.setEmail(email);
            newUser.setPhone(phone);

            //Create role
            RoleEntity role = roleService.findById(2);
            Set<RoleEntity> roles = new HashSet<>();
            roles.add(role);
            newUser.setRoles(roles);

            accountService.save(newUser);
            model.addAttribute("msg", "Đăng ký tài khoản thành công, hãy đăng nhập!");
            return "login";
        }else{
            model.addAttribute("msg", "Tài khoản đã tồn tại");
            return "signup";
        }

    }

    public long checkAccount(String username) {
        List<AccountEntity> userList = accountService.findAll();
        for (AccountEntity user :userList) {
            if (user.getUsername().equals((username))) {
                return user.getId();
            }
        }
        return -1;
     }
}
