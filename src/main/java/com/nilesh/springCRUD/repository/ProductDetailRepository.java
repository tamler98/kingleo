package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.ProductDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetailEntity,Integer> {
    @Query(value = "select * from product_detail where product_id =?1", nativeQuery = true)
    List<ProductDetailEntity> findAllByProductId(int id);
}
