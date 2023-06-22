package com.nilesh.springCRUD.repository;

import com.nilesh.springCRUD.model.AccountEntity;
import com.nilesh.springCRUD.model.RoleEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends CrudRepository<RoleEntity, Integer> {
    @Query(value="SELECT * from roles Where role_id = ?1", nativeQuery = true)
    public RoleEntity findById(int id);
}
