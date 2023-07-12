package com.tp.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.tp.entity.AdminUser;

public interface AdminUserRepository extends JpaRepository<AdminUser, String> {

	boolean existsByUsername(String username);
	AdminUser findByUsername(String username);
}