package com.tp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "adminUser")
public class AdminUser {

	 @Id // 기본키(Primary key)
	 @GeneratedValue(generator = "system-uuid")
	 @GenericGenerator(name="system-uuid", strategy = "uuid")
	 private String id;
	 @Column(length = 30, nullable=false)
	 private String username;
	 @Column
	 private String password;

}
