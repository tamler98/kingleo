package com.nilesh.springCRUD.services;


import com.nilesh.springCRUD.model.ProductDetailEntity;
import com.nilesh.springCRUD.repository.ProductDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetailService {
    @Autowired
    ProductDetailRepository productDetailRepository;

    public List<ProductDetailEntity> findAllByProductId(int id) { return productDetailRepository.findAllByProductId(id);
    }

    public List<ProductDetailEntity> findAll() { return productDetailRepository.findAll();
    }

    public void save(ProductDetailEntity productDetailEntity) { productDetailRepository.save(productDetailEntity);
    }
}
