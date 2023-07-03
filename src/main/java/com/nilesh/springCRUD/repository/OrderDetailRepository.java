package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.OrderDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetailEntity, Integer> {
    @Query(value = "SELECT * FROM order_details where order_id = ?1", nativeQuery = true)
    List<OrderDetailEntity> findByOrderId(int orderId);
}
