package com.jesselopez.joybundler.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jesselopez.joybundler.models.Infant;
import com.jesselopez.joybundler.repositories.InfantRepository;




@Service
public class InfantService {
	@Autowired
	InfantRepository infantRepo;
	
	// CREATE
	public Infant createInfant(Infant Infant) {
		return infantRepo.save(Infant);
	}
	// READ ONE
	public Infant getOneInfant(Long id) {
		return infantRepo.findById(id).orElse(null);
	}
	// READ ALL
	public List<Infant> getAllInfants(){
		return infantRepo.findAll();
	}
	// UPDATE
	public Infant updateInfant(Infant updatedInfant) {
		return infantRepo.save(updatedInfant);
	}
	// DELETE
	public void deleteInfant(Long id) {
		infantRepo.deleteById(id);
	}
	
	
	
	
	
}
