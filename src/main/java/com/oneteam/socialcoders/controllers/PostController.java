package com.oneteam.socialcoders.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        
        //AGREGAR IMAGEN OPCIONAL
        if(imagen != null){
            Path directorioImagenes = Paths.get("src//main//resources//static/imagenes");
            String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath() + "/" +principal.getName();
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
        List<String> errores = new ArrayList<>();
        //AGREGAR LENGUAJES
            Lenguaje lenguajeP = servicioLenguaje.findByLenguajee(lenguaje);
            post.setLenguajePost(lenguajeP);
        //AGREGAR CATEGORIA
        
       
            
            Categoria categoriaP = servicioCategoria.findByCategoria(categoria);
            post.setCategoria(categoriaP);
        
        //Tags 
        if(postTag != null){
            List<String> items = Arrays.asList(postTag.trim().split("\\s*,\\s*")); 
            int cantidadComas = postTag.replaceAll("[^,]", "").length();
            if(cantidadComas > 2) {
                errores.add("Solo 3 tags por Preguntas, SEPARALOS POR UNA (,) PLISs");
            }
            if(servicioPost.verificador(post)) {
                errores.add("Este Post ya existe");
            }
            if(postTag.length() == 0) {
                errores.add("Debes incluir al menos 1 Tag");
            }
            if(errores.size() > 0){
                flash.addFlashAttribute("errors", errores);
                return "redirect:/nuevo/post";
            }
            
            else {
                servicioPost.saveOrUpdate(post);
                
                ArrayList<Tag> tags = new ArrayList<Tag>();
                for(int i = 0; i<items.size(); i++) {
                    String tagTemporal = items.get(i);
                    if(servicioTag.validation(tagTemporal)) {
                        Tag tag = servicioTag.buscarPorTag(tagTemporal);
                        tags.add(tag);
                    }
                    else {
                        tags.add(servicioTag.createTag(items.get(i)));
                    }
                }
                post.setTags(tags);
                servicioPost.saveOrUpdate(post);
                return "redirect:/post/" + post.getId();
            }
        }
        
        else{
            servicioPost.saveOrUpdate(post);
            return "redirect:/post/" + post.getId();
        }
        

    }


    //VER UN POST POR ID 2.READ 
    @GetMapping("post/{id}")
    public String mostrarPost
    (@ModelAttribute("comentario") Comentario comentario, @PathVariable("id")Long id, 
    Model model, HttpSession session){
        Post post = servicioPost.findEntityById(id);
        model.addAttribute("post", post);
        //PENDIENTE VERIFICAR NOMBRE DE ATRIBUTO DEL ID DEL USUARIO 
        // Usuario usuario = servicioUsuario.findEntityById((Long)session.getAttribute("usuarioId"));
        // model.addAttribute("usuario", usuario);
        return "/post/mostrarPost.jsp";

    }


    //EDITAR UN POST VISTA Y CONTROLADOR, TODO APARTE, PARA HACERLO MAS LEGIBLE
    @GetMapping("editar/post/{id}")
    public String editarPost(
        @PathVariable("id") Long id,
        HttpSession session, Model model){
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
        @PathVariable("id") Long id){
        if(result.hasErrors()){
            return "/post/nuevoPost.jsp";
        }
        servicioPost.saveOrUpdate(post);
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

        @GetMapping("/like/{postId}")
        public String likePost(@PathVariable("postId") Long id, Principal principal) {
            String username = principal.getName();
            Usuario usuarioSesion = servicioUsuario.findByUsername(username); 
            Post estePost = servicioPost.findEntityById(id);
            List<Usuario> usuariosLikeados = estePost.getReaccionesUsuarios();
            if(!usuariosLikeados.contains(usuarioSesion)){
                usuariosLikeados.add(usuarioSesion);
                estePost.setReaccionesUsuarios(usuariosLikeados);
                servicioPost.saveOrUpdate(estePost);
            }
            // for (Usuario usuario : usuariosLikeados) {
            //     if(!usuario.getUsername().equals(principal.getName())){
            //         List<Post> postLikeados = usuario.getReaccion();
            //         postLikeados.add(estePost);
            //         usuario.setReaccion(postLikeados);
            //         servicioUsuario.saveOrUpdate(usuario);
            //         usuariosLikeados.add(usuario);
            //     }
            // }
            return "redirect:/";
        }
        

}
