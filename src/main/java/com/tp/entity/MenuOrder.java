package com.tp.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Builder
@Entity 
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "menuOrder")
public class MenuOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column
	@CreationTimestamp
	private Timestamp orderDate;
	   
	@Column
	private Integer quantity;
	   
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "menu")
	private Menu menuId;
	   
	   
	@Column
	private String username;
	      
	@Column(nullable = true)
	private String orderNumber;
	
//	@Column
//	@CreationTimestamp
//	private Timestamp orderDate;
//	
//	@Column
//	private Integer quantity;
//	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "menuId")
//	private Menu menu;
//	
//	
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name = "userName")
//	private List<UserEntity> user = new ArrayList<>();
//	
//	@OneToOne(mappedBy = "menuOrder", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
//    private Cart cart;
//	
//	@Column
//	private Long cartId;
//	
//	@Column
//	private String orderusername;

	
}