package com.tp.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tp.entity.Menu;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {
	//카테고리별
	List<Menu> findByType(String type);
	Menu findByName(String name);
	Menu findMenuById(Long menuId);
}
