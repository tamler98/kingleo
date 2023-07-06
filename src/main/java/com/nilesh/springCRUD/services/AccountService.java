package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.enums.Provider;
import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    AccountRepository userRepository;

    public void processOAuthPostLogin(String username) {
        AccountEntity existUser = userRepository.findByEmailOrUsername(username);

        if (existUser == null) {
            AccountEntity newUser = new AccountEntity();
            newUser.setUsername(username);
            newUser.setEmail(username);
            newUser.setProvider(Provider.GOOGLE);

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
