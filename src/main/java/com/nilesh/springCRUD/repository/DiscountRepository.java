package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.DiscountEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DiscountRepository extends JpaRepository<DiscountEntity, Integer> {
    @Query(value = "SELECT * FROM discount where discount_code = ?1", nativeQuery = true)
    DiscountEntity findByDiscountCode(String discountCode);
}
