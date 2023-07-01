package com.nilesh.springCRUD.repository;


import com.nilesh.springCRUD.model.ProductEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Integer> {
    @Query(value = "select * from product where id =?1", nativeQuery = true)
    ProductEntity findById(int id);
    @Query(value="select * from product", nativeQuery = true)
    Page<ProductEntity> getProductList(Pageable pageable);

    @Query(value="select * from product where product.product_name like %?1%", nativeQuery = true)
    Page<ProductEntity> getProductListBySearchInput(Pageable pageable, String searchInput);

    List<ProductEntity> findAll();
    @Query(value="select * from product where product.product_name like %?1% ", nativeQuery = true)
    List<ProductEntity> findBySearchInput(String searchInput);
    @Query(value="SELECT * FROM product order by count_sold desc limit 4", nativeQuery = true)
    List<ProductEntity> getTop4Product();
    @Query(value="select * from product where product.product_name like %?1%", nativeQuery = true)
    Page<ProductEntity> findByKeyword(Pageable pageable, String keyword);
}
