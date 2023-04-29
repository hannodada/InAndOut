package com.ino.gallery.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class GalleryController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/galleryWrite.go", method = RequestMethod.GET)
	public String galleryWrite() {
		
		return "galleryWrite";
	}
	
}
