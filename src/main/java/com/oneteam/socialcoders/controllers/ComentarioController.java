package com.oneteam.socialcoders.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioComentario;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comentario")
public class ComentarioController {
    private final ServicioComentario servicioComentario;
    private final ServicioPost servicioPost;
    private final ServicioUsuario servicioUsuario;

    public ComentarioController(ServicioComentario servicioComentario, ServicioPost servicioPost,
            ServicioUsuario servicioUsuario) {
        this.servicioComentario = servicioComentario;
        this.servicioPost = servicioPost;
        this.servicioUsuario = servicioUsuario;
    }

    // @GetMapping("/{idPost}")
    // public String comentario(@ModelAttribute("nuevoComentario") Comentario nuevoComentario, @PathVariable("idPost") Long idPost,
    //                         Model model, Principal principal) {
        
    //     String username = principal.getName();
    //     Usuario usuario = servicioUsuario.findByUsername(username);
    //     Post post = servicioPost.findEntityById(idPost);

    //     model.addAttribute("post", post);
    //     model.addAttribute("usuario", usuario);
    //     return "soloprueba/pruebaComentario.jsp";
    // }

    @PostMapping("/{idPost}")
    public String agregarComentario(@Valid @ModelAttribute("nuevoComentario") Comentario nuevoComentario, 
                                    BindingResult result, @PathVariable("idPost") Long idPost, Model model, Principal principal) {
        String username = principal.getName();
        Usuario usuario = servicioUsuario.findByUsername(username);
        Post post = servicioPost.findEntityById(idPost);
        if(result.hasErrors()) {
            model.addAttribute("post", post);
            model.addAttribute("usuario", usuario);
            return "soloprueba/pruebaComentario.jsp";
        } else {
            nuevoComentario.setPost(post);
            nuevoComentario.setUsuario(usuario);
            servicioComentario.saveOrUpdate(nuevoComentario);
        }

        return "redirect:/siFunciona";
    }

    @GetMapping("/modificar/{idComentario}")
    public String modificar(@ModelAttribute("comentarioModificado") Comentario comentarioModificado, @PathVariable("idComentario") Long idComentario,
                            Model model) {
        
        Comentario comentario = servicioComentario.findEntityById(idComentario);
        model.addAttribute("comentario", comentario);
        return "soloprueba/pruebaComentario.jsp";
    }

    @PutMapping("/modificar/{idComentario}")
    public String modificarComentario(@Valid @ModelAttribute("comentarioModificado") Comentario comentarioModificado, 
                                    BindingResult result, @PathVariable("idComentario") Long idComentario, Model model) {
        Comentario comentario = servicioComentario.findEntityById(idComentario);
        if(result.hasErrors()) {
            model.addAttribute("comentario", comentario);
            return "soloprueba/modificarComentario.jsp";
        } else {
            comentario.setComentario(comentarioModificado.getComentario()); 
            servicioComentario.saveOrUpdate(comentario);

            return "redirect:/siModifica";
        }

    }

    @GetMapping("/eliminar/{idComentario}")
    public String eliminarComentario(@PathVariable("idComentario") Long idComentario) {
        Comentario comentario = servicioComentario.findEntityById(idComentario);
        comentario.setUsuario(null);
        comentario.setPost(null);
        servicioComentario.delete(comentario);
        return "redirect:/borrando";
    }



}
