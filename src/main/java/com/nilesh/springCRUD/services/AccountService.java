package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    AccountRepository userRepository;


    public AccountEntity findByUsername(String username) { return userRepository.findByUsername(username);
    }
    public AccountEntity findByEmail(String userMail) {
        return userRepository.findByEmail(userMail);
    }

    public void save(AccountEntity newUser) { userRepository.save(newUser);
    }

    public List<AccountEntity> findAll() { return (List<AccountEntity>) userRepository.findAll();
    }
    public AccountEntity findById(int id) {
        return userRepository.findById(id);
    }
}
