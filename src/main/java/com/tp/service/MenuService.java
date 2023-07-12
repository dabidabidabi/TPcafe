package com.tp.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tp.entity.Menu;
import com.tp.repository.MenuRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuService {
	
	private final MenuRepository menuRepository;
	
    
    public List<Menu> all() {
    	return menuRepository.findAll();
    }
    
    //게시물 하나
	@Transactional
    public Menu selectOne(Long id) {
    	return menuRepository.findById(id).get();
    }
    
	public void save(Menu menu, MultipartFile file) throws Exception {
		
		if(!file.isEmpty()) {
			String projectPath = System.getProperty("user.dir") +"\\src\\main\\webapp\\resources\\files";
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid+"_"+file.getOriginalFilename();
			File savefile = new File(projectPath, fileName);
			file.transferTo(savefile);
			
			menu.setFilename(fileName);
			menu.setFilepath("/resouces/files/"+fileName);
		} else {
			if(menu.getFilename()==null) {
				menu.setFilename("");
				menu.setFilepath("");
			}
		}
		menuRepository.save(menu);
	}
	
	// 메뉴 찾기
	public Menu findByName(String name){
		return menuRepository.findByName(name);
	}
	
	//게시물 삭제
	@Transactional
	public void delete(Long id) {
		menuRepository.deleteById(id);
	}
	
	//분류에 따라 게시글 출력
	public List<Menu> categoryList(String type) {
		return menuRepository.findByType(type);
	}
}
