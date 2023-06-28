package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.CategoryEntity;
import com.nilesh.springCRUD.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    public List<CategoryEntity> findAll() { return (List<CategoryEntity>) categoryRepository.findAll();
    }

    public CategoryEntity findById(int parseInt) { return categoryRepository.findById(parseInt);
    }
}
