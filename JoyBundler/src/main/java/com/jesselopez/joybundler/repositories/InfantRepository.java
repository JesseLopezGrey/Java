package com.jesselopez.joybundler.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.jesselopez.joybundler.models.Infant;



public interface InfantRepository extends CrudRepository<Infant, Long>{

	List<Infant> findAll();
	
}