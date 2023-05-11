package com.ino.star.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ino.star.service.StarService;

@Controller
public class StarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired StarService service;
	
	
	
}
