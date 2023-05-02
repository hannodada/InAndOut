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
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String mypage(Model model) {
		logger.info("마이페이지 호출");
		String page = "home";
		//ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage("user001");//db에 있는 값 저장하고
		logger.info("가져온 값 : "+ dto);
		logger.info("닉네임: " + dto.getNickname());
		model.addAttribute("dto",dto);
		//String nickname = RequestMap
		return page;
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
