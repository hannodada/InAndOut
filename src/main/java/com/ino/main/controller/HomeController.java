package com.ino.main.controller;

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

import com.ino.main.dto.HomeDTO;
import com.ino.main.service.HomeService;





@Controller
public class HomeController {
	
@Autowired HomeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/")
	public String home() {
		logger.info("로그인 페이지 이동");
		return "homeGnbBeforeLogin";
	}
	
	@RequestMapping(value="/join.go")
	public String joinButton() {
		return "joinButton";
	}
	@RequestMapping(value="/userJoin.go")
	public String userJoin() {
		return "joinForm";
	}
	@RequestMapping(value="/riderJoin.go")
	public String riderJoin() {
		return "riderForm";
	}	
	
	
	@RequestMapping(value="/userRegist.do",method = RequestMethod.POST)
		public String write(MultipartFile profile,  MultipartFile bizprofile,
				@RequestParam HashMap<String, String> params) {
	
		logger.info(" 파람 왓따! params : "+params);
		HomeDTO dto = new HomeDTO();
		logger.info("profile도 왔음 !! ㄷㄷ; : "+profile);
		logger.info("bizprofile도 도착 : "+bizprofile);
		return service.userRegist(profile, params,bizprofile);
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
	
	@RequestMapping(value="/join.ajax")
	@ResponseBody
	public HashMap<String, Object> join(
			@RequestParam HashMap<String, String> params){
		logger.info("이건 join.ajac! 파람! params : {}",params);
		return service.join(params);
	}
	
	@RequestMapping(value="/login.ajax")
	@ResponseBody
	public HashMap<String, Object> login(
			@RequestParam String id,@RequestParam String pw, 
			HttpSession session){
		
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
	
	
	
	
	
	
	@RequestMapping(value="/delete.ajax")
	@ResponseBody
	public HashMap<String, Object> delete(
			@RequestParam(value="delList[]") ArrayList<String> delList){
		//array 로 받을 경우 @RequestParam 에 value 를 반드시 명시해야함
		logger.info("delList : "+delList);
		return service.delete(delList);
	}
	
	
	
	@RequestMapping(value="/detail.go")
	public String detail(@RequestParam String id, 
			HttpSession session) {
		
		logger.info("detail id : "+id);
		session.setAttribute("detailId", id);
		return "detail";
	}
	
	@RequestMapping(value="/detail.ajax")
	@ResponseBody
	public HashMap<String, Object> detail(HttpSession session){
		String detailId = (String) session.getAttribute("detailId");
		logger.info("상세보기 할 아이디 : "+detailId);
		
		HashMap<String, Object> map = service.detail(detailId);
		logger.info("result : "+map);
		if(map != null && map.size()>0) {
			session.removeAttribute("detailId");
		}
				
		return map;
	}
	
	
	
	

}