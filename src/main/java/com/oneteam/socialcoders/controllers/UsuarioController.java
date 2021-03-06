package com.oneteam.socialcoders.controllers;

import java.security.Principal;

import javax.validation.Valid;

import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioRole;
import com.oneteam.socialcoders.services.ServicioUsuario;
import com.oneteam.socialcoders.validator.UsuarioValidator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsuarioController {
    private final ServicioUsuario servicioUsuario;
    private final UsuarioValidator usuarioValidator;
    private final ServicioRole servicioRole;

    public UsuarioController(ServicioUsuario servicioUsuario, UsuarioValidator usuarioValidator, ServicioRole servicioRole) {
        this.servicioUsuario = servicioUsuario;
        this.usuarioValidator = usuarioValidator;
        this.servicioRole = servicioRole;
    }
    
    @GetMapping("/registration")
    public String registerForm(@ModelAttribute("user") Usuario user) {
        return "registrologin/register.jsp";
    }

    @PostMapping("/registration")
        public String registration(@Valid @ModelAttribute("user") Usuario user, BindingResult result, Model model) {
        usuarioValidator.validate(user, result);
        if(result.hasErrors()) {
            return "registrologin/register.jsp";
        }
        if(servicioUsuario.emailExist(user.getEmail())) {
            FieldError error = new FieldError("email", "email", "Email " + user.getEmail() + " ya se encuentra registrado");
            result.addError(error);
            return "registrologin/register.jsp";
        }  
        if(servicioUsuario.usernameExists(user.getUsername())) {
            FieldError error = new FieldError("username", "username", "Nombre de usuario " + user.getUsername() + " ya se encuentra registrado");
            result.addError(error);
            return "registrologin/register.jsp";
        }
        user.setImagen("pinguino.gif");
        servicioRole.createRol();
        System.out.println("1");
        if(servicioUsuario.validationUsers() < 4){
        System.out.println("2");
            
            servicioUsuario.saveUserWithAdminRole(user);
            return "redirect:/login";
        }
        else{ 
            servicioUsuario.saveWithUserRole(user);
            return "redirect:/login";
        }
    }

    @GetMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Credenciales inv??lidas, por favor intenta de nuevo.");
        }

        if(logout != null) {
            model.addAttribute("logoutMessage", "Has cerrado sesi??n exitosamente.");
        }
        return "registrologin/login.jsp";
    }

    @GetMapping("cambiar/icono")
    public String cambiarIcono(Principal principal, Model model){
        model.addAttribute("username", principal.getName());
        Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        model.addAttribute("usuario", usuario);
        
        return "/usuario/cambiarIcono.jsp";
    }

    @PostMapping("cambiar/icono")
    public String cambiarIcon(@RequestParam(value = "iconon", required = false)String icono, Principal principal){
        if(icono == null){
            return "redirect:/cambiar/icono";
        }
        Usuario usuario = servicioUsuario.findByUsername(principal.getName());
        usuario.setImagen(icono);
        servicioUsuario.saveOrUpdate(usuario);
        return "redirect:/socialcoders/perfil/"+principal.getName();
    }

}
