package com.ino.gallery.controller;

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

import com.ino.gallery.dto.GalleryDTO;
import com.ino.gallery.service.GalleryService;
import com.ino.sales.dto.SalesDTO;

@Controller
public class GalleryController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired GalleryService service;
	
	@RequestMapping(value = "/galleryList.do", method = RequestMethod.GET)
	public String galleryList(Model model) {
		
		logger.info("galleryList call");
		ArrayList<GalleryDTO> list = service.galleryList();
		
		model.addAttribute("list", list);
		
		return "galleryList";
	}
	
	@RequestMapping(value = "/galleryWrite.go", method = RequestMethod.GET)
	public String galleryWrite() {
		
		logger.info("GO TO galleryWriteForm");
		
		return "galleryWriteForm";
	}
	
	@RequestMapping(value = "/galleryWrite.do", method = RequestMethod.POST)
	public String galleryWrite(MultipartFile[] photo, @RequestParam HashMap<String, String> params) {
		
		logger.info("params : "+params);
		logger.info("fileName : "+photo);
		
		return service.galleryWrite(photo, params);
	}
	
	@RequestMapping(value = "/galleryDetail.do", method = RequestMethod.GET)
	public String galleryDetail(Model model, @RequestParam String gallery_no) {
		
		logger.info("deatail gallery_no : "+gallery_no);
		
		GalleryDTO detailData = service.galleryDetail(Integer.parseInt(gallery_no), "detail");
		String page = "redirect:/galleryList.do";
		
		if(detailData != null) {
			
			logger.info("if문 진입");
			ArrayList<String> detailPhoto = service.galleryDetailPhoto(Integer.parseInt(gallery_no));
			
			logger.info("detailPhoto :"+detailPhoto);
			
			page = "galleryDetail";
			model.addAttribute("detailData", detailData);
			model.addAttribute("detailPhoto", detailPhoto);
			
		}
		
		return page;
	}
	
}
