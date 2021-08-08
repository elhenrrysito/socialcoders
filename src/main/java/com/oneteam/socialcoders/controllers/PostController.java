package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Comentario;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String nuevoPost(@ModelAttribute("post")Post post, Model model, Principal principal){
        String userName = principal.getName();
        Usuario usuario = servicioUsuario.findByUsername(userName);
        model.addAttribute("method", "POST");
        model.addAttribute("usuario", usuario);
        return "/post/nuevoPost.jsp";
    }

    @PostMapping("nuevo/post")
    public String nuevoPost(
        @Valid @ModelAttribute("post") Post post, 
        BindingResult result, Principal principal,
        @RequestParam(value="file", required=false) MultipartFile imagen,
        @RequestParam(value="tagsP", required=false) String postTag, RedirectAttributes flash,
        @RequestParam(name="lenguajeP", required=false)String lenguaje,
        @RequestParam(name="categoria", required=false) String categoria){
            
            if(result.hasErrors()){
                return "/post/nuevoPost.jsp";
            } 
            
            // //AGREGAR IMAGEN OPCIONAL
            // if(imagen != null){
                //     Path directorioImagenes = Paths.get("src//main//resources//static//imagenes/post");
                //     String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath() + "/" + post.getTitulo();
                //     File directorio = new File(rutaAbsoluta);
                //     if(directorio.exists() == false){
                    //         directorio.mkdir();
                    //     }
                    
                    //     try {
                        //         byte[] bytesImg = imagen.getBytes();
                        //         Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + imagen.getOriginalFilename());
                        //         Files.write(rutaCompleta, bytesImg);
                        
                        //         post.setImagenPost(imagen.getOriginalFilename());
                        //     } catch (IOException e) {
                            //         e.printStackTrace();
                            //     }
                            // }
                            
        Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        
        //AGREGAR LENGUAJES
        Lenguaje lenguajeP = servicioLenguaje.findByLenguaje(lenguaje);
        post.setLenguajePost(lenguajeP);
        //AGREGAR CATEGORIA
        
        Categoria categoriaP = servicioCategoria.findByCategoria(categoria);
        post.setCategoria(categoriaP);
        
        //Tags 
        if(postTag != null){
            List<String> items = Arrays.asList(postTag.trim().split("\\s*,\\s*")); 
            List<String> errores = servicioPost.erroresEnTags(postTag, post);
            
            if(errores.size() > 0){
                flash.addFlashAttribute("errors", errores);
                return "redirect:/nuevo/post";
            } else {
                servicioPost.saveOrUpdate(post);
                
                List<Tag> tags = servicioTag.agregarTags(items);
                //Set Creador
                post.setCreador(usuario);
                post.setTags(tags);
            }
        } 

        post.setCreador(usuario);
        servicioPost.saveOrUpdate(post);

        if(imagen != null) {
            String url = "archivos/" + usuario.getId() + "/" + post.getId() + "/";
            servicioPost.subirImagen(imagen, url);
            System.out.println("Imagen: " + imagen);
            post.setImagenPost(url + imagen.getOriginalFilename());
            servicioPost.saveOrUpdate(post);
        }

        return "redirect:/post/" + post.getId();
    }
    
    
    //VER UN POST POR ID 2.READ 
    @GetMapping("post/{id}")
    public String mostrarPost
    (@ModelAttribute("comentario") Comentario comentario, @PathVariable("id")Long id, 
    Model model, Principal principal){
        Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        model.addAttribute("usuario", usuario);
        Post post = servicioPost.findEntityById(id);
        model.addAttribute("post", post);
        //PENDIENTE VERIFICAR NOMBRE DE ATRIBUTO DEL ID DEL USUARIO 
        // Usuario usuarios = servicioUsuario.findEntityById((Long)session.getAttribute("usuarioId"));
        // model.addAttribute("usuarios", usuarios);
        return "/post/mostrarPost.jsp";

    }


    //EDITAR UN POST VISTA Y CONTROLADOR, TODO APARTE, PARA HACERLO MAS LEGIBLE
    @GetMapping("editar/post/{id}")
    public String editarPost(
        @PathVariable("id") Long id,
        Model model){
        model.addAttribute("method", "PUT");
        
        Post post = servicioPost.findEntityById(id);
        model.addAttribute("post", post);
        model.addAttribute("numero", 1);
        return "/post/nuevoPost.jsp";
    }

    @PutMapping("editar/post/{id}")
    public String editarPost(
        @Valid @ModelAttribute("post") Post post,
        BindingResult result,
        @PathVariable("id") Long id,
        @RequestParam("tagsP")String postTag,
        RedirectAttributes flash, Principal principal){
        if(result.hasErrors()){
            return "/post/nuevoPost.jsp";
        }

        //Tags
        List<String> errores = new ArrayList<>();
        if(postTag != null){
            List<String> items = Arrays.asList(postTag.trim().split("\\s*,\\s*")); 
            if(errores.size() > 0){
                flash.addFlashAttribute("errors", errores);
                return "redirect:/nuevo/post";
            }
            else {
                servicioPost.saveOrUpdate(post);
                
                List<Tag> tags = servicioTag.agregarTags(items);
                //Set Creador
                Usuario usuario = servicioUsuario.findByUsername(principal.getName());
                post.setCreador(usuario);
                post.setTags(tags);
                servicioPost.saveOrUpdate(post);
                return "redirect:/post/" + post.getId();
            }
        }
        else{
            //Set Creador
            Usuario usuario = servicioUsuario.findByUsername(principal.getName());
            post.setCreador(usuario);
            servicioPost.saveOrUpdate(post);
            return "redirect:/post/" + post.getId();
        }
    
    }
    //ELIMINAR UN POST
    
    @GetMapping("eliminar/post/{id}")
    public String eliminarPost(
        @PathVariable("id") Long id,Principal principal){
        Post post = servicioPost.findEntityById(id);
        Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        String nombre = usuario.getNombre();
        if(post.getCreador().getNombre() == nombre){
            servicioPost.deleteEntity(id);
            return "redirect:/dashboard";
        }
        return "redirect:/dashboard";
    }

    @GetMapping("/like/{postId}")
    @ResponseBody
    public int likePost(@PathVariable("postId") Long id, Principal principal) {
        String username = principal.getName();
        Usuario usuarioSesion = servicioUsuario.findByUsername(username); 
        Post estePost = servicioPost.findEntityById(id);
        List<Usuario> usuariosLikeados = estePost.getReaccionesUsuarios();
        if(!usuariosLikeados.contains(usuarioSesion)){
            usuariosLikeados.add(usuarioSesion);
            estePost.setReaccionesUsuarios(usuariosLikeados);
            servicioPost.saveOrUpdate(estePost);

        }

        return estePost.getReaccionesUsuarios().size();
    }

    @GetMapping("/dislike/{postId}")
    @ResponseBody
    public int dislikePost(@PathVariable("postId") Long id, Principal principal){
        String username = principal.getName();
        Usuario usuarioSesion = servicioUsuario.findByUsername(username); 
        Post estePost = servicioPost.findEntityById(id);
        List<Usuario> usuariosLikeados = estePost.getReaccionesUsuarios();
        if(usuariosLikeados.contains(usuarioSesion)){
            usuariosLikeados.remove(usuarioSesion);
            estePost.setReaccionesUsuarios(usuariosLikeados);
            servicioPost.saveOrUpdate(estePost);
        }
        return estePost.getReaccionesUsuarios().size();
    } 
}
