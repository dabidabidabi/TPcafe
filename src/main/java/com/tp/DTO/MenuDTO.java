package com.tp.DTO;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import com.tp.entity.Menu;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class MenuDTO {

	private Long id;
	private String name;
	private int price;
	private String filename;
	private String filepath;
	private String type;
	private String content;
	
	public static Menu toMenu(final MenuDTO dto) {
		return Menu.builder()
				.id(dto.getId())
				.name(dto.getName())
				.price(dto.getPrice())
				.filename(dto.getFilename())
				.filepath(dto.getFilepath())
				.type(dto.getType())
				.content(dto.getContent())
				.build();
	}
}
