package com.ino.star.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ino.sales.dto.SalesDTO;
import com.ino.star.dto.CategoryDTO;
import com.ino.star.service.StarService;

@Controller
public class StarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired StarService service;
	
	@RequestMapping(value = "/starPleaseList.go")
	public String starPleaseList(HttpSession session, Model model) {
		
		String page = "redirect:/";
		String loginId = (String) session.getAttribute("loginId");
		
		ArrayList<SalesDTO> list = service.starPleaseList(loginId);
		
		
		return page;
	}
	
	@RequestMapping(value = "/starThrow.go")
	public String starThrowForm(HttpSession session, Model model, @RequestParam String sales_no) {
		
		String page = "starThrowForm";
		String loginId = null;
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				logger.info("loginId :"+loginId);
				model.addAttribute("loginId", loginId);
				
				ArrayList<CategoryDTO> starList = service.getStarList();
				model.addAttribute("starList", starList);
				logger.info("starList :"+starList);
				SalesDTO detailData = service.salesDetail(Integer.parseInt(sales_no), "star");
				model.addAttribute("detailData", detailData);
				logger.info("detailData :"+detailData);
			}
			
		}
		return page;
	}
	
	@RequestMapping(value = "/starThrow.do")
	public String starThrow(HttpSession session, Model model) {
		
		String page = "redirect:/";

		return page;
	}
	
}
