package com.tp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tp.entity.MenuOrder;

public interface OrderRepository extends JpaRepository<MenuOrder, Long>{

}
