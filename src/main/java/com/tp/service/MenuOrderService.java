package com.tp.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import com.tp.entity.MenuOrder;
import com.tp.repository.MenuOrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuOrderService {
	
	private final MenuOrderRepository menuOrderRepository ;
	
    public void saveOrder(MenuOrder menuOrder) {
    	menuOrderRepository.save(menuOrder);
    }
    
    @Transactional
    public List<MenuOrder> allOrderList() {
    	return menuOrderRepository.findAllByOrderByOrderDateDesc();
    }
    public List<MenuOrder> findOrder(String username) {
    	return menuOrderRepository.findByUsernameOrderByOrderDateDesc(username);
    }
    
}
