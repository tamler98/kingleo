package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.OrderEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer> {
    @Query(value = "SELECT * FROM orders where user_id = ?1", nativeQuery = true)
    List<OrderEntity> findByAccountId(int accountId);
}
