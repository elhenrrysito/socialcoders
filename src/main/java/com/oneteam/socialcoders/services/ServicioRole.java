package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Role;
import com.oneteam.socialcoders.repositories.RoleRepository;

import org.springframework.stereotype.Service;

@Service
public class ServicioRole {
    private final RoleRepository roleRepository;

    // public ServicioRole(RoleRepository roleRepository){
    //     super(roleRepository);
    //     this.roleRepository = roleRepository;
    // }
    public ServicioRole(RoleRepository roleRepository){
        this.roleRepository = roleRepository;
    }

    public void createRol(){
        List<Role> roles = roleRepository.findAll();
        if(roles.size() == 0){
            System.out.println("creando roles");
            Role admin = new Role("ROLE_ADMIN");
            roleRepository.save(admin);
            Role user = new Role("ROLE_USER");
            roleRepository.save(user);
        }
    }


}
