package com.ino.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.chat.dto.ChatDTO;
import com.ino.chat.dto.MsgDTO;
import com.ino.chat.service.ChatService;
import com.ino.sales.dto.SalesDTO;

@Controller
public class ChatController {
	@Autowired ChatService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/chat.go")
	public String chat(Model model, HttpSession session) {
		logger.info("controller chat.go called.");
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		model.addAttribute("user_div_name", session.getAttribute("user_div_name"));
		model.addAttribute("selectedRoom", session.getAttribute("selectedRoom"));
		
		return "chatList";
	}
	
	@RequestMapping(value = "chatList.ajax")
	@ResponseBody
	public HashMap<String, Object> chatList(HttpSession session) {
		logger.info("chatList 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			String loginId = (String) session.getAttribute("loginId");
			logger.info("loginId = " + loginId);
			ArrayList<ChatDTO> chatlist = service.list(loginId);
			ArrayList<String> userlist = new ArrayList<String>();
			ArrayList<String> salephotolist = new ArrayList<String>();
			ArrayList<String> userphotolist = new ArrayList<String>();
			for (ChatDTO args: chatlist) {
				if(args.getMsg_div().equals("판매")) {
					String salephoto = service.salephoto(args.getMsg_div_no());
					salephotolist.add(salephoto);
				} else {
					salephotolist.add("rider");
				}
				int roomid = args.getRoomid();
				ArrayList<String> roomuserlist = service.userlist(roomid);
				logger.info("roomuserlist: "+roomuserlist);
				logger.info("salephotolist: "+salephotolist);
				for (String roomusername: roomuserlist) {
					if(!roomusername.equals(loginId)) {
						userlist.add(roomusername);
						userphotolist.add(service.userphoto(roomusername));
					}
				}
			}
			logger.info("userlist: "+userlist);
			logger.info("userphoto: "+userphotolist);
			map.put("list", chatlist);
			map.put("userlist", userlist);
			map.put("salephotolist", salephotolist);
			map.put("userphotolist", userphotolist);
		}
		
		map.put("login", login);
		
		return map;
	}
	
	@RequestMapping(value = "msgList.ajax")
	@ResponseBody
	public HashMap<String, Object> msgList(
			@RequestParam("id") int id, HttpSession session) {
		logger.info("msgList 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId") != null) {
			String issale = service.issale(id);
			logger.info("issale: " + issale);
			if(issale.equals("판매")) {
				int salenum = service.salenum(id);
				SalesDTO msgsale = service.msgsale(salenum);
				logger.info("msgsale: " + msgsale);
				map.put("sale", msgsale);
				String salephoto = service.salephoto(Integer.toString(salenum));
				map.put("salephoto", salephoto);
			}
			login = true;
			logger.info("id = " + id);
			ArrayList<MsgDTO> msglist = service.msglist(id);
			map.put("list", msglist);
			
			String msguser = service.msguser(id, (String)session.getAttribute("loginId"));
			String userphoto = service.userphoto(msguser);
			map.put("user", msguser);
			map.put("userphoto", userphoto);
		}
		
		map.put("login", login);
		
		return map;
	}
	
	@RequestMapping(value = "msgSend.ajax")
	@ResponseBody
	public void msgSend(
			@RequestParam HashMap<String, Object> params, HttpSession session) {
		logger.info("msgSend 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			logger.info("params: " + params);
			service.msgsend(params);
			service.recentmsg(params);
			service.recentmsgno(params);
			service.recentmsgtime(params);
		}
		
		map.put("login", login);
	}
	
	@RequestMapping(value = "newchat.do")
	public String newchat(@RequestParam String username, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		service.newroom(loginId, username);
		
		return "redirect:/chat.go";
	}
}
