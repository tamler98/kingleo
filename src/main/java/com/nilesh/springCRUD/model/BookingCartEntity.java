package com.nilesh.springCRUD.model;


import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "booking_cart")
public class BookingCartEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToMany(mappedBy = "bookingCartEntity")
    private List<BookingCartItemEntity> bookingCartItemEntities;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private AccountEntity accountEntity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<BookingCartItemEntity> getBookingCartItemEntities() {
        return bookingCartItemEntities;
    }

    public void setBookingCartItemEntities(List<BookingCartItemEntity> bookingCartItemEntities) {
        this.bookingCartItemEntities = bookingCartItemEntities;
    }

    public AccountEntity getAccountEntity() {
        return accountEntity;
    }

    public void setAccountEntity(AccountEntity accountEntity) {
        this.accountEntity = accountEntity;
    }
}
