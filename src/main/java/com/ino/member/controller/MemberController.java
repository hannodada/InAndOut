package com.ino.member.controller;

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



import com.ino.member.dto.MemberDTO;
import com.ino.member.service.MemberService;







@Controller
public class MemberController {
	
@Autowired MemberService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	
	@RequestMapping(value="/login.ajax" ,method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(
			@RequestParam String id,@RequestParam String pw, 
			HttpSession session){
		
		//*****왜 로거에 안뜨지??
		logger.info("로그인 요청온거 로거좀 찍어주세요.,,");
		logger.info(id+"/"+pw);
		int success = service.login(id,pw);
		logger.info("login success : "+success);
		
		if(success == 1) {
			session.setAttribute("loginId", id);
			
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		
		return map;
	}
	
	
	@RequestMapping(value={"/afterLogin.go"})
	public String afterhome(HttpSession session) {
		
		String page = "redirect:/afterLogin.do";
		
		logger.info("로그인 후 홈페이지로 이동");
		if(session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "redirect:/afterLogin.do";
		}
		return page;
	}
	
	@RequestMapping(value="/afterLogin.do")
	public String afterList(Model model , HttpSession session) {		
		logger.info("afterList call!!"); // 컨트롤러가 도착 했는지? (파라메터는 제대로 들어 왔는지?)
		
		String page = "homeGnbAfterLogin";
		String user_id = (String) session.getAttribute("loginId");
		logger.info("세션!!!아이디값 : "+user_id);
		
		MemberDTO dto = service.afterList(user_id);
		// service -> dao ->service -> controller 로 온 값이 정확 한가?
		//logger.info("list : "+list.size());
		
		
		if(dto != null) {
			page = "home";
			logger.info("dto 나온거!!! " +dto.getNew_photo_name());
			model.addAttribute("dto", dto);
		}
		
		
		
					
		return page;
	}
	
	
	@RequestMapping(value="/userRegist.do",method = RequestMethod.POST)
		public String write(MultipartFile profile,  MultipartFile bizprofile,
				@RequestParam HashMap<String, String> params) {
	
		logger.info(" 파람 왓따! params : "+params);
		MemberDTO dto = new MemberDTO();
		logger.info("profile도 왔음 !! ㄷㄷ; : "+profile);
		logger.info("bizprofile도 도착 : "+bizprofile);
		return service.userRegist(profile, params,bizprofile);
	}
	
	@RequestMapping(value="/riderRegist.do",method = RequestMethod.POST)
	public String riderwrite(MultipartFile profile,  MultipartFile bizprofile,
			@RequestParam HashMap<String, String> params) {

	logger.info(" 파람 왓따! params : "+params);
	MemberDTO dto = new MemberDTO();
	logger.info("riderprofile도 왔음 !! ㄷㄷ; : "+profile);
	logger.info("riderbizprofile도 도착 : "+bizprofile);
	return service.riderRegist(profile, params,bizprofile);
}
	
	
	
	
	@RequestMapping(value="/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String user_id){
		logger.info("overlay : "+user_id);
		return service.overlay(user_id);
	}
	@RequestMapping(value="/overlay2.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay2(@RequestParam String nickname){
		logger.info("overlay2 : "+nickname);
		return service.overlay2(nickname);
	}
	

	
	
	

}