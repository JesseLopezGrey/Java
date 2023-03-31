package com.jesselopez.joybundler.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.jesselopez.joybundler.models.Infant;
import com.jesselopez.joybundler.services.InfantService;
import com.jesselopez.joybundler.services.UserService;





@Controller
public class InfantController {
	@Autowired
	InfantService infantServ;
	
	@Autowired
	UserService userServ;
	//-------------------create
	@GetMapping("/names/new")
	public String createInfant(
			@ModelAttribute("infantObj")Infant emptyInfantObj,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		model.addAttribute("allUsers", userServ.getAllUser());
		return "/infant/create.jsp";
	}
	@PostMapping("/names/new")
	public String processInfant(
			@Valid @ModelAttribute("infantObj")Infant filledInfant,
			BindingResult results,
			Model model
			) {
		//Validations fail
		if(results.hasErrors()) {
			model.addAttribute("allUsers", userServ.getAllUser());
			return "/infant/create.jsp";
		}
		//validation pass
		infantServ.createInfant(filledInfant);
		return "redirect:/home";
	  }
	
	//---------------read one
	@GetMapping("/names/{id}")
	public String  oneInfant(
			@PathVariable("id")Long infantId,
			Model model,
			HttpSession session
			) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Infant oneInfant = infantServ.getOneInfant(infantId);
		model.addAttribute("infant", oneInfant);
		return "/infant/display.jsp";
	}

	//-------------------(Update)--------//
		@GetMapping("/names/{id}/edit")
		public String editInfant(
				@PathVariable("id")Long infantId,
				Model model,
				HttpSession session
				) {
			if(session.getAttribute("user_id") == null) {
				return "redirect:/";
			}
			Infant oneInfant = infantServ.getOneInfant(infantId);
			model.addAttribute("infantObj", oneInfant);
			model.addAttribute("allUsers", userServ.getAllUser());
			return "/infant/edit.jsp";
		}
		@PutMapping("/names/{id}/edit")
		public String updateInfant(
				@Valid @ModelAttribute("infantObj")Infant filledObject, 
				BindingResult results,
				Model model
			){
				if(results.hasErrors()) {
					model.addAttribute("oneInfants",filledObject );
					return "/infant/edit.jsp";
				}
				infantServ.createInfant(filledObject);
				return "redirect:/home";
			}
		//--------------------(delete)--------//
		@DeleteMapping("/names/{id}")
		public String deleteInfant(
				@PathVariable("id") Long infantId
				) {
			infantServ.deleteInfant(infantId);
			return "redirect:/home";
		}
}
