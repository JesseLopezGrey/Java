package com.jesselopez.joybundler.controllers;

import java.util.List;

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
import com.jesselopez.joybundler.models.LoginUser;
import com.jesselopez.joybundler.models.User;
import com.jesselopez.joybundler.services.InfantService;
import com.jesselopez.joybundler.services.UserService;


@Controller
public class UserController {
	@Autowired
	UserService userServ;
	
	@Autowired
	InfantService infantServ;
	
	
	@GetMapping("/")
	public String index(
		@ModelAttribute("newUser") User emptyUser,
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "index.jsp";
	}
	

	// PROCESS REGISTER-----------------------------------------------//
	@GetMapping("/register")
	public String register(
		@ModelAttribute("newUser") User emptyUser
		
	) {
		return "register.jsp";
	}

	@PostMapping("/register")
	public String register(
		@Valid @ModelAttribute("newUser") User filledUser,
		BindingResult results,
		HttpSession session,
		Model model
	) {
		User createdUser = userServ.register(filledUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		}
		// SAVE THE USERS ID IN SESSION
		session.setAttribute("user_id", createdUser.getId());
		return "redirect:/login";
	}
	
	// PROCESS LOGIN
	@GetMapping("/login")
	public String login(
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
		
	) {
		return "login.jsp";
	}
	@PostMapping("/login")
	public String login(
		@Valid @ModelAttribute("newLogin") LoginUser filledLoginUser,
		BindingResult results,
		HttpSession session,
		Model model
	) {
		User loggedUser = userServ.login(filledLoginUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("user_id", loggedUser.getId());
		return "redirect:/home";
	}
	
	@GetMapping("/logout")
	public String logout(
		HttpSession session
	) {
		session.invalidate();
		return "redirect:/home";
	}
	
	
//------------------logreg end------------------------------------    //
//--------------------user create update delete read------------------//
	
	//read all
	@GetMapping("/home")
	public String bookclub(
		Model model,
		@ModelAttribute("userObj")User emptyUserObject,
		HttpSession session
		) {
			if(session.getAttribute("user_id") == null) {
				return "redirect:/";
			}
			
			List<User> allUsersFromDB = userServ.getAllUser();	
			model.addAttribute("allUsers", allUsersFromDB);
			List<Infant> allInfantsFromDB = infantServ.getAllInfants();	
			model.addAttribute("allInfants", allInfantsFromDB);
			
			return "/home.jsp";
		}
		//create
		@GetMapping(value={"/user/new"})
		public String createUser(
				@ModelAttribute("userObj")User emptyUser) {
			
			return "user/create.jsp";
		}

		@PostMapping("/user/new")
		public String processUser(
				@Valid @ModelAttribute("userObj")User filledUser,
				BindingResult results
				) {
			//Validations fail
			if(results.hasErrors()) {
				return "/user/create.jsp";
			}
			//validation pass
			userServ.createUser(filledUser);
			return "redirect:/";	
		}
		//read one
		@GetMapping("/user/{id}")
		public String  oneUser(
				@PathVariable("id")Long userId,
				Model model
				
				){
			User oneUser = userServ.getOneUser(userId);
			model.addAttribute("user", oneUser);
			return "/user/display.jsp";
		}
		
		//-------------------(Update)--------//
		@GetMapping("/user/{id}/edit")
		public String editUser(
				@PathVariable("id")Long userId,
				Model model
				) {
			User oneUser = userServ.getOneUser(userId);
			model.addAttribute("userObj", oneUser);
			return "/user/edit.jsp";
		}
		@PutMapping("/user/{id}/edit")
		public String updateUser(
				@Valid @ModelAttribute("userObj")User filledObject, 
				BindingResult results
			){
				if(results.hasErrors()) {
					return "/user/edit.jsp";
				}
				userServ.createUser(filledObject);
				return "redirect:/";
			}
		//--------------------(delete)--------//
		@DeleteMapping("/user/{id}")
		public String deleteUser(
				@PathVariable("id") Long userId
				) {
			userServ.deleteUser(userId);
			return "redirect:/";
		}
		
	
}
