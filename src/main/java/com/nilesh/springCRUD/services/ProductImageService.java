package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.ProductImageEntity;
import com.nilesh.springCRUD.repository.AccountRepository;
import com.nilesh.springCRUD.repository.ProductImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageService {
    @Autowired
    ProductImageRepository productImageRepository;

    public void save(ProductImageEntity image) { productImageRepository.save(image);
    }

    public ProductImageEntity findById(int id) {return productImageRepository.findById(id);
    }

    public List<ProductImageEntity> findByProductId(int id) { return  productImageRepository.findByProductId(id);
    }

    public ProductImageEntity findByProductName(String username) { return productImageRepository.findByName(username);
    }
}
