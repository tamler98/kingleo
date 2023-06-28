package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.ProductColorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductColorRepository extends JpaRepository<ProductColorEntity, Integer> {
}
