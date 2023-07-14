package com.tp.entity;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor // 기본생성자
@AllArgsConstructor
@Data
@Entity(name = "user")
@Table(name = "user")
public class UserEntity extends BaseTimeEntity{


	 @GeneratedValue(generator = "system-uuid")
	 @GenericGenerator(name="system-uuid", strategy = "uuid")
	 @Id // 기본키(Primary key)
	 private String id;
	 @Column(length = 30, nullable=false)
	 private String username;
	 @Column
	 private String password;
	 @Column(length = 30, nullable=false)
	 private String name;
	 @Column(length = 30, nullable=false)
	 private String phone;
	 @Column(length = 30, nullable=false)
	 private String email;
	 @Column(length = 30, nullable=false)
	 private String address;

}