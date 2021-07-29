package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.repositories.RepositorioLenguaje;

import org.springframework.stereotype.Service;

@Service
public class ServicioLenguaje extends ServicioBase<Lenguaje> {
    private final RepositorioLenguaje repositorioLenguaje;

    public ServicioLenguaje(RepositorioLenguaje repositorioLenguaje) {
        super(repositorioLenguaje);
        this.repositorioLenguaje = repositorioLenguaje;
    }

    public List<Lenguaje> lenguajesNoUtilizados(Usuario usuario) {
        return repositorioLenguaje.findByUsuarioNotContaining(usuario);
    }

    public Lenguaje findByLenguaje(String lenguaje) {
        return repositorioLenguaje.findByLenguajeContaining(lenguaje);
    }
    
    public Lenguaje buscarPorNombre(String l){
        return repositorioLenguaje.findLenguajeByLenguaje(l);
    }
    
}
