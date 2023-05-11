package com.ino.sales.service;

import java.io.File;
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
	
	public ArrayList<SalesDTO> salesList(HttpSession session, HashMap<String, String> userParams) {
		
		logger.info("salesList 진입");
		
		if(session.getAttribute("loginId")!=null) {
			String loginId = (String) session.getAttribute("loginId");
			String sido = dao.getUserSido(loginId);
			String sigungu = dao.getUserSigungu(loginId);
			userParams.put("sido", sido);
			userParams.put("sigungu", sigungu);
		}
		
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
		
		list = dao.salesList(userParams);		
		
		return list;
	}

	public String getBiz_name(String biz_id) {

		return dao.getBiz_name(biz_id);
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

	public ArrayList<SalesDTO> filtering(HashMap<String, String> userParams) {
		
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
		String filterName = userParams.get("filterName");
		
		logger.info("filterName :"+filterName);
		logger.info("biz_id :"+userParams.get("biz_id"));
		logger.info("goods_id :"+userParams.get("goods_id"));
		logger.info("sido :"+userParams.get("sido"));
		logger.info("sigungu :"+userParams.get("sigungu"));
		logger.info("minPrice :"+userParams.get("minPrice"));
		logger.info("maxPrice :"+userParams.get("maxPrice"));

		list = dao.salesList(userParams);
		
		return list;
	}

	public void salesDelete(String sales_no) {
		
		logger.info("sales_no"+sales_no);

		dao.salesDelete(sales_no);
	}

	public int attentionCheck(String loginId, String sales_no) {
		
		return dao.attentionCheck(loginId, sales_no);
	}

	public void addAttention(String loginId, String sales_no) {
		dao.addAttention(loginId, sales_no);
		dao.addSalesAttention(sales_no);
	}

	public void removeAttention(String loginId, String sales_no) {
		dao.removeAttention(loginId, sales_no);
		dao.removeSalesAttention(sales_no);
	}

	public ArrayList<BizDTO> bizCall() {
		
		return dao.getBizList();
	}

	public int salesUpdate(MultipartFile[] photos, HashMap<String, String> params, ArrayList<String> removeFileName) {
		
		logger.info("params :"+params);
		
		if(params.get("postcode")!=null) {
			String left_addr = params.get("roadAddress").substring(params.get("sido").length()+params.get("sigungu").length()+2)+", "+params.get("detailAddress")+params.get("extraAddress");
			params.put("left_addr", left_addr);
		}
		if(params.get("biz")!=null) {
			String biz_id = params.get("biz");
			String goods_id = params.get("goods");
			params.put("biz_id", biz_id);
			params.put("goods_id", goods_id);
		}
		
		int row = dao.salesUpdate(params);// 아무것도 안건들었을 때, 주소만 수정, 카테고리 수정
		int sales_no = 0;
		logger.info("updated row : "+row);
		
		if(row>0) {//판매글 글을 업데이트 시켰다면

			if(removeFileName.size()>1) {//삭제할 파일 리스트의 길이가 0보다 크다면
				fileDelete(removeFileName); //파일 삭제하고 photo 테이블의 파일도 삭제함.
			}
			
			sales_no = Integer.parseInt(params.get("sales_no"));
			
			for (MultipartFile photo : photos) {
				logger.info("photo 있으면 false, 없으면 true :"+photo.isEmpty());
				if(photo.isEmpty()==false) {
					
					fileSave(sales_no, photo);
					
					try {
						Thread.sleep(1);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					
				}
			}
		}
		
		return sales_no;
	}

	private void fileDelete(ArrayList<String> newFileName) {
		// 실제 파일도 제거해주고, DB photo 테이블 row도 제거해드립니다.
		for (String FileName : newFileName) {// for 문으로 하나씩 담아서 
			logger.info(FileName);
			File file = new File("C:/img/upload/"+FileName);// file 객체 생성 후 
			if(file.exists()) {// 파일이 존재하면 
				file.delete();// 파일을 삭제함
			}
			dao.removeFileName(FileName);
		}
		
	}

}
