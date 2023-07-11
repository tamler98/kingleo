package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.DiscountEntity;
import com.nilesh.springCRUD.repository.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountService {
    @Autowired
    DiscountRepository discountRepository;

    public DiscountEntity findByDiscountCode(String discountCode) { return discountRepository.findByDiscountCode(discountCode);
    }
}
