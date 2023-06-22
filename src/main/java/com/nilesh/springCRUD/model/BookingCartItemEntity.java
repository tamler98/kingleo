package com.nilesh.springCRUD.model;


import javax.persistence.*;

@Entity
@Table(name = "booking_cart_item")
public class BookingCartItemEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_detail_id")
    private ProductDetailEntity productDetailEntity;

    @Column(name = "quantity")
    private int quantity;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "booking_cart_id")
    private BookingCartEntity bookingCartEntity;

    @Column(name = "color")
    private String color;

    @Column(name = "size")
    private int size;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductDetailEntity getProductDetailEntity() {
        return productDetailEntity;
    }

    public void setProductDetailEntity(ProductDetailEntity productDetailEntity) {
        this.productDetailEntity = productDetailEntity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BookingCartEntity getBookingCartEntity() {
        return bookingCartEntity;
    }

    public void setBookingCartEntity(BookingCartEntity bookingCartEntity) {
        this.bookingCartEntity = bookingCartEntity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
