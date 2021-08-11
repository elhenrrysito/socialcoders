package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.Arrays;

import java.util.List;

import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/search")
public class BuscadorController {
    private final ServicioPost servicioPost;
    private final ServicioUsuario servicioUsuario;

    public BuscadorController(ServicioPost servicioPost, ServicioUsuario servicioUsuario) {
        this.servicioPost = servicioPost;
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("buscador")
    public String busca() {
        return "buscador/buscador.jsp";
    }

    @GetMapping("")
    public String buscador(@RequestParam("q") String busqueda, Model model, Principal principal) {
        Usuario esteUsuario = servicioUsuario.findByUsername(principal.getName());
        List<Post> posts =  servicioPost.allByTitulo(busqueda);
        List<Usuario> usuarios = servicioUsuario.allByNombre(busqueda);
        model.addAttribute("usuario", esteUsuario);
        model.addAttribute("posts", posts);
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("busqueda", busqueda);
        model.addAttribute("filtro", "todo");

        return "buscador/resultadoBusqueda.jsp";
    }

    @GetMapping("/posts")
    public String buscadorPost(@RequestParam("q") String busqueda, Model model, Principal principal) {
        Usuario esteUsuario = servicioUsuario.findByUsername(principal.getName());
        List<Post> posts = servicioPost.allByTitulo(busqueda);
        model.addAttribute("usuario", esteUsuario);
        model.addAttribute("posts", posts);
        model.addAttribute("filtro", "post");
        model.addAttribute("busqueda", busqueda);

        return "buscador/resultadoBusqueda.jsp";
    }

    @GetMapping("/usuarios")
    public String buscadorUsuario(@RequestParam("q") String busqueda, Model model, Principal principal) {
        Usuario esteUsuario = servicioUsuario.findByUsername(principal.getName());
        List<Usuario> usuarios = servicioUsuario.allByNombre(busqueda);
        model.addAttribute("usuario", esteUsuario);
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("filtro", "usuario");
        model.addAttribute("busqueda", busqueda);

        return "buscador/resultadoBusqueda.jsp";
    }
}
