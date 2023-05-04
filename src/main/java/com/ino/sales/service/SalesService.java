package com.ino.sales.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	public ArrayList<SalesDTO> salesList(HttpSession session) {
		
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
		logger.info("salesList 진입");
		if(session.getAttribute("loginId")!=null) {
			logger.info("salesList  if 진입");
			String loginId = (String) session.getAttribute("loginId");
			logger.info("salesList  if 세션 진입"+loginId);
			String sido = dao.getUserSido(loginId);
			String sigungu = dao.getUserSigungu(loginId);
			
			logger.info("salesList  if 세션 진입"+sido+sigungu);
			list = dao.salesList(sido, sigungu);
			
		}else {
			
			list = dao.salesList("default" ,"default");
			
		}
		
		return list;
	}
	
	public ArrayList<SalesDTO> filtering(String filterName) {
		
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
		
		if(filterName.equals("hit")) {
			
			list = dao.filteringByHit();
			
		}else if(filterName.equals("sales_no")) {
			
			list = dao.filteringBySales_no();
			
		}
		
		return list;
	}
	
	public ArrayList<BizDTO> getBizList() {
		
		return dao.getBizList();
	}
	
	public String salesWrite(MultipartFile[] photos, HashMap<String, String> params) {

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

		page = "redirect:/salesDetail.do?sales_no="+idx;

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
	
	public ArrayList<goodsDTO> goodsCall(String biz_id) {

		return dao.goodsCall(biz_id);
	}

	public SalesDTO salesDetail(int sales_no, String flag) {

		if(flag.equals("detail")) {
			logger.info("if문 진입");
			dao.upHit(sales_no);
			
		}
		
		return dao.salesDetail(sales_no);
	}

	public ArrayList<String> salesDetailPhoto(int sales_no) {

		return dao.salesDetailPhoto(sales_no);
	}











	
}
