package com.ino.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;
import com.ino.sales.service.SalesService;

@Controller
public class SalesController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SalesService service;
	
	@RequestMapping(value = "/salesList.do", method = RequestMethod.GET)
	public String salesList(Model model) {
		
		logger.info("salesList call");
		ArrayList<SalesDTO> list = service.salesList();
		
		model.addAttribute("list", list);
		
		return "salesList";
	}
	
	@RequestMapping(value = "/salesWrite.go", method = RequestMethod.GET)
	public String salesWriteForm(Model model) {
			
		logger.info("GO TO selesWriteForm page");
		ArrayList<BizDTO> bizList = service.getBizList();
		ArrayList<goodsDTO> goodsList = service.getGoodsList();
		
		logger.info("bizList : "+bizList);
		logger.info("goodsList : "+goodsList);
		
		model.addAttribute("bizList", bizList);
		model.addAttribute("goodsList", goodsList);
		
		return "salesWriteForm";
	}
	
	@RequestMapping(value = "/salesWrite.do", method = RequestMethod.POST)
	public String salesWrite(MultipartFile[] photo, @RequestParam HashMap<String, String> params) {
		
		logger.info("params : "+params);
		logger.info("fileName : "+photo);
		
		return service.salesWrite(photo, params);
	}
	
	@RequestMapping(value = "/salesDetail.do", method = RequestMethod.GET)
	public String salesDetail(Model model, @RequestParam String sales_no) {
		
		logger.info("deatail sales_no : "+sales_no);
		
		SalesDTO detailData = service.salesDetail(Integer.parseInt(sales_no), "detail");
		String page = "redirect:/salesList.do";
		
		if(detailData != null) {
			
			logger.info("if문 진입");
			page = "salesDetail";
			model.addAttribute("detailData", detailData);
			
		}
		
		return page;
	}	
	
}
