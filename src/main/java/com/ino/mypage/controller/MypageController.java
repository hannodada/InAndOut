package com.ino.mypage.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.ino.mypage.dto.MypageDTO;
import com.ino.mypage.service.MypageService;

@Controller


public class MypageController {
	
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MypageService service;
	
	@RequestMapping(value="/myPage.go", method = RequestMethod.GET)
	public String mypage(Model model) {
		logger.info("마이페이지 호출");
		String page = "myPage";
		//ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage("user001");
		//괄호 안에 session에 로그인 되어있는 값 가져와야함 05-loginBox 참고
		logger.info("가져온 값 : "+ dto);
		logger.info("닉네임: " + dto.getNickname());
		model.addAttribute("dto",dto);
		//String nickname = RequestMap
		String starid = dto.getUser_id();
		logger.info("아이디값 :"+starid);
		if(starid.equals("user001")) {
		int avg = service.mystar(starid);
		logger.info("평균점수 :"+avg);
		model.addAttribute("avg",avg);
		}else {
			logger.info("starid가 user001이 아닙니다");
		}
		//판매글 띄우기
		ArrayList<MypageDTO> saleslist = service.saleslist("user001");
		model.addAttribute("saleslist",saleslist);
		return page;
	}
	
	@RequestMapping(value="/riderPage", method = RequestMethod.GET)
	public String riderPage(Model model) {
		logger.info("라이더의 마이페이지 호출");
		String page = "riderPage";
		//ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage("user003");
		//괄호 안에 session에 로그인 되어있는 값 가져와야함 05-loginBox 참고
		logger.info("가져온 값 : "+ dto);
		logger.info("닉네임: " + dto.getNickname());
		model.addAttribute("dto",dto);
		//String nickname = RequestMap
		String starid = dto.getUser_id();
		logger.info("아이디값 :"+starid);
		if(starid.equals("user003")) {
		int avg = service.mystar(starid);
		logger.info("평균점수 :"+avg);
		model.addAttribute("avg",avg);
		}else {
			logger.info("starid가 user001이 아닙니다");
		}
		//라이더 extra 불러오기
		MypageDTO extra = service.myrider("user003");
		logger.info("라이더 소개: " + extra.getIntro());
		model.addAttribute("extra",extra);
		
		
		return page;
	}
	
	
	
//	@RequestMapping(value="/myStar")
//	public String myStar(Model model) {
//		MypageDTO dto = service.mypage("user001");
//		String starid = dto.getUser_id();
//		if(starid == "user001") {
//		int avg = service.mystar(starid);
//		logger.info("평균점수 :"+avg);
//		}
//		return "myPage";
//	}
	
	@RequestMapping(value="/riderSetting")
	public String riderSetting() {
		return "riderSetting";
	}
	
	@RequestMapping(value="/mySales")
	public String mySales() {
		return "mySales";
	}
	
	@RequestMapping(value="/myGallery")
	public String myGallery() {
		return "myGallery";
	}
	
	@RequestMapping(value="/mySalesJjim")
	public String mySalesJjim() {
		return "mySalesJjim";
	}
	
	@RequestMapping(value="/myGalleryJjim")
	public String myGalleryJjim() {
		return "myGalleryJjim";
	}
	
	@RequestMapping(value="/mySetting")
	public String mySetting() {
		return "mySetting";
	}
}
