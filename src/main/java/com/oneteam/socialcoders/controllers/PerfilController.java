package com.oneteam.socialcoders.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioLenguaje;
import com.oneteam.socialcoders.services.ServicioUsuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/perfil")
public class PerfilController {
    private final ServicioUsuario servicioUsuario;
    private final ServicioLenguaje servicioLenguaje;

    public PerfilController(ServicioUsuario servicioUsuario, ServicioLenguaje servicioLenguaje) {
        this.servicioUsuario = servicioUsuario;
        this.servicioLenguaje = servicioLenguaje;
    }

    @GetMapping("{username}")
    public String verPerfil(@PathVariable("username") String username, Model model) {
        if(!servicioUsuario.usernameExists(username)) {
            return "noEncontrado.jsp";
        } else {
            Usuario usuario = servicioUsuario.findByUsername(username);
            model.addAttribute("usuario", usuario);
            model.addAttribute("us", usuario);
            System.out.println("aaaaaaa");
            return "perfil/perfilUsuario.jsp";
        } 
    }

    @GetMapping("/follow/{username}")
    public String seguir(@PathVariable("username") String username, Model model, Principal principal) {
        String usernameActual = principal.getName(); 
        Usuario seguidor = servicioUsuario.findByUsername(usernameActual);
        Usuario seguido = servicioUsuario.findByUsername(username);
        List<Usuario> seguidos = seguidor.getSeguidos();
        if(seguidos.contains(seguido)) {
            return "redirect:/socialcoders/perfil/" + username;
        } else {
            seguidos.add(seguido);
            servicioUsuario.saveOrUpdate(seguido);
            return "redirect:/socialcoders/perfil/" + username;
        }
    }

    @GetMapping("/unfollow/{username}")
    public String dejarSeguir(@PathVariable("username") String username, Model model, Principal principal) {
        String usernameActual = principal.getName();
        Usuario seguidor = servicioUsuario.findByUsername(usernameActual);
        Usuario seguido = servicioUsuario.findByUsername(username);
        List<Usuario> seguidos = seguidor.getSeguidos();
        if(!seguidos.contains(seguido)) {
            return "redirect:/socialcoders/perfil/" + username;
        } else {
            seguidos.remove(seguido);
            servicioUsuario.saveOrUpdate(seguido);
            return "redirect:/socialcoders/perfil/" + username;
        }
    }
    
    @GetMapping("/seguidos")
    public String listaSeguidos(Model model, Principal principal) {
        String username = principal.getName();
        Usuario usuario = servicioUsuario.findByUsername(username);
        model.addAttribute("listaSeguidos", usuario.getSeguidos());
        return "soloprueba/seguidos.jsp";
    }

    @GetMapping("/editarPerfil")
    public String editar(@ModelAttribute("usuario") Usuario usuario, Model model, Principal principal) {
        String username = principal.getName();
        Usuario usuarioSesion = servicioUsuario.findByUsername(username);
        model.addAttribute("usuarioSesion", usuarioSesion);
        model.addAttribute("lenguajesNoUtilizados", servicioLenguaje.lenguajesNoUtilizados(usuarioSesion));

        return "perfil/editar.jsp";
    }

    @PostMapping("/editarPerfil")
    public String editarPerfil(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result, Model model, Principal principal) {
        String username = principal.getName();
        Usuario usuarioSesion = servicioUsuario.findByUsername(username);
        if(result.hasErrors()) {
            model.addAttribute("usuarioSesion", usuarioSesion);
            return "perfil/editar.jsp";
        } else {
            usuarioSesion.setNombre(usuario.getNombre());
            usuarioSesion.setApellido(usuario.getApellido());
            usuarioSesion.setDescripcion(usuario.getDescripcion());

            if(usuario.getEmail() != null) {
                if(servicioUsuario.emailExist(usuario.getEmail()) && !usuarioSesion.getEmail().equals(usuario.getEmail())) {
                    FieldError error = new FieldError("email", "email", "Email " + usuario.getEmail() + " ya se encuentra registrado");
                    result.addError(error);
                    return "perfil/editar.jsp";
                } else {
                    usuarioSesion.setEmail(usuario.getEmail());
                }
            } 

            if(usuario.getUsername() != null) {
                if(usuario.getUsername().equals(usuarioSesion.getUsername())) {
                    usuarioSesion.setUsername(usuario.getUsername());
                } else if(servicioUsuario.usernameExists(usuario.getUsername())) {
                    FieldError error = new FieldError("username", "username", "Nombre de usuario " + usuario.getUsername() + " ya se encuentra registrado");
                    result.addError(error);
                    return "perfil/editar.jsp";
                } else {
                    usuarioSesion.setEmail(usuario.getEmail());
                }
            } 

            servicioUsuario.saveOrUpdate(usuarioSesion);
            return "redirect:/socialcoders/perfil/" + usuarioSesion.getUsername();
        }

    }

    @GetMapping("/agregarLenguaje")
    public String agregarLenguajeUsuario(@RequestParam("lenguaje") Long idLenguaje, Principal principal, Model model) {
        String username = principal.getName();
        Usuario usuarioSesion = servicioUsuario.findByUsername(username);
            if(servicioLenguaje.findEntityById(idLenguaje) != null) {
                Lenguaje lenguaje = servicioLenguaje.findEntityById(idLenguaje);
                if(usuarioSesion.getLenguajesUsuario().contains(lenguaje)) {
                    return "redirect:/socialcoders/perfil/" + usuarioSesion.getUsername();
                } else {
                    List<Lenguaje> lenguajesUsuario = usuarioSesion.getLenguajesUsuario();
                    lenguajesUsuario.add(lenguaje);
                }
            }
        servicioUsuario.saveOrUpdate(usuarioSesion);
        return "redirect:/perfil/editarPerfil";
    }
    

    @GetMapping("/eliminarLenguaje")
    public String eliminarLenguajeUsuario(@RequestParam("lenguajes") List<String> lenguajes, Principal principal, Model model) {
        String username = principal.getName();
        Usuario usuarioSesion = servicioUsuario.findByUsername(username);
        for (String str : lenguajes) {
            if(servicioLenguaje.findByLenguaje(str) != null) {
                Lenguaje lenguaje = servicioLenguaje.findByLenguaje(str);
                if(!usuarioSesion.getLenguajesUsuario().contains(lenguaje)) {
                    return "redirect:/socialcoders/perfil/" + usuarioSesion.getUsername();
                } else {
                    List<Lenguaje> lenguajesUsuario = usuarioSesion.getLenguajesUsuario();
                    lenguajesUsuario.remove(lenguaje);
                }
            }
        }
        servicioUsuario.saveOrUpdate(usuarioSesion);
        return "redirect:/editarPerfil";
    }
   
}
