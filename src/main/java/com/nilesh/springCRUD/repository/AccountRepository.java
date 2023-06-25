package com.nilesh.springCRUD.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.nilesh.springCRUD.model.AccountEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends CrudRepository<AccountEntity, Integer> {

	@Query("SELECT u FROM AccountEntity u WHERE u.username = :username")
	public AccountEntity getUserByUsername(@Param("username") String username);

	@Query(value = "SELECT * from users Where users.username = ?1", nativeQuery = true)
    public AccountEntity findByUsername(String username);
}
