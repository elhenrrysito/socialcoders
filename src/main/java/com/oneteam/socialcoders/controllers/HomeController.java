package com.oneteam.socialcoders.controllers;

import java.util.HashMap;
import java.util.List;

import javax.xml.stream.events.Comment;

import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.services.ServicioComentario;
import com.oneteam.socialcoders.services.ServicioPost;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    private final ServicioPost servicioPost;
    private final ServicioComentario servicioComentario;
    public HomeController(ServicioPost servicioPost, ServicioComentario servicioComentario){
        this.servicioPost = servicioPost;
        this.servicioComentario = servicioComentario;
    }

    @GetMapping(value = {"/dashboard", "/"})
    public String dashboardPosts(Model model) {
        List<Post> allPosts = servicioPost.buscarPosts();
        model.addAttribute("posts", allPosts);
        return "/post/dashboardPost.jsp";
    }
}
