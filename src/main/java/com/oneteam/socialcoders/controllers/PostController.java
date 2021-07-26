package com.oneteam.socialcoders.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Tag;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioCategoria;
import com.oneteam.socialcoders.services.ServicioComentario;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PostController {

    private final ServicioPost servicioPost;
    private final ServicioUsuario servicioUsuario;
    private final ServicioCategoria servicioCategoria;
    private final ServicioLenguaje servicioLenguaje;
    private final ServicioTag servicioTag;
    private final ServicioComentario servicioComentario;

    


    //CREAR POST  1.CREATE

    public PostController(ServicioPost servicioPost, ServicioUsuario servicioUsuario,
            ServicioCategoria servicioCategoria, ServicioLenguaje servicioLenguaje, ServicioTag servicioTag,
            ServicioComentario servicioComentario) {
        this.servicioPost = servicioPost;
        this.servicioUsuario = servicioUsuario;
        this.servicioCategoria = servicioCategoria;
        this.servicioLenguaje = servicioLenguaje;
        this.servicioTag = servicioTag;
        this.servicioComentario = servicioComentario;
    }

    @GetMapping("nuevo/post")
    public String nuevoPost(@ModelAttribute("post")Post post){

        return "/post/nuevoPost.jsp";
    }

    @PostMapping("nuevo/post")
    public String nuevoPost(
        @Valid @ModelAttribute("post") Post post, 
        BindingResult result,
        @RequestParam(value="file", required=false) MultipartFile imagen){
        
        if(result.hasErrors()){
            return "/post/nuevoPost.jsp";
        }
            Long id = (long) 1;
            Usuario usuario = servicioUsuario.findEntityById(id);
            Lenguaje lenguaje = servicioLenguaje.findEntityById(id);
            Categoria categoria = servicioCategoria.findEntityById(id);
            Tag tag = servicioTag.findEntityById(id);
            Comentario comentario = servicioComentario.findEntityById(id+4);

            // post.agregarLike(usuario);
            post.setCategoria(categoria);
            post.setCreador(usuario);
            post.setLenguajePost(lenguaje);
            
        List<Tag> tags = new ArrayList<>();
        tags.add(tag);
        post.setTags(tags); 

            //AGREGAR IMAGEN OPCIONAL
            if(imagen != null){
                Path directorioImagenes = Paths.get("src//main//resources//static/imagenes");
                String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath() + "/" +usuario.getId();
                File directorio = new File(rutaAbsoluta);
                if(directorio.exists() == false){
                    directorio.mkdir();
                }

                try {
                    byte[] bytesImg = imagen.getBytes();
                    Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + imagen.getOriginalFilename());
                    Files.write(rutaCompleta, bytesImg);

                    post.setImagenPost(imagen.getOriginalFilename());
                } catch (IOException e) {
                    e.printStackTrace();
                }
                    

            }

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
        @PathVariable("id") Long id){
        servicioPost.deleteEntity(id);
        return "redirect:/dashboard";
        }

        // @GetMapping("prueba/{idpost}")
        // public String iji(@PathVariable("idpost")Long idpost, Principal principal){
            
        //     Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        //     Post postFinal = servicioPost.findEntityById(idpost);
        //     postFinal.agregarLike(usuario);
        //     // usuario.setPost(postFinal);
        //     servicioPost.saveOrUpdate(postFinal);
        //     // System.out.println(postFinal.getReaccionesUsuarios().get(0).getNombre());
        //     return "redirect:/dashboard";
        // }

        // @GetMapping("imprimir")
        // public String imprimir(Principal principal){
        //     Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        //     System.out.println(usuario.getReaccion().size());
        //     return "redirect:/dashboard";
        // }





}
