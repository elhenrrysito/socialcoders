package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;
import javax.xml.stream.events.Comment;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioCategoria;
import com.oneteam.socialcoders.services.ServicioComentario;
import com.oneteam.socialcoders.services.ServicioLenguaje;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    
    private final ServicioPost servicioPost;
    private final ServicioComentario servicioComentario;
    private final ServicioCategoria servicioCategoria;
    private final ServicioUsuario servicioUsuario;
    private final ServicioLenguaje servicioLenguaje;
    public HomeController(ServicioPost servicioPost, ServicioComentario servicioComentario, 
                        ServicioCategoria servicioCategoria, ServicioUsuario servicioUsuario,
                        ServicioLenguaje servicioLenguaje){
        this.servicioPost = servicioPost;
        this.servicioComentario = servicioComentario;
        this.servicioCategoria = servicioCategoria;
        this.servicioUsuario = servicioUsuario;
        this.servicioLenguaje = servicioLenguaje;
    }

    @GetMapping(value = {"/dashboard", "/"})
    public String dashboardPosts(@ModelAttribute("nuevoComentario") Comentario nuevoComentario ,Model model) {
        List<Post> allPosts = servicioPost.buscarPosts();
        List<Lenguaje> todosLenguajes = servicioLenguaje.allEntitys();
        model.addAttribute("lenguajes", todosLenguajes);
        model.addAttribute("posts", allPosts);
        return "/post/dashboardPost.jsp";
    }

    @GetMapping("/socialCoders/memes")
    public String dashboardMemes(@ModelAttribute("nuevoComentario") Comentario nuevoComentario, Model model){
        Categoria c = servicioCategoria.buscarPorNombre("Memes");
        List<Post> postsMemes = servicioPost.buscarPorCategoria(c);
        List<Lenguaje> todosLenguajes = servicioLenguaje.allEntitys();
        model.addAttribute("lenguajes", todosLenguajes);
        model.addAttribute("posts", postsMemes);
        return "/post/dashboardPost.jsp";
    }

    @GetMapping("/socialCoders/preguntas")
    public String dashboardPreguntas(@ModelAttribute("nuevoComentario") Comentario nuevoComentario, Model model){
        Categoria c = servicioCategoria.buscarPorNombre("Preguntas");
        List<Post> postsPreguntas = servicioPost.buscarPorCategoria(c);
        List<Lenguaje> todosLenguajes = servicioLenguaje.allEntitys();
        model.addAttribute("lenguajes", todosLenguajes);
        model.addAttribute("posts", postsPreguntas);
        return "/post/dashboardPost.jsp";
    }

    @GetMapping("/socialCoders/seguidos")
    public String dashboardSeguidos(@ModelAttribute("nuevoComentario") Comentario nuevoComentario, Model model, Principal principal){
        Usuario esteUsuario = servicioUsuario.findByUsername(principal.getName());
        List<Usuario> seguidos = esteUsuario.getSeguidos();
        List<Post> postsSeguidos = servicioPost.buscarPorSeguidos(seguidos);
        List<Lenguaje> todosLenguajes = servicioLenguaje.allEntitys();
        model.addAttribute("lenguajes", todosLenguajes);
        model.addAttribute("posts", postsSeguidos);
        return "/post/dashboardPost.jsp";
    }

    @GetMapping("/socialCoders/{lenguaje}")
    public String dashboardLenguaje(@ModelAttribute("nuevoComentario") Comentario nuevoComentario, 
                                    Model model, @PathVariable("lenguaje") Lenguaje lenguaje){
        List<Lenguaje> todosLenguajes = servicioLenguaje.allEntitys();
        List<Post> postsLenguaje = servicioPost.buscarPorLenguaje(lenguaje);
        model.addAttribute("lenguajes", todosLenguajes);
        model.addAttribute("posts", postsLenguaje);
        return "/post/dashboardPost.jsp";
    }
}
