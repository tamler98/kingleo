package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.OrderDetailEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer> {
}
