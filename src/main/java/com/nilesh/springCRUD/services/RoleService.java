package com.nilesh.springCRUD.services;

import com.nilesh.springCRUD.model.RoleEntity;
import com.nilesh.springCRUD.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {
    @Autowired
    RoleRepository roleRepository;

    public RoleEntity findById(int id) { return roleRepository.findById(id);
    }
}
