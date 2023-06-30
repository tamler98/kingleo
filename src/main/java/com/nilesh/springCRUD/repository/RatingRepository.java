package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.RatingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RatingRepository extends JpaRepository<RatingEntity, Integer> {
    @Query(value = "select * from rating where product_id = ?1", nativeQuery = true)
    List<RatingEntity> findByProductId(int productId);

    @Query(value = "select * from rating where rating_id = ?1", nativeQuery = true)
    RatingEntity findById(int id);
}
