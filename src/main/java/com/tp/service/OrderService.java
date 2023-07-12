package com.tp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tp.entity.MenuOrder;
import com.tp.entity.UserEntity;
import com.tp.repository.OrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
	
	private final OrderRepository orderRepository;
	
	// 주문생성
//	public void createOrder(UserEntity user){
//        MenuOrder order = new MenuOrder();
//        order.setUser(user);
//        orderRepository.save(order);
//    }
	
	//전체 주문 조회
	public List<MenuOrder> orderAll() {
		return orderRepository.findAll();
	}
	
	//주문 번호로 조회
	public MenuOrder orderNum(Long id) {
		return orderRepository.findById(id).get();
	}
	
	public void orderSave(MenuOrder order) {
		orderRepository.save(order);
	}

}

