package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.ProductColorEntity;
import com.nilesh.springCRUD.repository.ProductColorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductColorService {
    @Autowired
    ProductColorRepository productColorRepository;

    public void save(ProductColorEntity productColorEntity) { productColorRepository.save(productColorEntity);
    }
}
