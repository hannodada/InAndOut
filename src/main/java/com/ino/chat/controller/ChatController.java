package com.ino.chat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ino.chat.service.ChatService;

@Controller
public class ChatController {
	@Autowired ChatService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/chat.go")
	public String chat(Model model, HttpSession session) {
		logger.info("controller chat.go called.");
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		model.addAttribute("selectedRoom", session.getAttribute("selectedRoom"));
		
		return "chatList";
	}
}
