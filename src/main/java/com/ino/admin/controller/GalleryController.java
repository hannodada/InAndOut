package com.ino.admin.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.admin.dto.GalleryDTO;
import com.ino.admin.service.GalleryService;

@Controller
public class GalleryController {

	@Autowired GalleryService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/adgallerylist.do")
	public String userlist(Model model) {
	
	    return "adGalleryList";
	}

	   @RequestMapping(value="/gallery.ajax", method = RequestMethod.POST)
	    @ResponseBody
	    public HashMap<String, Object> list( @RequestParam HashMap<String, Object> params
	 		  		
	    		){
	    	logger.info("리스트 불러오세요");
	       return service.list(params);
	    }		
	
}
