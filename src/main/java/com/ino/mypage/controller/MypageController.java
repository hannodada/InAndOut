package com.ino.mypage.controller;

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

import com.ino.mypage.dto.MypageDTO;
import com.ino.mypage.service.MypageService;

@Controller

public class MypageController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	MypageService service;

	@RequestMapping(value = "/myPage.go", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		logger.info("유저의 마이페이지 호출");
		String page = "myPage";
		// ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage(user_id);

		logger.info("가져온 값 : " + dto);
		logger.info("닉네임: " + dto.getNickname());
		model.addAttribute("dto", dto);
		
		int avg;
		try {
			avg = service.mystar(user_id);
		} catch (Exception e) {
			avg = 0;
		}
		
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		
		// 판매글 띄우기
		ArrayList<MypageDTO> saleslist = service.saleslist(user_id);
		model.addAttribute("saleslist", saleslist);
		// 갤러리 띄우기
		ArrayList<MypageDTO> galleryList = service.galleryList(user_id);
		model.addAttribute("galleryList", galleryList);

		// 판매글, 갤러리 갯수 세기
		int countsales = service.countsales(user_id);
		model.addAttribute("countsales", countsales);
		int countgallery = service.countgallery(user_id);
		model.addAttribute("countgallery", countgallery);
		//프사 가져오기
		String id = (String) session.getAttribute("loginId");
		
		String new_photo_name = service.getPhotoName(id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		return page;
		}

	@RequestMapping(value = "/riderPage", method = RequestMethod.GET)
	public String riderPage(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		logger.info("라이더의 마이페이지 호출");
		String user_divv= (String) session.getAttribute("user_div");
		logger.info("sessionScope.user_div : "+user_divv);
		//라이더 정보 수정
		MypageDTO riderup = service.riderdetail(user_id);
		model.addAttribute("riderup", riderup);
		String page = "riderPage";
		// ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage(user_id);
		// 괄호 안에 session에 로그인 되어있는 값 가져와야함 05-loginBox 참고
		logger.info("가져온 값 : " + dto);
		logger.info("닉네임: " + dto.getNickname());
		model.addAttribute("dto", dto);
		
		
			int avg = service.mystar(user_id);
			logger.info("평균점수 :" + avg);
			model.addAttribute("avg", avg);
		
		// 라이더 extra 불러오기
		MypageDTO extra = service.myrider(user_id);
		logger.info("라이더 extra 불러오기: " + extra);
		model.addAttribute("extra", extra);
		// 라이더 star 불러오기
		int star001 = service.star001(user_id);
		model.addAttribute("star001", star001);
		int star002 = service.star002(user_id);
		model.addAttribute("star002", star002);
		int star003 = service.star003(user_id);
		model.addAttribute("star003", star003);
		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		
		return page;
	}

//	@RequestMapping(value="/myStar")
//	public String myStar(Model model) {
//		MypageDTO dto = service.mypage("user001");
//		String starid = dto.getUser_id();
//		if(starid == "user001") {
//		int avg = service.mystar(starid);
//		logger.info("평균점수 :"+avg);
//		}
//		return "myPage";
//	}

	@RequestMapping(value="/riderUpdate.go")
	public String riderUpdate(Model model,HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		String page = "redirect:/riderPage";
		MypageDTO extra = service.riderdetail("user003");
		//별점
		int avg = service.mystar(user_id);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		if(extra != null) {
		page ="riderUpdate";
		model.addAttribute("extra", extra);
		}
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		return page;
		}
	 
	 @RequestMapping(value="/riderUpdate.do", method = RequestMethod.POST)
	 public String riderUpdatedo(@RequestParam HashMap<String,
	 String>params, HttpSession session, Model model) {
	String user_id = (String) session.getAttribute("loginId");
	 logger.info("가져온 값들 : " + params); 
	 //별점
	 int avg = service.mystar(user_id);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
	 return service.riderUpdatedo(params);
	 
	 }
	

	@RequestMapping(value = "/riderSetting.go")
	public String riderSetting(Model model,@RequestParam HashMap<String,
			 String>params, HttpSession session) {
		
		String page = "redirect:/riderPage";
		String user_id = (String) session.getAttribute("loginId");
		MypageDTO riderSetting = service.riderSetting(user_id);
		logger.info("riderSetting : "+riderSetting);
		
		//별점
		int avg = service.mystar(user_id);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		
		if(!(riderSetting==null)) {
		logger.info("riderSetting에 값있어서 if문 안으로 들어옴");
		page ="riderAuth";

		model.addAttribute("riderSetting", riderSetting);
		}
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		return page;
		}
	
	@RequestMapping(value = "/riderSetting.do")
	public String riderSettingdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, MultipartFile photo) {
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		
		//별점
		int avg = service.mystar(user_id);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		
		logger.info(user_id+"/"+user_pw);
		
		String page ="redirect:/riderPage";
		String newpw = params.get("newpassword");
		logger.info("새로운 비밀번호 : "+ newpw);
		
		String sido = params.get("sido");
		String sigungu = params.get("sigungu");
		String left_addr = params.get("left_addr");
		
		params.put("sido", sido);
		params.put("sigungu", sigungu);
		params.put("left_addr", left_addr);
		logger.info("라이더 회원 정보 가져온 값들 : "+ params);
		
		HashMap<String, String> riderSettingdo = service.riderSettingdo(photo, params,session);
			logger.info("비밀번호가 일치합니다 새 비밀번호로 바꿨으묘");
		
		logger.info("riderSettingdo"+riderSettingdo);
		page = riderSettingdo.get("page");
		

		return page;
	}
	
	@RequestMapping(value="/riderAuth.do")
	public String riderAuth(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		
		logger.info("riderAuth에 담겨있는 params : "+params);
		String page = "riderPage";
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		String pw = params.get("user_pw");
		
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		
		logger.info("예전 비밀번호 : "+ user_pw);
		if(user_pw.equals(pw)) {
			logger.info("비밀번호가 일치합니다 회원정보 수정 페이지로 이동합니다");
			MypageDTO riderSetting = service.riderSetting(user_id);
			if(riderSetting != null) {
			
			model.addAttribute("riderSetting", riderSetting);
			page= "riderSetting";
		} else{	
			logger.info("현재 비밀번호가 일치하지 않으묘");
		}
		}
		return page;
	}
	
	@RequestMapping(value="/userAuth.go")
	public String userAuth(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		
		String page = "redirect:/myPage";
		String user_id = (String) session.getAttribute("loginId");
		MypageDTO riderSetting = service.riderSetting(user_id);
		logger.info("riderSetting : "+riderSetting);
		
		//별점
		int avg = service.mystar(user_id);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		
		if(!(riderSetting==null)) {
		logger.info("riderSetting에 값있어서 if문 안으로 들어옴");
		page ="userAuth";

		model.addAttribute("riderSetting", riderSetting);
		}
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		return page;
		}
	
	@RequestMapping(value="/userAuth.do")
	public String userAuthdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		
		logger.info("여기까지 도착");
		logger.info("userAuth에 담겨있는 params : "+params);
		String page = "userAuth";
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		String pw = params.get("user_pw");
		
		//별점
		int avg = service.mystar(user_id);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		
		
		logger.info("예전 비밀번호 : "+ user_pw);
		if(user_pw.equals(pw)) {
		logger.info("비밀번호가 일치합니다 회원정보 수정 페이지로 이동합니다");
		MypageDTO riderSetting = service.riderSetting(user_id);
		if(riderSetting != null) {
					
		model.addAttribute("riderSetting", riderSetting);
		page = "userSetting";
		} else{	
			logger.info("현재 비밀번호가 일치하지 않으묘");
		}
			
		}
		return page;
	}
	
	@RequestMapping(value = "/userSetting.do")
	public String userSettingdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, MultipartFile photo) {
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		
		logger.info(user_id+"/"+user_pw);
		
		String page ="redirect:/myPage";
		String newpw = params.get("newpassword");
		logger.info("새로운 비밀번호 : "+ newpw);
		
		String sido = params.get("sido");
		String sigungu = params.get("sigungu");
		String left_addr = params.get("left_addr");
		
		params.put("sido", sido);
		params.put("sigungu", sigungu);
		params.put("left_addr", left_addr);
		logger.info("라이더 회원 정보 가져온 값들 : "+ params);
		
		HashMap<String, String> riderSettingdo = service.riderSettingdo(photo, params,session);
			logger.info("비밀번호가 일치합니다 새 비밀번호로 바꿨으묘");
		
		logger.info("riderSettingdo"+riderSettingdo);
		page = riderSettingdo.get("page");
		logger.info("page 값? : "+page);

		return page;
	}
	
	@RequestMapping(value="/userBiz.go")
	public String userBiz(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		String page = "userBiz";
				return page;
		
	}
	
	@RequestMapping(value="/userBiz.do")
	public String userBizdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		String page = "userBiz";
				return page;
		
	}
	
	@RequestMapping(value="/overlay3.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay3(@RequestParam String nickname){
		logger.info("overlay3 : "+nickname);
		return service.overlay3(nickname);
	}


	
	@RequestMapping(value = "/mySales.go")
	public String mySales(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		return "mySales";
	}

	@RequestMapping(value = "/myGallery.go")
	public String myGallery(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		return "myGallery";
	}

	@RequestMapping(value = "/mySalesJjim.go")
	public String mySalesJjim(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		return "mySalesJjim";
	}

	@RequestMapping(value = "/myGalleryJjim.go")
	public String myGalleryJjim(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		return "myGalleryJjim";
	}

	@RequestMapping(value = "/mySetting.go")
	public String mySetting(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//별점
				int avg = service.mystar(user_id);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		return "mySetting";
	}
}
