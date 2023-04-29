package com.ino.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ino.sales.dto.BizDTO;
import com.ino.sales.service.SalesService;

@Controller
public class SalesController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SalesService service;
	
	@RequestMapping(value = "/salesWrite.go", method = RequestMethod.GET)
	public String salesWrite() {
			
		logger.info("list call");
		ArrayList<BizDTO> bizList = service.getBizList();
		logger.info("bizList : "+bizList);
		
		
		return "salesWrite";
	}

}
