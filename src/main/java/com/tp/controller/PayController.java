package com.tp.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.tp.entity.Cart;
import com.tp.entity.Menu;
import com.tp.entity.MenuOrder;
import com.tp.entity.UserEntity;
import com.tp.service.CartService;
import com.tp.service.MenuOrderService;
import com.tp.service.MenuService;
import com.tp.service.UserService;

@Controller
public class PayController {
	
	@Autowired
	UserService userService;
	
	@Autowired 
	CartService cartService;
	
	@Autowired
	MenuService menuService;
	
	@Autowired
	MenuOrderService menuOrderService;
	
	@GetMapping("/cart")
	public String cartz(HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null) {
			return "redirect:/sessionover";
		}else
		return "redirect:/index";
	}

	@PostMapping("/cart")
	public String cart(HttpSession session,
			@RequestParam(value = "QuantitySum", required = false) Integer totalQuantity,
			@RequestParam(value = "PriceSum", required = false) Integer PriceSum, 
			RedirectAttributes rttr) {
		if(totalQuantity== null || PriceSum == null) {
			rttr.addFlashAttribute("result", "NO");
			return "redirect:/nocart";
//		}else if(totalQuantity== 0 || PriceSum == 0) {
//			rttr.addFlashAttribute("result", "NO");
//			return "redirect:/nocart";
		}else {
			String username=(String)session.getAttribute("username");
			if(username!=null) {
				UserEntity userinfo = userService.UserInfo(username);
				session.setAttribute("user", userinfo);
				session.setAttribute("uuid", userinfo.getId());
				session.setAttribute("name", userinfo.getName());
				session.setAttribute("email", userinfo.getEmail());
				
				 // �쁽�옱 �궇吏� 諛� �떆媛� 媛��졇�삤湲�
		        Date now = new Date();

		        // 二쇰Ц踰덊샇 �삎�떇�쓣 �쐞�븳 �궇吏� 諛� �떆媛� �룷留� 吏��젙
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");

		        // 二쇰Ц踰덊샇 �깮�꽦�쓣 �쐞�븳 �옖�뜡 �닽�옄 �깮�꽦
		        Random random = new Random();
		        int randomNumber = random.nextInt(900) + 100; // �꽭 �옄由� �옖�뜡 �닽�옄 (100 �씠�긽 999 �씠�븯)

		        // 二쇰Ц踰덊샇 議고빀
		        String orderNumber = dateFormat.format(now) + randomNumber;
		        
		        session.setAttribute("orderNumber", orderNumber);

				return "/pay/cart";
			}else {
				return "redirect:/sessionover";
			}	
		}
		
		
	}
	
	@PostMapping("/cart2")
	public String cart2(HttpSession session,
			@RequestParam("menuName") final String menuName, @RequestParam("menuPrice") final Integer menuPrice) {
			String username=(String)session.getAttribute("username");
			if(username!=null) {
				UserEntity userinfo = userService.UserInfo(username);
				session.setAttribute("user", userinfo);
				session.setAttribute("uuid", userinfo.getId());
				session.setAttribute("name", userinfo.getName());
				session.setAttribute("email", userinfo.getEmail());
				session.setAttribute("menuName", menuName);
				 // �쁽�옱 �궇吏� 諛� �떆媛� 媛��졇�삤湲�
		        Date now = new Date();

		        // 二쇰Ц踰덊샇 �삎�떇�쓣 �쐞�븳 �궇吏� 諛� �떆媛� �룷留� 吏��젙
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");

		        // 二쇰Ц踰덊샇 �깮�꽦�쓣 �쐞�븳 �옖�뜡 �닽�옄 �깮�꽦
		        Random random = new Random();
		        int randomNumber = random.nextInt(900) + 100; // �꽭 �옄由� �옖�뜡 �닽�옄 (100 �씠�긽 999 �씠�븯)

		        // 二쇰Ц踰덊샇 議고빀
		        String orderNumber = dateFormat.format(now) + randomNumber;
		        
		        session.setAttribute("orderNumber", orderNumber);
				
				return "/pay/cart2";
			}else {
				return "redirect:/sessionover";
			}	
		
		
		
	}
	
	@GetMapping("/success")
	public String success(HttpSession session) {
	    String username = (String) session.getAttribute("username");
	    String orderNumber = (String)session.getAttribute("orderNumber");
	    UserEntity user = userService.UserInfo(username);
	    List<Cart> cartList = cartService.findCartByUser(user);
	    for(int i=0; i<cartList.size(); i++) {
	    	MenuOrder menuOrder = new MenuOrder();
	    	menuOrder.setUsername(user.getName());
	    	menuOrder.setQuantity(cartList.get(i).getQuantity());
	    	menuOrder.setMenuId(cartList.get(i).getMenu());
	    	menuOrder.setOrderNumber(orderNumber);
	    	menuOrderService.saveOrder(menuOrder);
	    	
	    }

	    cartService.deleteCartByUser(user);

	    return "pay/success";
	}
	
	@GetMapping("/success2")
	public String successs(HttpSession session) {
	    String username = (String) session.getAttribute("username");
	    String orderNumber = (String)session.getAttribute("orderNumber");
	    UserEntity user = userService.UserInfo(username);
	    String menuName = (String) session.getAttribute("menuName");
	    Menu menuList = menuService.findByName(menuName);
	   
	    	MenuOrder menuOrder = new MenuOrder();
	    	menuOrder.setUsername(user.getName());
	    	menuOrder.setQuantity(1);
	    	menuOrder.setMenuId(menuList);
	    	menuOrder.setOrderNumber(orderNumber);
	    	menuOrderService.saveOrder(menuOrder);
	    	
	   

	    return "pay/success";
	}

	
	@GetMapping("/nocart")
	public String nocart() {
		return "/pay/nocart";
	}
	

	@PostMapping("/success")
	public String successs() {
		return "/pay/success";
	}
	
	
	@GetMapping("/fail")
	public String fail(RedirectAttributes rttr) {
		rttr.addFlashAttribute("orderFail", "orderFail");
		return "redirect:/index";
	}
	@PostMapping("/fail")
	public String faill() {
		return "/pay/fail";
	}
}
