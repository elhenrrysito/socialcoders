package com.oneteam.socialcoders.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface RepositorioBase<T> extends CrudRepository<T, Long> {
    
    List<T> findAll();
}