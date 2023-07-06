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

	@Query(value = "SELECT * from users Where users.email = ?1", nativeQuery = true)
	AccountEntity findByEmail(String userMail);

	@Query(value = "select * from users where users.user_id =?1", nativeQuery = true)
	AccountEntity findById(int id);
	@Query(value = "SELECT *\n" +
			"FROM users\n" +
			"WHERE users.email = ?1 OR users.username = ?1", nativeQuery = true)
	public AccountEntity findByEmailOrUsername(String userMail);
}
