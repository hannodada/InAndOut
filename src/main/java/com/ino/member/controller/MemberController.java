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
		
		String page = "home";
		String user_id = (String) session.getAttribute("loginId");
		logger.info("세션!!!아이디값 : "+user_id);
		
		
		// service -> dao ->service -> controller 로 온 값이 정확 한가?
		//logger.info("list : "+list.size());
		MemberDTO dto = new MemberDTO();
		String user_div_name = service.userCategory(user_id);
		String new_photo_name  = service.afterList(user_id);
		page = "home";
		logger.info("유저 구분 뭔지 좀 보자!!!!!  : "+user_div_name );
		
		
		
		if(user_div_name.equals("일반")) {
						if(new_photo_name != null) {
							
							session.setAttribute("new_photo_name", new_photo_name);
							logger.info("일반dto사진!! 나온거!!! :  " +new_photo_name);
							
							
						}
						if(new_photo_name == null) {
							//session.setAttribute("user_id", user_id);
							//logger.info("제발dto 유저 아이디좀 해줘 : "+dto.getUser_id());
							
						}
		}
		if(user_div_name.equals("라이더")) {
			if(new_photo_name != null) {
				
				session.setAttribute("new_photo_name", new_photo_name);
				//dto.setNew_photo_name(new_photo_name);
				String new_photo_name2 =  (String) session.getAttribute("new_photo_name");
				logger.info("(세션에저장된)라이더!!dtot사진!! 나온거!!! :  " +new_photo_name2);
				
				
			}
			if(new_photo_name == null) {
				//session.setAttribute("user_id", user_id);
				//dto.setUser_id(user_id);
				logger.info("제발dto 유저 아이디좀 해줘 : "+user_id);
				
			}
			
		}
		logger.info("여기 까지는 오너ㅏ?");
		
		//dto.setUser_div_name(user_div_name);
		session.setAttribute("user_div_name", user_div_name);
		
		/*
		//가상
		dto.setUser_id(user_id);
		
		model.addAttribute("dto",dto);
		*/
		
		

		return page;
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	   public String logout( HttpSession session) {
		   session.removeAttribute("loginId");
		   session.removeAttribute("new_photo_name");
		   session.removeAttribute("user_div_name");
		   
		   logger.info("로그아웃 요청");
		   logger.info((String) session.getAttribute("loginId"));
		   logger.info((String) session.getAttribute("new_photo_name"));
		   logger.info((String) session.getAttribute("user_div_name"));
	     
	      return "home";
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