package com.tp.service;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.tp.entity.Cart;
import com.tp.entity.Menu;
import com.tp.entity.MenuOrder;
import com.tp.entity.UserEntity;
import com.tp.repository.CartRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {
	

	private final CartRepository cartRepository;
	

	//전체 주문 조회
	@Transactional
	public List<Cart> cartAll() {
		return cartRepository.findAll();
	}
	
	public List<Cart> findCart(UserEntity user) {
		return cartRepository.findByUser(user);
	}

	public Cart cartSave(Cart cart) {
		return cartRepository.save(cart);
	}

	@Transactional
	public void deleteCartMenu(List<Long> ids) {
	    if (!ids.isEmpty()) {
	        cartRepository.deleteByIdIn(ids);
	    }
	}
	
	public Cart getCartByUserAndMenu(UserEntity user, Menu menu) {
	    return cartRepository.findByUserAndMenu(user, menu);
    }

	@Transactional
	public void deleteCartByUser(UserEntity user) {
	    List<Cart> cartEntities = cartRepository.findByUser(user);
	    for (Cart cartEntity : cartEntities) {
	    	 cartRepository.delete(cartEntity);
	        }
	}
	
	@Transactional
	public List<Cart> findCartByUser(UserEntity user){
		return cartRepository.findByUser(user);
	}

}