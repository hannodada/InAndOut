package com.ino.sales.controller;

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
	public String salesList(Model model, HttpSession session) {
		
		logger.info("salesList call");
		
		ArrayList<SalesDTO> list = service.salesList(session);
		
		model.addAttribute("list", list);
		
		return "salesList";
	}
	
	@RequestMapping(value = "/filtering.ajax", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> filtering(Model model, @RequestParam String filterName) {
		
		logger.info(filterName);

		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SalesDTO> filteredList = service.filtering(filterName);
		
		logger.info("filteredList :"+filteredList);
		
		map.put("filteredList", filteredList);

		return map;
	}
	
	@RequestMapping(value = "/salesWrite.go", method = RequestMethod.GET)
	public String salesWriteForm(Model model, HttpSession session) {
		
		String page = "redirect:/home";

		if(session.getAttribute("loginId")!=null) {
			
			model.addAttribute("loginId", session.getAttribute("loginId"));
			
			logger.info("GO TO selesWriteForm page");
			
			ArrayList<BizDTO> bizList = service.getBizList();
			logger.info("bizList : "+bizList);
			model.addAttribute("bizList", bizList);
			
			page = "salesWriteForm";
			
		}else {
			
			session.setAttribute("msg", "로그인이 필요한 기능입니다.");
			session.removeAttribute("msg");
			
		}

		return page;
	}
	
	@RequestMapping(value = "/goodsCall.ajax")
	@ResponseBody
	public HashMap<String, Object> goodsCall(@RequestParam String biz_id){
		
		logger.info("biz_id : "+biz_id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<goodsDTO> goodsList = service.goodsCall(biz_id);
		
		logger.info("goodsList : "+goodsList);
		
		map.put("goodsList", goodsList);
		
		return map;
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
			ArrayList<String> detailPhoto = service.salesDetailPhoto(Integer.parseInt(sales_no));
			
			logger.info("detailPhoto :"+detailPhoto);
			
			page = "salesDetail";
			model.addAttribute("detailData", detailData);
			model.addAttribute("detailPhoto", detailPhoto);
			
		}
		
		return page;
	}
	
}
