package com.nilesh.springCRUD.repository;



import com.nilesh.springCRUD.model.BookingCartItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingCartItemRepository extends JpaRepository<BookingCartItemEntity, Integer> {
    @Query(value = "select * from booking_cart_item where id =?1", nativeQuery = true)
    BookingCartItemEntity findById(int id);
    @Query(value = "select * from booking_cart_item where booking_cart_id =?1", nativeQuery = true)
    List<BookingCartItemEntity> findByBookingCartId(int id);
    @Query(value = "select * from booking_cart_item where product_detail_id =?1", nativeQuery = true)
    BookingCartItemEntity findByProductDetailId(int productId);
}
