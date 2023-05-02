package com.ino.gallery.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ino.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired GalleryService service;
	
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
	
}
