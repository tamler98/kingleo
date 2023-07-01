package com.nilesh.springCRUD.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "product_name")
    private String product_name;
    @Column(name = "price")
    private Double price;
    @OneToMany(mappedBy = "productEntity", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<OrderDetailEntity> orderDetailEntityList;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private CategoryEntity categoryEntity;

    private int count_sold;

    @OneToMany(mappedBy = "productEntity")
    private List<ProductDetailEntity> productDetailEntities;
    @OneToMany(mappedBy = "productEntity")
    private List<ProductImageEntity> productImageEntities;

    @OneToMany(mappedBy = "productEntity")
    private List<ProductColorEntity> productColorEntities;

    @OneToMany(mappedBy = "productEntity")
    private List<RatingEntity> ratingEntities;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public CategoryEntity getCategoryEntity() {
        return categoryEntity;
    }

    public void setCategoryEntity(CategoryEntity categoryEntity) {
        this.categoryEntity = categoryEntity;
    }

    public List<ProductDetailEntity> getProductDetailEntities() {
        return productDetailEntities;
    }

    public void setProductDetailEntities(List<ProductDetailEntity> productDetailEntities) {
        this.productDetailEntities = productDetailEntities;
    }

    public List<ProductColorEntity> getProductColorEntities() {
        return productColorEntities;
    }

    public void setProductColorEntities(List<ProductColorEntity> productColorEntities) {
        this.productColorEntities = productColorEntities;
    }

    public List<ProductImageEntity> getProductImageEntities() {
        return productImageEntities;
    }

    public void setProductImageEntities(List<ProductImageEntity> productImageEntities) {
        this.productImageEntities = productImageEntities;
    }

    public List<OrderDetailEntity> getOrderDetailEntityList() {
        return orderDetailEntityList;
    }

    public void setOrderDetailEntityList(List<OrderDetailEntity> orderDetailEntityList) {
        this.orderDetailEntityList = orderDetailEntityList;
    }

    public List<RatingEntity> getRatingEntities() {
        return ratingEntities;
    }

    public void setRatingEntities(List<RatingEntity> ratingEntities) {
        this.ratingEntities = ratingEntities;
    }

    public int getCount_sold() {
        return count_sold;
    }

    public void setCount_sold(int count_sold) {
        this.count_sold = count_sold;
    }
}
