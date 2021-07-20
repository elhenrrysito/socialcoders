package com.oneteam.socialcoders.validator;

import com.oneteam.socialcoders.models.Usuario;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UsuarioValidator implements Validator{
 
    // 1
    @Override
    public boolean supports(Class<?> clazz) {
        return Usuario.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object target, Errors errors) {
        Usuario usuario  = (Usuario) target;
        
        if (!usuario.getPasswordConfirmation().equals(usuario.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }         
    }
}
