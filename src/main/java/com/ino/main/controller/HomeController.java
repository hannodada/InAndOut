package com.ino.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ino.main.dto.HomeDTO;
import com.ino.main.service.HomeService;







@Controller
public class HomeController {
	
@Autowired HomeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value={"/","/home"})
	public String home(Model model) {
		logger.info("홈페이지로 이동");
		
		ArrayList<HomeDTO> list = service.normalTopList();
		logger.info("topList:" + list.size());
		model.addAttribute("list", list);
		HomeDTO dto = new HomeDTO();
		logger.info(dto.getUser_id());
		
		
		
		
		return "home";
	}
	//homeGnbBeforeLogin

	@RequestMapping(value="/login.go")
	public String login() {
		return "login";
	}
	
	
	
	@RequestMapping(value="/join.go")
	public String joinButton() {
		return "joinButton";
	}
	@RequestMapping(value="/userJoin.go")
	public String userJoin() {
		return "joinForm";
	}
	@RequestMapping(value="/riderJoin.go")
	public String riderJoin() {
		return "riderForm";
	}	
	@RequestMapping(value="/profile.go")
	public String profile() {
		return "profile";
	}
	
	

	


}