package com.oneteam.socialcoders.services;

import java.util.Optional;

import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.repositories.RepositorioUsuario;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class ServicioUsuario extends ServicioBase<Usuario> {
    private final RepositorioUsuario repositorioUsuario;

    public ServicioUsuario(RepositorioUsuario repositorioUsuario) {
        super(repositorioUsuario);
        this.repositorioUsuario = repositorioUsuario;
    }

    public Usuario registerUser(Usuario user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return repositorioUsuario.save(user);
    }

    public Usuario findByEmail(String email) {
        return repositorioUsuario.findByEmail(email);
    }

    public Usuario findUserById(Long id) {
        Optional<Usuario> optionalUser = repositorioUsuario.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }


    public boolean authenticateUser(String email, String password) {
        // encontramos user por email
        Usuario user = repositorioUsuario.findByEmail(email);
        // si no lo encuentra retorna false
        if(user == null) {
            return false;
        } else {
            // si el password coincide devolvemos true sino false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    public boolean emailExist(String email) {
        return repositorioUsuario.existsByEmail(email);
    }


    
}
