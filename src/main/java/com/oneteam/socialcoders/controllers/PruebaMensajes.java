package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import com.oneteam.socialcoders.models.Mensaje;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioMensaje;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PruebaMensajes {
    

    private ServicioMensaje servicioMensaje;
    private ServicioUsuario servicioUsuario;
    
    public PruebaMensajes(ServicioMensaje servicioMensaje, ServicioUsuario servicioUsuario) {
        this.servicioMensaje = servicioMensaje;
        this.servicioUsuario = servicioUsuario;
    }


    @GetMapping("/mensajes")
        public String mensajes(@ModelAttribute("mensaje") Mensaje mensaje, Principal principal, Model model){
            Usuario usuario = servicioUsuario.findByUsername(principal.getName());
            List<Mensaje> mensajes = servicioMensaje.allEntitys();
            model.addAttribute("mensajes", mensajes);

            return "/mensajes/mensaje.jsp";
        
        }

    @PostMapping("nuevo/mensaje/para/{idDestinatario}")
    public String nuevoMensaje(@Valid @ModelAttribute ("mensaje") Mensaje mensaje,BindingResult result,@PathVariable("idDestinatario") Long id ,Principal principal){
        Usuario remitente = servicioUsuario.findByUsername(principal.getName());
        if(result.hasErrors()){
            return "mensaje.jsp";
        }
        Usuario destinatario = servicioUsuario.findEntityById(id);
        mensaje.setRemitente(remitente);
        mensaje.setDestinatario(destinatario);

        remitente.setMensajeEnviado(mensaje);
        destinatario.setMensajeRecibido(mensaje);

        servicioMensaje.saveOrUpdate(mensaje);

        return "redirect:/mensajes";
    }    


}
