package com.tp.DTO;

import com.tp.entity.AdminUser;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUserDTO {
	private String id;
	private String username;
	private String password;

	public static AdminUser toAdminUserDTO(final AdminUserDTO dto) {
		return AdminUser.builder()
				.id(dto.getId())
				.username(dto.getUsername())
				.password(dto.getPassword())
				.build();
	}
}
