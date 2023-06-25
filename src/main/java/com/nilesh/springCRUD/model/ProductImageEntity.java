package com.nilesh.springCRUD.model;

import javax.persistence.*;

@Entity
@Table(name = "product_image")
public class ProductImageEntity {
    @Id
    @Column(name="role_id")
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    private long id;

    @Column(name = "image_name")
    private String image_name;

    @Column(name = "image_type")
    private String image_type;

    @Column(name = "url")
    @Lob
    private byte[] url;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private ProductEntity productEntity;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }

    public String getImage_type() {
        return image_type;
    }

    public void setImage_type(String image_type) {
        this.image_type = image_type;
    }

    public byte[] getUrl() {
        return url;
    }

    public void setUrl(byte[] url) {
        this.url = url;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }
}
