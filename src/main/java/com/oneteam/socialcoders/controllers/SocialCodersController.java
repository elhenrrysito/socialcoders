package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.List;

import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/socialcoders")
public class SocialCodersController {
    private final ServicioUsuario servicioUsuario;
    private final ServicioPost servicioPost;
    
    public SocialCodersController(ServicioUsuario servicioUsuario, ServicioPost servicioPost) {
        this.servicioUsuario = servicioUsuario;
        this.servicioPost = servicioPost;
    }

    @GetMapping("/post/{id}")
    public String verPost(@PathVariable("idPost") Long idPost, Model model) {
        Post post = servicioPost.findEntityById(idPost);
        model.addAttribute("post", post);
        return "socialcoders/post.jsp"; 
    }

    @GetMapping("/perfil/{usernamePerfil}")
    public String verUsuario(@PathVariable("usernamePerfil") String usernamePerfil, Model model, Principal principal) {
        if(!servicioUsuario.usernameExists(usernamePerfil)) {
            return "noEncontrado.jsp";
        } else {
            String usernameSesion = principal.getName();
            Usuario usuarioSesion = servicioUsuario.findByUsername(usernameSesion);
            Usuario usuarioPerfil = servicioUsuario.findByUsername(usernamePerfil);
            model.addAttribute("postsUsuario", usuarioPerfil.getPostRealizados());
            model.addAttribute("usuarioPerfil", usuarioPerfil);
            model.addAttribute("usuarioSesion", usuarioSesion);
            return "perfil/perfil.jsp";
        }
    }

    @GetMapping("/buscar")
    public String buscar(@RequestParam("busqueda") String busqueda, Model model) {
        List<Usuario> busquedaUsuarios = servicioUsuario.allByNombre(busqueda);
        List<Post> busquedaPosts = servicioPost.allByTitulo(busqueda);
        model.addAttribute("usuarios", busquedaUsuarios);
        model.addAttribute("posts", busquedaPosts);
        return "asmkdaksd.jsp";
    }

    @GetMapping("/buscar/post")
    public String buscarPorPost(@RequestParam("busqueda") String busqueda, Model model) {
        List<Post> busquedaPosts = servicioPost.allByTitulo(busqueda);
        model.addAttribute("posts", busquedaPosts);
        return "azasds.jsp";
    }

    @GetMapping("/buscar/personas")
    public String buscarPorPersonas(@RequestParam("busqueda") String busqueda, Model model) {
        List<Usuario> busquedaUsuarios = servicioUsuario.allByNombre(busqueda);
        model.addAttribute("usuarios", busquedaUsuarios);
        return "aksjdkjasd.jsp";
    }
}
