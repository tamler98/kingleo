package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.BookingCartItemEntity;
import com.nilesh.springCRUD.repository.BookingCartItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingCartItemService {
    @Autowired
    BookingCartItemRepository bookingCartItemRepository;

    public void save(BookingCartItemEntity bookingCartItemEntity) { bookingCartItemRepository.save(bookingCartItemEntity);
    }

    public List<BookingCartItemEntity> findByBookingCartId(int id) { return bookingCartItemRepository.findByBookingCartId(id);
    }

    public List<BookingCartItemEntity> findAll() { return bookingCartItemRepository.findAll();
    }

    public void deleteById(int id) { bookingCartItemRepository.deleteById(id);
    }

    public BookingCartItemEntity findByProductDetailId(int id) { return bookingCartItemRepository.findByProductDetailId(id);
    }

    public BookingCartItemEntity findById(int id) { return bookingCartItemRepository.findById(id);
    }

    public void saveAll(List<BookingCartItemEntity> bookingCartItemEntities) { bookingCartItemRepository.saveAll(bookingCartItemEntities);
    }

    public void deleteAll(List<BookingCartItemEntity> bookingCartItemEntities1) {
    }
}
