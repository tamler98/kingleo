package com.nilesh.springCRUD.repository;


import com.nilesh.springCRUD.model.BookingCartEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingCartRepository extends JpaRepository<BookingCartEntity, Integer> {
    @Query(value = "select * from booking_cart where id =?1", nativeQuery = true)
    BookingCartEntity findById(int id);

    @Query(value = "select * from booking_cart where user_id =?1", nativeQuery = true)
    BookingCartEntity findByAccountId(int id);
}
