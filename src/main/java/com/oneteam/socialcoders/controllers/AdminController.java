package com.oneteam.socialcoders.controllers;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.services.ServicioCategoria;
import com.oneteam.socialcoders.services.ServicioLenguaje;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioTag;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final ServicioPost servicioPost;
    private final ServicioUsuario servicioUsuario;
    private final ServicioCategoria servicioCategoria;
    private final ServicioLenguaje servicioLenguaje;
    private final ServicioTag servicioTag;

    public AdminController(ServicioPost servicioPost, ServicioUsuario servicioUsuario,
            ServicioCategoria servicioCategoria, ServicioLenguaje servicioLenguaje, ServicioTag servicioTag) {
        this.servicioPost = servicioPost;
        this.servicioUsuario = servicioUsuario;
        this.servicioCategoria = servicioCategoria;
        this.servicioLenguaje = servicioLenguaje;
        this.servicioTag = servicioTag;
    }

    @GetMapping("")
    public String adminDashboard(@ModelAttribute("categoriaA") Categoria categoria, @ModelAttribute("lenguajeE") Lenguaje lenguaje){

        return "/admin/admin.jsp";
    }



}
