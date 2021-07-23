package com.oneteam.socialcoders.controllers;

import java.util.List;

import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.services.ServicioPost;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    private final ServicioPost servicioPost;
    public HomeController(ServicioPost servicioPost){
        this.servicioPost = servicioPost;
    }

    @GetMapping("/alosi")
    public String dashboardPosts(Model model){
        List<Post> allPosts = servicioPost.buscarPosts();
        model.addAttribute("posts", allPosts);
        return "/post/dashboardPost.jsp";
    }
}
