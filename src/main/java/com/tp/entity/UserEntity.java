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
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor // 湲곕낯�깮�꽦�옄
@AllArgsConstructor
@Data
@EqualsAndHashCode(callSuper=false)
@Entity(name = "user")
@Table(name = "user")
public class UserEntity extends BaseTimeEntity{

	 @Id // 湲곕낯�궎(Primary key)
	 @GeneratedValue(generator = "system-uuid")
	 @GenericGenerator(name="system-uuid", strategy = "uuid")
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
	 
//	 @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
//	 private List<Cart> cart;

}
