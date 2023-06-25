package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.BookingCartItemEntity;
import com.nilesh.springCRUD.model.ProductImageEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends CrudRepository<ProductImageEntity, Integer> {
    @Query(value = "select * from product_image where id =?1", nativeQuery = true)
    ProductImageEntity findById(int id);
    @Query(value = "select * from product_image where product_id =?1", nativeQuery = true)
    List<ProductImageEntity> findByProductId(int id);
}
