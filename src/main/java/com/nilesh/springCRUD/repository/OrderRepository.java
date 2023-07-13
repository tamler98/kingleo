package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.OrderEntity;
import com.nilesh.springCRUD.model.ProductEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Integer> {
    @Query(value = "SELECT * FROM orders where user_id = ?1 order by order_date desc", nativeQuery = true)
    List<OrderEntity> findByAccountId(int accountId);
    @Query(value="SELECT * FROM orders order by order_date desc", nativeQuery = true)
    Page<OrderEntity> getOrderList(Pageable pageable);
    @Query(value = "SELECT * FROM orders where id = ?1", nativeQuery = true)
    OrderEntity findById(int id);
}
