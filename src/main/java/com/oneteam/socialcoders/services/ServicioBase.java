package com.oneteam.socialcoders.services;


import java.util.List;
import java.util.Optional;

import com.oneteam.socialcoders.repositories.RepositorioBase;

import org.springframework.stereotype.Service;

@Service
public abstract class ServicioBase<T> {

    private final RepositorioBase<T> repositorio;

    public ServicioBase(RepositorioBase repositorio) {
        this.repositorio = repositorio;
    }
  
    public List<T> allEntitys(){
		return repositorio.findAll();
	}
	
	public T saveOrUpdate(T entity) {
		return repositorio.save(entity);
	}

    public void saveList(List<T> list){
        repositorio.saveAll(list);
    }
	
	public T findEntityById(Long id) {
		Optional<T> entity = repositorio.findById(id);
		if(entity.isPresent()) {
			return entity.get();
		} else {
			return null;
		}
	}
	
	public void deleteEntity(Long id) {
		repositorio.deleteById(id);
		
	}

	public void delete(T entity) {
		repositorio.delete(entity);
	}

}