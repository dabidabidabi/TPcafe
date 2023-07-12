package com.tp.repository;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tp.entity.Cart;
import com.tp.entity.Menu;
import com.tp.entity.MenuOrder;
import com.tp.entity.UserEntity;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

//	List<Cart> findByUserId(String id);
	
	void deleteByIdIn(List<Long> ids);
	Cart findByUserAndMenu(UserEntity user, Menu menu);
	Cart findByUser_Id(String id);	
	
	List<Cart> findByUser(UserEntity user);
    void deleteByUser(UserEntity user);
	
    Cart findByIdAndUser_Id(Long id, String userId);
	
	
	
	
}
