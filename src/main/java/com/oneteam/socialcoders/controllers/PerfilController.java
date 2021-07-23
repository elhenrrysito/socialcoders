package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.List;

import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/perfil")
public class PerfilController {
    private final ServicioUsuario servicioUsuario;

    public PerfilController(ServicioUsuario servicioUsuario) {
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("{username}")
    public String verPerfil(@PathVariable("username") String username, Model model) {
        if(!servicioUsuario.usernameExists(username)) {
            return "noEncontrado.jsp";
        } else {
            Usuario usuario = servicioUsuario.findByUsername(username);
            model.addAttribute("usuario", usuario);
            return "perfil/perfilUsuario.jsp";
        } 
    }

    @PostMapping("/follow/{username}")
    public String seguir(@PathVariable("username") String username, Model model, Principal principal) {
        String usernameActual = principal.getName(); 
        Usuario seguidor = servicioUsuario.findByUsername(usernameActual);
        Usuario seguido = servicioUsuario.findByUsername(username);
        List<Usuario> seguidos = seguidor.getSeguidos();
        seguidos.add(seguido);
        
        return "redirect:/socialcoders/perfil/" + username;
    }
    
   
}
