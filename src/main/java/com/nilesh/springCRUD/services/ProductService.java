package com.nilesh.springCRUD.services;


import com.nilesh.springCRUD.model.ProductEntity;
import com.nilesh.springCRUD.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    public List<ProductEntity> findAll() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public ProductEntity findById(int productId) { return productRepository.findById(productId);
    }

    public Page<ProductEntity> getProductList(PageRequest pageRequest) { return productRepository.getProductList(pageRequest);
    }

    public List<ProductEntity> findBySearchInput(String searchInput) { return productRepository.findBySearchInput(searchInput);
    }

    public Page<ProductEntity> getProductListBySearchInput(PageRequest pageRequest, String searchInput) { return productRepository.getProductListBySearchInput(pageRequest, searchInput);
    }

    public void save(ProductEntity product) {productRepository.save(product);
    }

    public void deleteById(int id) { productRepository.deleteById(id);
    }
}
