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
		/*
		ArrayList<String> list = service.normalTopList();
		
		logger.info("list : "+ list.size());
		logger.info("list : " + list.get(0));
		logger.info("list : " + list.get(1));
		logger.info("list : " + list.get(2));
		String top1 = list.get(0);
		String top2 = list.get(1);
		String top3 = list.get(2);
		String top4 = list.get(3);
		String top5 = list.get(4);
		
		ArrayList<String> findTopPhoto = service.findTopPhoto(top1,top2, top3, top4,top5);
		logger.info("findTopPhoto : "+ findTopPhoto.size());

		
		logger.info("findTopPhoto : " + findTopPhoto.get(0));
		logger.info("findTopPhoto : " + findTopPhoto.get(1));
		logger.info("findTopPhoto : " + findTopPhoto.get(2));
		

		//model.addAttribute("findTopPhoto5",findTopPhoto5);
		if(findTopPhoto.size() == 0) {
			
		}if(findTopPhoto.size() == 1) {
			String findTopPhoto1 = findTopPhoto.get(0);
			model.addAttribute("findTopPhoto1",findTopPhoto1);
		}
		if(findTopPhoto.size() == 2) {
			String findTopPhoto1 = findTopPhoto.get(0);
			String findTopPhoto2 = findTopPhoto.get(1);
			model.addAttribute("findTopPhoto1",findTopPhoto1);
			model.addAttribute("findTopPhoto2",findTopPhoto2);
			
		}
		if(findTopPhoto.size() == 3) {
			String findTopPhoto1 = findTopPhoto.get(0);
			String findTopPhoto2 = findTopPhoto.get(1);
			String findTopPhoto3 = findTopPhoto.get(2);
			model.addAttribute("findTopPhoto1",findTopPhoto1);
			model.addAttribute("findTopPhoto2",findTopPhoto2);
			model.addAttribute("findTopPhoto3",findTopPhoto3);
		}
		if(findTopPhoto.size() == 4) {
			String findTopPhoto1 = findTopPhoto.get(0);
			String findTopPhoto2 = findTopPhoto.get(1);
			String findTopPhoto3 = findTopPhoto.get(2);
			String findTopPhoto4 = findTopPhoto.get(3);
			model.addAttribute("findTopPhoto1",findTopPhoto1);
			model.addAttribute("findTopPhoto2",findTopPhoto2);
			model.addAttribute("findTopPhoto3",findTopPhoto3);
			model.addAttribute("findTopPhoto4",findTopPhoto4);
		}
		if(findTopPhoto.size() == 5) {
			String findTopPhoto1 = findTopPhoto.get(0);
			String findTopPhoto2 = findTopPhoto.get(1);
			String findTopPhoto3 = findTopPhoto.get(2);
			String findTopPhoto4 = findTopPhoto.get(3);
			String findTopPhoto5 = findTopPhoto.get(4);
			model.addAttribute("findTopPhoto1",findTopPhoto1);
			model.addAttribute("findTopPhoto2",findTopPhoto2);
			model.addAttribute("findTopPhoto3",findTopPhoto3);
			model.addAttribute("findTopPhoto4",findTopPhoto4);
			model.addAttribute("findTopPhoto5",findTopPhoto5);
		}
		*/
		
		
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