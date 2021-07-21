package com.oneteam.socialcoders.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Tag;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioCategoria;
import com.oneteam.socialcoders.services.ServicioLenguaje;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioTag;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class PostController {

    private final ServicioPost servicioPost;
    private final ServicioUsuario servicioUsuario;
    private final ServicioCategoria servicioCategoria;
    private final ServicioLenguaje servicioLenguaje;
    private final ServicioTag servicioTag;

    

   

    public PostController(ServicioPost servicioPost, ServicioUsuario servicioUsuario,
            ServicioCategoria servicioCategoria, ServicioLenguaje servicioLenguaje, ServicioTag servicioTag) {
        this.servicioPost = servicioPost;
        this.servicioUsuario = servicioUsuario;
        this.servicioCategoria = servicioCategoria;
        this.servicioLenguaje = servicioLenguaje;
        this.servicioTag = servicioTag;
    }

    //CREAR POST  1.CREATE

    @GetMapping("nuevo/post")
    public String nuevoPost(@ModelAttribute("post")Post post){

        return "/post/nuevoPost.jsp";
    }

    @PostMapping("nuevo/post")
    public String nuevoPost(
        @Valid @ModelAttribute("post") Post post, 
        BindingResult result, HttpSession session){
        
        if(result.hasErrors()){
            return "/post/nuevoPost.jsp";
        }
        Long id = (long) 1;
        Usuario usuario = servicioUsuario.findEntityById(id);
        Lenguaje lenguaje = servicioLenguaje.findEntityById(id);
        Categoria categoria = servicioCategoria.findEntityById(id);
        Tag tag = servicioTag.findEntityById(id);
        post.setCategoria(categoria);
        post.setCreador(usuario);
        post.setLenguajePost(lenguaje);
        List<Tag> tags = new ArrayList<>();
        tags.add(tag);
        post.setTags(tags); 
        servicioPost.saveOrUpdate(post);
        return "redirect:/dashboard";
    }

    //VER UN POST POR ID 2.READ 
    @GetMapping("post/{id}")
    public String mostrarPost
    (@PathVariable("id")Long id,
    Model model, HttpSession session){
        Post post = servicioPost.findEntityById(id);
        model.addAttribute("post", post);
        //PENDIENTE VERIFICAR NOMBRE DE ATRIBUTO DEL ID DEL USUARIO 
        // Usuario usuario = servicioUsuario.findEntityById((Long)session.getAttribute("usuarioId"));
        // model.addAttribute("usuario", usuario);
        return "/post/post.jsp";

    }


    //EDITAR UN POST VISTA Y CONTROLADOR, TODO APARTE, PARA HACERLO MAS LEGIBLE
    @GetMapping("editar/post/{id}")
    public String editarPost(
        @PathVariable("id") Long id,
        HttpSession session, Model model){

        //PENDIENTE VERIFICAR NOMBRE DE ATRIBUTO DEL ID DEL USUARIO 
        // Usuario usuario = servicioUsuario.findEntityById((Long) session.getAttribute("usuarioId"));
        Post post = servicioPost.findEntityById(id);
        // if(post.getCreador() == usuario){
        model.addAttribute("post", post);
        // model.addAttribute("usuario", usuario);
        return "/post/editarPost.jsp";
        // }
        // return "/dashboard";
    }

    @PutMapping("editar/post/{id}")
    public String editarPost(
        @Valid @ModelAttribute("post") Post post,
        BindingResult result,
        @PathVariable("id") Long id){
        if(result.hasErrors()){
            return "/post/editarPost.jsp";
        }

        Post postFinal = servicioPost.findEntityById(id);
        postFinal.setCuerpo(post.getCuerpo());
        servicioPost.saveOrUpdate(postFinal);
        return "redirect:/post/"+ id;    
        }
 

    //ELIMINAR UN POST
    
    @GetMapping("eliminar/post/{id}")
    public String eliminarPost(
        @PathVariable("id") Long id,
        HttpSession session){
        Post postFinal = servicioPost.findEntityById(id);
        servicioPost.deleteEntity(id);
        return "redirect:/dashboard";

        }


}
