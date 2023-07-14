package com.tp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tp.entity.MenuOrder;
import com.tp.entity.UserEntity;
import com.tp.DTO.UserDTO;
import com.tp.service.MailService;
import com.tp.service.MenuOrderService;
import com.tp.service.MenuService;
import com.tp.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	MenuOrderService menuOrderService;
	
	@Autowired
	MenuService menuService;
	
	
	@GetMapping("/login")
	public String login() {
		
	return "user/login";
		
	}
	
	
	@GetMapping("/join")
	public String join() {
	      
	return "user/join";
	}
	
	
	@GetMapping("/mypage")
	public String mypage() {
	      
	return "user/mypage";
	}
	
	
	@PostMapping("/mailcheck")
	@ResponseBody
	public String mailcheck(@RequestParam("email") String email) {
		
		try {
			String code = mailService.sendEmail(email);
			return code;
		} catch (Exception e) {
			e.printStackTrace();
			return "Fail";
		}
		
	}
	
	
	@PostMapping("/join")
	public String joinUser(UserDTO userDTO, RedirectAttributes rttr){

		UserEntity user = 
				UserEntity.builder().username(userDTO.getUsername()).name(userDTO.getName())
									.password(userDTO.getPassword()).phone(userDTO.getPhone())
									.email(userDTO.getEmail()).address(userDTO.getAddress()).build();
		
		final String username = userDTO.getUsername();
		final String email = userDTO.getEmail();
		if(userService.idCheck(username)==0) {
			if(userService.emailExists(email)==0) {
				userService.save(user);
				rttr.addFlashAttribute("result", "OK");
				return "redirect:/joinresult";	
			}else if(userService.emailExists(email)==1) {
				rttr.addFlashAttribute("result", "emailExist!");
				return "redirect:/joinresult";
			}
		}
		rttr.addFlashAttribute("result", "idExist!");
		return "redirect:/joinresult";
		
	}
	
	@RequestMapping("/joinresult")
	public String joinresult() {
		
		return "user/joinresult";
	}
	
	@RequestMapping("/loginresult")
	public String loginresult() {
		
		return "user/loginresult";
				
	}
	@RequestMapping("/pwfindresult")
	public String pwfindresult() {
		return "user/pwfindresult";
	}
	
	@RequestMapping("/idfindresult")
	public String idfindresult() {
		return "user/idfindresult";
	}
	
	@PostMapping("/login")
	public String loginUser(
			@RequestParam("username") final String username, 
			@RequestParam("password") final String password, Model model, HttpSession session, RedirectAttributes rttr){
		
		UserEntity user= userService.UserInfo(username);
		
		if(userService.loginChek(username, password)==0) {
			rttr.addFlashAttribute("result", "OK");
			session.setAttribute("username", username);
			session.setAttribute("name", user.getName());
			session.setAttribute("id", user.getId());
			
			return "redirect:/loginresult";
		}else if(userService.loginChek(username, password)==1) {
			rttr.addFlashAttribute("result", "FAIL");
			return "redirect:/loginresult";
		}else if(userService.loginChek(username, password)==2)
			rttr.addFlashAttribute("result", "NONE_ID");
			return "redirect:/loginresult";

	}
	
	@GetMapping("/update")
	
	public String update(HttpSession session) {
		String username=(String)session.getAttribute("username");
		UserEntity userinfo = userService.UserInfo(username);
		if(username!=null) {
			session.setAttribute("user", userinfo);
			session.setAttribute("username", userinfo.getUsername());
			session.setAttribute("name", userinfo.getName());
			return "/user/update";
		}else {
			return "redirect:/sessionover";
		}

	}
	
	@PostMapping("/update")
	
	public String update(UserEntity user, HttpSession session) {
		userService.save(user);
		UserEntity userinfo = userService.UserInfo(user.getUsername());
		session.setAttribute("username", userinfo.getUsername());
		session.setAttribute("name", userinfo.getName());
		return "/user/mypage";
	}
	
	@GetMapping("/pwupdate")
	public String pwupdate(HttpSession session) {
		String username=(String)session.getAttribute("username");
		UserEntity userinfo = userService.UserInfo(username);
		if(username!=null) {
			session.setAttribute("user", userinfo);
			return "/user/pwupdate";
		}
		 return "redirect:/sessionover";
	}
	
	@PostMapping("/pwupdate")
	public String pwupdate(HttpSession session, @RequestParam("password") final String password) {
		UserEntity user = (UserEntity)session.getAttribute("user");
		user.setPassword(password);
		userService.save(user);
		session.setAttribute("username", user.getUsername());
		session.setAttribute("name", user.getName());
		return "/user/mypage";
	}
	
	   // 비밀번호 찾기 
	   @PostMapping("pwupdate2")
	   public String lostPwChange(@RequestParam("username") String username,
			   @RequestParam("password") final String password, RedirectAttributes rttr) {
		  UserEntity user = userService.UserInfo(username);
			if(userService.idCheck(username)==0) {
				rttr.addFlashAttribute("result", "OK");
				return "redirect:/pwfindresult";
			}else {
				user.setPassword(password);
				userService.save(user);
				rttr.addFlashAttribute("result", "idExist!");
				return "redirect:/pwfindresult";
			}
	   }
	
	
	@GetMapping("/delete")
	   public String delete(HttpSession session) {
		String username = (String)session.getAttribute("username"); 
		UserEntity userinfo = userService.UserInfo(username);
		if(username!=null) {
			session.setAttribute("id", userinfo.getId());
			session.setAttribute("username", userinfo.getUsername());
			session.setAttribute("user", userinfo);
			return "/user/delete";
		}
		 return "redirect:/sessionover";
	}
	
	@PostMapping("/delete")
	public String delete(HttpSession session, 
			@RequestParam("password") final String password) {
		if(session.getAttribute("id")!=null) {
			String id=(String)session.getAttribute("id");
			UserEntity user = (UserEntity)session.getAttribute("user");
			if(user.getPassword().equals(password)) {
				userService.deleteById(id);
				session.invalidate();
				return "/user/login";
			}else {
				return "/user/mypage";
			}
		}else {
			
			return "redirect:/sessionover";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	       
		   session.invalidate();
 
		   return "redirect:/";            
	}
	

	@GetMapping("/sessionover")
	public String sessionover(HttpSession session) {
		session.setAttribute("nosession", "NO");
		return "user/sessionover";
	}
	
	@GetMapping("/IdFind")
	public String IdFind() {
		
		return "user/IdFind";
	}
	
	@PostMapping("/IdFind")
	public String IdFind(@RequestParam("name") final String name, 
			@RequestParam("email") final String email, RedirectAttributes rttr) {
		if(userService.emailExists(email)==1) {
			UserEntity user = userService.infoToEmail(email);
			if(user.getName().equals(name)) {
				try {
					mailService.idDeliver(user.getUsername());
					mailService.sendIdEmail(email);
				} catch (Exception e) {
					e.printStackTrace();
				}rttr.addFlashAttribute("result", "OK");
				return "redirect:/idfindresult";
			}
		}
		rttr.addFlashAttribute("result", "NO");
		return "redirect:/idfindresult";
	}
	
	
	@GetMapping("/PwFind")
	public String PwFind() {
		
		return "user/PwFind";
	}
	
	@PostMapping("/PwFind")
	@ResponseBody
	public String PwFind(@RequestParam("username") final String username, 
			@RequestParam("email") final String email,
	         UserEntity userEntity) {
		UserEntity user= userService.UserInfo(username);
		   try {
		        String code =  mailService.sendEmail(email);
		        System.out.println(code);
		         return code;   
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		         return "Fail";
		      }
	}
	
	@RequestMapping("/MyOrder")
	public String myorder(Model model,
			HttpSession session) {
		
		String name = (String)session.getAttribute("name");
		System.out.println("name : " + name);
		
		List<MenuOrder> list = menuOrderService.findOrder(name);
		model.addAttribute("menuOrderList", list);
		
		System.out.println("model List : "+list);
		
		
		return "user/myorder";
	}
}

