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

    @GetMapping("/alosi")
    public String dashboardPosts(Model model){
        List<Post> allPosts = servicioPost.buscarPosts();
        // List<Comentario> comentariosPost = servicioComentario.buscarPorListaPost(allPosts);
        
        // IDEA 1
        // for (Comentario comentario : comentariosPost) {
        //     for (Post post : allPosts) {
        //         if(post.getListaComentarios().contains(comentario)){
        //             List<Comentario> comentarioski = post.getListaComentarios();
        //             model.addAttribute("comentarios", comentarioski);
        //         }
        //     }
        // }
        // IDEA 2
        // for (Post post : allPosts) {
        //     for(Comentario comentario : comentariosPost){
        //         if(comentario.getPost().equals(post)){
        //             List<Comentario> comentariosList = post.getListaComentarios();
        //             model.addAttribute("comentarios", comentariosList);
        //         }
        //     }
        // }
        //IDEA 3
        // for (Post post : allPosts) {
        //     if(post.getListaComentarios().containsAll(comentariosPost)){
        //         List<Comentario> comentarioski = post.getListaComentarios();
        //         model.addAttribute("comentarios", comentarioski);
        //     }
        // }
        //IDEA 4
        // for (Post post : allPosts) {
        //     for (Comentario comentario : comentariosPost){
        //         if(comentario.getPost().equals(post)){
        //             List<Comentario> estasi = post.getListaComentarios();
        //             if(post.getListaComentarios().containsAll(estasi)){
        //                 model.addAttribute("comentarios", estasi);
        //             }
        //         }
        //     }
        // }
        // IDEA 5
        // HashMap<Object, List<Comentario>> dicccionario = new HashMap<>();
        // for (Post p : allPosts) {
        //     List<Comentario> comentarios = p.getListaComentarios();
        //         dicccionario.put(comentarios.get(0).getUsuario().getUsername(), comentarios);
        //     }
        //     model.addAttribute("comentarios", dicccionario); 
        model.addAttribute("posts", allPosts);
        return "/post/dashboardPost.jsp";
    }
}
