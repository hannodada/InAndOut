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
	
	public ArrayList<SalesDTO> salesList(HttpSession session, HashMap<String, String> userParams) {
		
		logger.info("salesList 진입");
		String sido = null;
		String sigungu = null;
		
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();

		if(session.getAttribute("loginId")!=null) {//로그인 상태일때
			String loginId = (String) session.getAttribute("loginId");
			logger.info("salesList  if 세션 진입 : "+loginId);
			
			if(userParams.get("sido")!=null) {
				if(userParams.get("sido").length()>0) {//로그인 상태 && 뷰에서 시도 선택했을 때
					logger.info("sido :"+userParams.get("sido"));
					
					sido = userParams.get("sido");
					logger.info("login sigungu"+userParams.get("sigungu"));
					sigungu = userParams.get("sigungu");
					userParams.put("sido", sido);
					userParams.put("sigungu", sigungu);
				}
			}else {//로그인 상태 && 처음 판매글 들어왔을 떄
				sido = dao.getUserSido(loginId);
				sigungu = dao.getUserSigungu(loginId);
				userParams.put("sido", dao.getUserSido(loginId));
				userParams.put("sigungu", dao.getUserSigungu(loginId));
			}

		
		}else {// 로그인 상태 아닐때
			

			if(userParams.get("sido")!=null) {
				if(userParams.get("sido").length()>0) {//로그인 상태x && 뷰에서 시도 선택했을 때
					logger.info("sido login x :"+userParams.get("sido"));

					sido = userParams.get("sido");
					sigungu = userParams.get("sigungu");

					userParams.put("sido", sido);
					userParams.put("sigungu", sigungu);
				}
			}else {//로그인 상태x && 처음 판매글 들어왔을 때
//				userParams.put("sido", "전체");
//				userParams.put("sigungu", "전체");
			}
		}
		
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
		
		
		if(userParams.get("sido")!=null) {
			if(userParams.get("sido").equals("시/도 선택")) {
				userParams.remove("sido");
			}
		}		
		if(userParams.get("sigungu")!=null) {
			if(userParams.get("sigungu").length()==0) {
				userParams.remove("sigungu");
			}
		}		
		if(userParams.get("minPrice")!=null) {
			if(userParams.get("minPrice").length()==0) {
				userParams.remove("minPrice");
			}
		}		
		if(userParams.get("maxPrice")!=null) {
			if(userParams.get("maxPrice").length()==0) {
				userParams.remove("maxPrice");
			}
		}

		list = dao.salesList(userParams);
		
		return list;
	}

	public void salesDelete(String sales_no) {
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












	
}
