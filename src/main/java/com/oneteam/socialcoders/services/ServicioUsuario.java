package com.oneteam.socialcoders.services;

import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioUsuario;

import org.springframework.stereotype.Service;

@Service
public class ServicioUsuario extends ServicioBase<Usuario> {
    private final RepositorioUsuario repositorioUsuario;

    public ServicioUsuario(RepositorioUsuario repositorioUsuario) {
        super(repositorioUsuario);
        this.repositorioUsuario = repositorioUsuario;
    }


    
}
