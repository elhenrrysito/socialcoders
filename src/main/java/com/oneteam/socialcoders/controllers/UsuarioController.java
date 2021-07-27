package com.oneteam.socialcoders.controllers;

import java.security.Principal;

import javax.validation.Valid;

import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.services.ServicioUsuario;
import com.oneteam.socialcoders.validator.UsuarioValidator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsuarioController {
    private final ServicioUsuario servicioUsuario;
    private final UsuarioValidator usuarioValidator;

    public UsuarioController(ServicioUsuario servicioUsuario, UsuarioValidator usuarioValidator) {
        this.servicioUsuario = servicioUsuario;
        this.usuarioValidator = usuarioValidator;
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
        
        servicioUsuario.saveWithUserRole(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Credenciales inválidas, por favor intenta de nuevo.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Has cerrado sesión exitosamente.");
        }
        return "registrologin/login.jsp";
    }

}
