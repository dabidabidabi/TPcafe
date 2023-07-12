package com.tp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tp.entity.Cart;
import com.tp.entity.Menu;
import com.tp.entity.MenuOrder;
import com.tp.entity.UserEntity;
import com.tp.service.CartService;
import com.tp.service.MenuService;
import com.tp.service.OrderService;
import com.tp.service.UserService;

import com.tp.entity.Menu;
import com.tp.service.MenuService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MenuController {

	private final MenuService menuService;
	private final OrderService orderService;
	private final CartService cartService;
	private final UserService userService;

	   @RequestMapping("/menu")
	   public String menu(Model model) {
		   List<Menu> list = null;
		   
		   list = menuService.all();
		   
		   model.addAttribute("list",list);
		   return "menu/menu";
	   }
	   
	   //메뉴 작성
	   @RequestMapping("menuRegister")
	   public String write() {
		   return "menu/register";
	   }
	   
	   //메뉴 저장
	   @GetMapping("/menuSave")
	   public String save() {
		   return "menu/menu";
	   }
	   
	   //메뉴 저장
	   @PostMapping("/menuSave")
	   public String menuSave(Menu menu, MultipartFile file) throws Exception {
		   menuService.save(menu, file);
		   return "redirect:/menu";
	   }
	   
	   //게시물 상세보기
	   @RequestMapping("/menuContent")
	   public String content(@RequestParam("id") Long id,
			   Model model,	
			   HttpServletRequest req,
			   HttpServletResponse res, HttpSession session) {
		   model.addAttribute("menu",menuService.selectOne(id));
		   
		   String username = (String)session.getAttribute("username");
		 	  
		   session.setAttribute("order", username);
		   
		   if(session.getAttribute("listnum_mo") != null) {
			   session.setAttribute("listnum", 3);
			   session.removeAttribute("listnum_mo");
		   } else {
			   session.setAttribute("listnum", 1);
		   }
		   return "menu/content";
	   }
	   
	   //게시물 삭제
	   @GetMapping("/deleteMenu")
	   public String delete(@RequestParam Long id) {
		   menuService.delete(id);
		   return "redirect:/menu";
	   }
	   
	   //게시물 수정
	   @GetMapping("/modifyMenu")
	   public String modify(@RequestParam Long id, Model model, HttpSession session) {
		   String username = (String) session.getAttribute("username");
		   session.setAttribute("listnum", 2);
		   model.addAttribute("menu",menuService.selectOne(id));
		   return "menu/menu_modify";
	   }
	   
	   // 게시물 수정 후 수정된 결과 보기
	   @PostMapping("/modifyMenu")
	   public String afterModify(Menu menu, MultipartFile file, HttpSession session) throws Exception {
		   session.setAttribute("listnum_mo", 2);
		   menuService.save(menu, file);
		   return "redirect:/menuContent?id="+menu.getId();
	   }

	   
	   @PostMapping("/drinkOrder")
		public String drinkOrderP(Model model, HttpSession session, UserEntity user, Cart cart, RedirectAttributes rttr,
				@RequestParam("quantity") Integer quantity, @RequestParam("id") Long id,
				@RequestParam("menuName") String menuname) {

			String username = (String) session.getAttribute("username");
			Integer menuOrder = (Integer) session.getAttribute(menuname);

			if (username != null) {
				user = userService.UserInfo(username);
				cart = cartService.getCartByUserAndMenu(user, menuService.selectOne(id));

				// 장바구니에 새로 추가할 때
				if (cart == null) {
					cart = Cart.builder().quantity(quantity).menu(menuService.selectOne(id)).user(user).build();

					cartService.cartSave(cart);
					session.setAttribute(menuname, 1);
				} else {
					// 기존에 있는 품목에 수량을 추가할 때(cart != null일 때)
					cart.setQuantity(cart.getQuantity() + quantity);
					cartService.cartSave(cart);
				}

				model.addAttribute("cart", cart);
				rttr.addFlashAttribute("order", "OK");
				return "redirect:/orderResult";
			} else {
				rttr.addFlashAttribute("order", "login");
				return "redirect:/orderResult";
			}

	   }
	   
	   @RequestMapping("/orderResult")
		public String orderResult() {
			
			return "menu/orderRttr";
		}
}