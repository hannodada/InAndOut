package com.ino.gallery.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ino.gallery.dao.GalleryDAO;
import com.ino.gallery.dto.GalleryDTO;

@Service
public class GalleryService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GalleryDAO dao;
	
	public String galleryWrite(MultipartFile[] photos, HashMap<String, String> params) {


		String page = "redirect:/galleryList.do";
		
		GalleryDTO dto = new GalleryDTO();
		
		logger.info("params :"+params);
		dto.setUser_id(params.get("user_id"));
		dto.setStore_name(params.get("store_name"));
		dto.setGallery_subject(params.get("gallery_subject"));
		dto.setGallery_content(params.get("gallery_content"));
		
		int row = dao.galleryWrite(dto);
		logger.info("updated row : "+row);
		
		int idx = dto.getGallery_no();
		logger.info("방금 insert한 idx : "+idx);
		
		for (MultipartFile photo : photos) {
			logger.info("photo 여부 :"+photo.isEmpty());
			if(photo.isEmpty()==false) {
				
				fileSave(idx, photo);
				
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			}
		}

		page = "redirect:/galleryDetail.do?idx="+idx;

		return page;
	}

	private void fileSave(int idx, MultipartFile photo) {

		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String cate_no = "p006";
		String new_photo_name = System.currentTimeMillis() + ext;
		logger.info(ori_photo_name+"=>"+new_photo_name);
		
		try {
			byte[] bytes = photo.getBytes();
			
			Path path = Paths.get("C:/img/upload/"+new_photo_name);
			Files.write(path, bytes);
			logger.info(new_photo_name+" save OK");
			
			dao.fileWrite(ori_photo_name, new_photo_name, idx, cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
