package com.tp.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tp.entity.Cart;
import com.tp.entity.UserEntity;

import com.tp.service.CartService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

	private final CartService cartService;

	@GetMapping("/MyCart")
	@Transactional
	  public String drinkSave(
			  Cart cart,
			  Model model,
			  UserEntity user,
			  HttpSession session) {
		
		String username = (String)session.getAttribute("username");
		if(username == null) {
			return "redirect:/sessionover";
		}else {
			List<Cart> list = null;
			
			list = cartService.cartAll();
			List<Cart> list2 = new ArrayList<>();
			
			
			
			System.out.println("list : "+list);
			
			System.out.println(username);
			
			for(int i=0; i<list.size(); i++) {
				if(username.equals(list.get(i).getUser().getUsername())) {
					list2.add(list.get(i));
					model.addAttribute("list2", list2);
				}
			}
			System.out.println("List2 : " + list2);    
			
		    return "menu/MyCart";
		}
		 
	  }
	
	// 장바구니 메뉴 삭제
	@PostMapping("/deleteCartMenu")
	public ResponseEntity<String> deleteMenu(@RequestBody List<Long> ids) {
	    try {
	        if (ids.isEmpty()) {
	            return new ResponseEntity<>("삭제할 상품이 없습니다", HttpStatus.BAD_REQUEST);
	        }
	        cartService.deleteCartMenu(ids);
	        return new ResponseEntity<>("상품이 삭제되었습니다", HttpStatus.OK);
	    } catch (Exception e) {
	        System.err.println("에러: " + e.getMessage());
	        e.printStackTrace(System.err);
	        return new ResponseEntity<>("선택한 제품을 삭제하는 동안 오류가 발생했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
}
