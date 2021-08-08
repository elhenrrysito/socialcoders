package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.List;

import com.oneteam.socialcoders.models.Mensaje;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioMensaje;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mensajes")
public class MessageController {
    private final ServicioMensaje servicioMensaje;
    private final ServicioUsuario servicioUsuario;


    public MessageController(ServicioMensaje servicioMensaje, ServicioUsuario servicioUsuario) {
        this.servicioMensaje = servicioMensaje;
        this.servicioUsuario = servicioUsuario;
    }


    @GetMapping("/{destinatarioUsername}")
    public String enviar(@ModelAttribute("mensaje") Mensaje mensaje, @PathVariable("destinatarioUsername") String destinatarioUsername, Principal principal, Model model) {
        String usernameEmisor = principal.getName();
        Usuario destinatario = servicioUsuario.findByUsername(destinatarioUsername);
        Usuario emisor = servicioUsuario.findByUsername(usernameEmisor);
        List<Mensaje> chat = servicioMensaje.getChat(destinatario, emisor);

        model.addAttribute("destinatario", destinatario);
        model.addAttribute("emisor", emisor);
        model.addAttribute("chat", chat);
        model.addAttribute("usuario", emisor);

        model.addAttribute("username", destinatarioUsername);

        return "soloprueba/mensajes.jsp";
    }

}
