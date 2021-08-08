package com.oneteam.socialcoders.services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.repositories.RepositorioPost;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ServicioPost extends ServicioBase<Post> {
    private final RepositorioPost repositorioPost;

    public ServicioPost(RepositorioPost repositorioPost) {
        super(repositorioPost);
        this.repositorioPost = repositorioPost;
    }
    
    public List<Post> buscarPosts(){
        return repositorioPost.findAll();
    }

    public boolean verificador(Post p){
        return repositorioPost.existsPostByTitulo(p.getTitulo());
    }
  
    public List<Post> allByTitulo(String titulo) {
        return repositorioPost.findAllByTituloContaining(titulo);
    }

    public List<Post> buscarPorCategoria(Categoria c){
        return repositorioPost.findByCategoria(c);
    }

    public List<Post> buscarPorSeguidos(List<Usuario> u){
        return repositorioPost.findByCreadorIn(u);
    }

    public List<Post> buscarPorLenguaje(Lenguaje l){
        return repositorioPost.findByLenguajePost(l);
    }

    public List<String> erroresEnTags(String postTag, Post post) {
        List<String> errores = new ArrayList<>();
        int cantidadComas = postTag.replaceAll("[^,]", "").length();

        if(cantidadComas > 2) {
            errores.add("Solo 3 tags por Preguntas, SEPARALOS POR UNA (,) PLISs");
        }
        if(this.verificador(post)) {
            errores.add("Este Post ya existe");
        }
        if(postTag.length() == 0) {
            errores.add("Debes incluir al menos 1 Tag");
        }
        return errores;
    }

    public void subirImagen(MultipartFile file, String url) {
        File folder = new File(url);
        byte[] bytes;

        if(!folder.exists()) {
            folder.mkdirs();
            System.out.println("creó directorio");
        }

        try {
            bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(folder.getAbsolutePath() + "/" + file.getOriginalFilename())));                    
            stream.write(bytes);                     
            stream.close();
            System.out.println("Subió la imagen");
        } catch (IOException e) {
            System.out.println("Error al subir imagen");
            e.printStackTrace();
        }
    }
}
