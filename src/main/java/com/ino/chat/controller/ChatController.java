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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ino.chat.dto.ChatDTO;
import com.ino.chat.dto.ImgChatDTO;
import com.ino.chat.dto.MsgDTO;
import com.ino.chat.service.ChatService;
import com.ino.member.dto.MemberDTO;
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
						userlist.add(service.username(roomusername));
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
			session.setAttribute("selectedRoom", id);
			
			String issale = service.issale(id);
			logger.info("issale: " + issale);
			if(issale.equals("판매")) {
				int salenum = service.salenum(id);
				SalesDTO msgsale = new SalesDTO();
				msgsale = service.msgsale(salenum);
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
			String username = service.username(msguser);
			String userphoto = service.userphoto(msguser);
			map.put("user", username);
			map.put("userphoto", userphoto);
		}
		
		map.put("login", login);
		
		return map;
	}
	
	@RequestMapping(value = "msgSend.ajax")
	@ResponseBody
	public void msgSend(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("msgSend 실행.");
		boolean login = false;
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			logger.info("params: " + params);
			service.msgsend(params);
			service.recentmsg(params);
			service.recentmsgno(params);
			service.recentmsgtime(params);
		}
		
	}
	
	@RequestMapping(value = "saleChatOpen.do")
	public String newchat(@RequestParam String sales_no, @RequestParam String user_id, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if(session.getAttribute("loginId") != null) {
			String roomuserno = service.findroomuser(user_id, sales_no);
			logger.info("findroomuser: " + roomuserno);
			if(roomuserno == null) {
				logger.info("속한 채팅방이 없다");
				int newroom = service.newroom(sales_no,loginId,user_id);
				session.setAttribute("selectedRoom", newroom);
			}else {
				session.setAttribute("selectedRoom", roomuserno);
			}
		}
		
		return "redirect:/chat.go";
	}
	
	@RequestMapping(value = "imgSend.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void imgSend(ImgChatDTO imgDTO, HttpSession session) throws Exception {
		logger.info("getid: " + imgDTO.getId());
		logger.info("getroomid: " + imgDTO.getRoomid());
		logger.info("getuploadfile: " + imgDTO.getUploadFile());
		logger.info("--------------------------------------------");
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", imgDTO.getId());
		params.put("roomid", imgDTO.getRoomid());
		params.put("msg", "이미지 전송");
		
		service.imgmsgsend(params, imgDTO.getUploadFile());
	}
	
	@RequestMapping(value = "chatsaledone.do")
	public String chatsaledone(@RequestParam String modalsaleid, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		service.chatsaledone(modalsaleid);
		
		//return "redirect:/salesDetail.do?sales_no=" + modalsaleid;
		return "redirect:/chat.go";
	}
	
	@RequestMapping(value = "chatriderList.ajax")
	@ResponseBody
	public HashMap<String, Object> chatriderList(HttpSession session){
		logger.info("chatList 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			String loginId = (String) session.getAttribute("loginId");
			logger.info("loginId = " + loginId);
			ArrayList<MemberDTO> chatriderlist = service.riderlist(loginId);
			
			for (MemberDTO args : chatriderlist) {
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
			}
			
			map.put("chatriderlist", chatriderlist);
		}
		
		return map;
		
	}
}
