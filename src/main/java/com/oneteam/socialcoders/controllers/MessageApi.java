package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.oneteam.socialcoders.models.Mensaje;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioMensaje;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mensajes")
public class MessageApi {

    @Autowired
    private ServicioMensaje servicioMensaje;

    @Autowired
    private ServicioUsuario servicioUsuario;



    @PostMapping("/{destinatarioUsername}")
    public String enviarMensaje(@RequestParam(value = "inputMensaje", required = false) String mensaje ,
                    @PathVariable("destinatarioUsername") String destinatarioUsername, Principal principal, Model model) {
            String usernameEmisor = principal.getName();
            Usuario remitente = servicioUsuario.findByUsername(usernameEmisor);
            Usuario destinatario = servicioUsuario.findByUsername(destinatarioUsername);
            System.out.println("Aquiii");
            System.out.println(mensaje.length());
            if(!mensaje.trim().equals("")){
                Mensaje nuevoMensaje = new Mensaje();
                nuevoMensaje.setMessage(mensaje);
                nuevoMensaje.setDestinatario(destinatario);
                nuevoMensaje.setRemitente(remitente);
                servicioMensaje.saveOrUpdate(nuevoMensaje);
            }
            JSONObject json = parseJSON(remitente, destinatario);
            String url = "/mensajes/" + usernameEmisor;
            model.addAttribute("username", usernameEmisor);

            return json.toString();
    }

    @GetMapping("/leer/{destinatarioUsername}")
    public String leerMensajes(@PathVariable("destinatarioUsername") String destinatarioUsername, Principal principal, Model model) {
            String usernameEmisor = principal.getName();
            Usuario remitente = servicioUsuario.findByUsername(usernameEmisor);
            Usuario destinatario = servicioUsuario.findByUsername(destinatarioUsername);
            JSONObject json = parseJSON(remitente, destinatario);
            model.addAttribute("username", usernameEmisor);

            return json.toString();
    }

    private JSONObject parseJSON(Usuario remitente, Usuario destinatario) {
        List<Map<String, String>> mensajes = new ArrayList<>();
        for(Mensaje mensaje : servicioMensaje.getChat(remitente, destinatario)) {
            String fechaMensaje = new SimpleDateFormat("HH:mm").format(mensaje.getCreatedAt());
            mensajes.add(Map.of(fechaMensaje, mensaje.getRemitente().getUsername() + ": " + mensaje.getMessage()));
        }

        try {
            JSONObject json = new JSONObject();
            json.put("mensajes", mensajes);
            return json;
        } catch(JSONException e) {
            e.printStackTrace();
        } 
        return null;
        
    }
}
