package com.nilesh.springCRUD.services;


import com.nilesh.springCRUD.model.BookingCartEntity;
import com.nilesh.springCRUD.repository.BookingCartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingCartService {
    @Autowired
    BookingCartRepository bookingCartRepository;

    public BookingCartEntity findById(int id) { return bookingCartRepository.findById(id);
    }

    public BookingCartEntity findByAccountId(int id) {
        return bookingCartRepository.findByAccountId(id);
    }
}
