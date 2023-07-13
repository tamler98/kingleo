package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.OrderEntity;
import com.nilesh.springCRUD.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    public void save(OrderEntity orderEntity){
        orderRepository.save(orderEntity);
    }


    public List<OrderEntity> findAll() { return (List<OrderEntity>) orderRepository.findAll();
    }

    public List<OrderEntity> findByAccountId(int accountId) { return orderRepository.findByAccountId(accountId);
    }

    public OrderEntity findById(int id) { return orderRepository.findById(id);
    }

    public Page<OrderEntity> getOrderList(PageRequest pageRequest) { return orderRepository.getOrderList(pageRequest);
    }
}
