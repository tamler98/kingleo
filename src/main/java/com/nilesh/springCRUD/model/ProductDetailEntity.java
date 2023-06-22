package com.nilesh.springCRUD.model;


import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="product_detail")
public class ProductDetailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="color")
    private String color;

    @Column(name="size")
    private int size;

    @Column(name = "quantity")
    private int quantity;
    @Column(name = "description")
    private String description;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private ProductEntity productEntity;

    @OneToMany(mappedBy = "productDetailEntity")
    private List<BookingCartItemEntity> bookingCartItemEntities;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }

    public List<BookingCartItemEntity> getBookingCartItemEntities() {
        return bookingCartItemEntities;
    }

    public void setBookingCartItemEntities(List<BookingCartItemEntity> bookingCartItemEntities) {
        this.bookingCartItemEntities = bookingCartItemEntities;
    }
}
