package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.OrderEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer> {

}
