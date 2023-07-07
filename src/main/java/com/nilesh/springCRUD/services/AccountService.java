package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.enums.Provider;
import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.BookingCartEntity;
import com.nilesh.springCRUD.repository.AccountRepository;
import com.nilesh.springCRUD.repository.BookingCartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    AccountRepository userRepository;
    @Autowired
    BookingCartRepository bookingCartRepository;

    public void processOAuthPostLogin(String username) {
        AccountEntity existUser = userRepository.findByEmailOrUsername(username);
        BookingCartEntity bookingCartEntity = new BookingCartEntity();
        if (existUser == null) {
            AccountEntity newUser = new AccountEntity();
            newUser.setUsername(username);
            newUser.setEmail(username);
            newUser.setProvider(Provider.GOOGLE);
            bookingCartEntity.setAccountEntity(newUser);

            bookingCartRepository.save(bookingCartEntity);
            userRepository.save(newUser);
        }
        if (existUser != null){
            existUser.setProvider(Provider.GOOGLE);

            userRepository.save(existUser);
        }



    }

    public AccountEntity findByUsername(String username) { return userRepository.findByUsername(username);
    }
    public AccountEntity findByEmail(String userMail) {
        return userRepository.findByEmail(userMail);
    }
    public AccountEntity findByEmailOrUsername(String userMail){
        return userRepository.findByEmailOrUsername(userMail);
    }

    public void save(AccountEntity newUser) { userRepository.save(newUser);
    }

    public List<AccountEntity> findAll() { return (List<AccountEntity>) userRepository.findAll();
    }
    public AccountEntity findById(int id) {
        return userRepository.findById(id);
    }
}
