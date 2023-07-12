package com.tp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tp.entity.Menu;
import com.tp.service.MenuService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CategoryController {
	
	private final MenuService menuService;

	@RequestMapping("/{type}")
	public String type(@PathVariable("type") String type, Model model) {
		List<Menu> list = null;

		if(type.equals("coffee")) {
			type = "coffee";
		} else if(type.equals("milkTea")) {
			type = "MILK TEA & LATTE";
		} else if(type.equals("juice")) {
			type = "JUICE & DRINK";
		} else if(type.equals("smoothie")) {
			type = "smoothie";
		} else if(type.equals("tea")) {
			type = "TEA & ADE";
		} else if(type.equals("dessert")) {
			type = "dessert";
		} else if(type.equals("md")) {
			type = "md";
		} else if(type.equals("bread")) {
			type = "bread";
		}
		
		list = menuService.categoryList(type);
		model.addAttribute("list",list);
		System.out.println(list);
		
		if(type.equals("JUICE & DRINK")) {
			type = "juice";
		} else if(type.equals("MILK TEA & LATTE")) {
			type = "milkTea";
		} else if(type.equals("TEA & ADE")) {
			type = "tea";
		}
		
		return "menu_category"+"/"+type;
	}
}
