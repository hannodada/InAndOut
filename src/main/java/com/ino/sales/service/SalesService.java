package com.ino.sales.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ino.sales.dao.SalesDAO;
import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;

@Service
public class SalesService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SalesDAO dao;
	
	public ArrayList<SalesDTO> salesList() {
		
		return dao.salesList();
	}

	
	public ArrayList<BizDTO> getBizList() {
		
		return dao.getBizList();
	}

	public ArrayList<goodsDTO> getGoodsList() {

		return dao.getGoodsList();
	}

	public String salesWrite(MultipartFile photo, HashMap<String, String> params) {

		String page = "redirect:/salesList.do";
		
		SalesDTO dto = new SalesDTO();
		
		logger.info("params :"+params);
		dto.setUser_id(params.get("user_id"));
		dto.setSubject(params.get("subject"));
		dto.setPrice(Integer.parseInt(params.get("price")));
		dto.setPost_num(params.get("postcode"));
		dto.setSales_sido(params.get("sido"));
		dto.setSigungu(params.get("sigungu"));
		dto.setLeft_addr(params.get("roadAddress").substring(params.get("sido").length()+params.get("sigungu").length()+2)+", "+params.get("detailAddress")+params.get("extraAddress"));
		dto.setContent(params.get("content"));
		dto.setSales_state("판매중");
		dto.setBlind(false);
		dto.setBiz_id(params.get("biz"));
		dto.setGoods_id(params.get("goods"));
		
		int row = dao.salesWrite(dto);
		logger.info("updated row : "+row);
		
		int idx = dto.getSales_no();
		logger.info("방금 insert한 idx : "+idx);
		
		logger.info("파일 이름 : "+photo.getOriginalFilename());
		
		page = "redirect:/detail.do?idx="+idx;
		
		if(!photo.getOriginalFilename().equals("")) {
			
			logger.info("파일 업로드 작업");

			fileSave(idx, photo);
			
		}
		return page;
	}

	private void fileSave(int idx, MultipartFile photo) {

		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String cate_no = "p005";
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
