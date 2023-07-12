package com.tp.DTO;

import java.sql.Timestamp;

import com.tp.entity.MenuOrder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MenuOrderDTO {

	private Long id;
	private Timestamp orderDate;
	
	
	public static MenuOrder toMenuOrder(final MenuOrderDTO dto) {
		return MenuOrder.builder()
				.id(dto.getId())
				.orderDate(dto.getOrderDate())
				.build();
	}
}
