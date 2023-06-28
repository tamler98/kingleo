package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.OrderDetailEntity;
import com.nilesh.springCRUD.model.OrderEntity;
import com.nilesh.springCRUD.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailService {
    @Autowired
    OrderDetailRepository orderDetailRepository;
    public void save(OrderDetailEntity orderDetailEntity){
        orderDetailRepository.save(orderDetailEntity);
    }

    public void saveAll(List<OrderDetailEntity> orderDetailEntityList){
        orderDetailRepository.saveAll(orderDetailEntityList);
    }
}
