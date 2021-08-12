package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.repositories.RepositorioUsuario;
import com.oneteam.socialcoders.repositories.RoleRepository;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ServicioUsuario extends ServicioBase<Usuario> {
    private final RepositorioUsuario repositorioUsuario;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public ServicioUsuario(RepositorioUsuario repositorioUsuario,
            RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        super(repositorioUsuario);
        this.repositorioUsuario = repositorioUsuario;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

        // 1
    public void saveWithUserRole(Usuario user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        repositorioUsuario.save(user);
    }
     
     // 2 
    public void saveUserWithAdminRole(Usuario user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        repositorioUsuario.save(user);
    }    
    
    // 3
    public Usuario findByUsername(String username) {
        return repositorioUsuario.findByUsername(username);
    }

    public boolean emailExist(String email) {
        return repositorioUsuario.existsByEmail(email);
    }

    public boolean usernameExists(String username) {
        return repositorioUsuario.existsByUsername(username);
    }

    public List<Usuario> allByNombre(String nombre) {
        return repositorioUsuario.findAllByUsernameContaining(nombre);
    }

    public int validationUsers(){
        List<Usuario> usuarios = repositorioUsuario.findAll();
        return usuarios.size();
    }
    
}
