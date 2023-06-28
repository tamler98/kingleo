package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.OrderEntity;
import com.nilesh.springCRUD.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    public void save(OrderEntity orderEntity){
        orderRepository.save(orderEntity);
    }


}
