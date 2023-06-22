package com.nilesh.springCRUD.security;

import com.nilesh.springCRUD.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.nilesh.springCRUD.model.AccountEntity;

public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private AccountRepository accountRepository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AccountEntity accountEntity = accountRepository.getUserByUsername(username);
		if(accountEntity==null) {
			throw new UsernameNotFoundException("Could not find User");
		}
		return new MyUserDetails(accountEntity);
	}

}
