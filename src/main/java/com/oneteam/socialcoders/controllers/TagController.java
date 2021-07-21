package com.oneteam.socialcoders.controllers;

import java.util.List;

import javax.validation.Valid;

import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Tag;
import com.oneteam.socialcoders.services.ServicioPost;
import com.oneteam.socialcoders.services.ServicioTag;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tag")
public class TagController{
    
    //////////// Dependencias ////////////
    
    private final ServicioTag servicioTag;
    private final ServicioPost servicioPost;
    public TagController(ServicioTag servicioTag, ServicioPost servicioPost){
        this.servicioTag = servicioTag;
        this.servicioPost = servicioPost;
    }

    //////////// Crear o Asignar Tag ////////////

    @GetMapping("/nuevo")
    public String nuevoTagVista(@ModelAttribute("tag") Tag tag, @PathVariable("id") Long postId){
        return "";
    }

    @PostMapping("/nuevo/{postId}")
    public String nuevoTagPost(@Valid @ModelAttribute("tag") Tag tag, 
                                BindingResult result, @PathVariable("id") Long postId){
        if(result.hasErrors()){
            return "testTag.jsp";
        }
        
        else{
            List<Tag> listaTags = servicioTag.buscarTags();
            Post estePost = servicioPost.findEntityById(postId);
        
            for (Tag tagEspecifico : listaTags) {
                if(tagEspecifico.getTag().equals(tag.getTag())){
                    List<Tag> listaTagsPost = estePost.getTags();
                    listaTagsPost.add(tagEspecifico);
                    servicioPost.saveOrUpdate(estePost);
                }
                else{
                    Tag nuevoTag = servicioTag.saveOrUpdate(tag);
                    List<Tag> listaTagsPost = estePost.getTags();
                    listaTagsPost.add(nuevoTag);
                    servicioPost.saveOrUpdate(estePost);
                }
            }
        }
        return "testTag.jsp";
    }
}
