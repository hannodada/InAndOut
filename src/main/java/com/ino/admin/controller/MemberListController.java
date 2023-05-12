package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.admin.dto.MemberDTO;
import com.ino.admin.service.MemberListService;


@Controller
public class MemberListController {
	
	
	
	@Autowired MemberListService service;
	
	
	Logger logger  = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/ad.userlist.do")
    public String userlist() {
    	logger.info("회원 리스트 요청");
        return "adUserList";
    }
    
    @RequestMapping(value="/list.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> list( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("리스트 불러오세요");
       return service.list(params);
    }
    
	@RequestMapping(value="/ad.userdetail.do")
	public String userdetail(Model model, @RequestParam (required=false, value="user_id")String user_id) {
		/* 로그인 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("상세보기 요청"+user_id);
		MemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);

		
		return "adUserDetail";
	}  
	
	
	// 회원 추가정보
	@RequestMapping(value="/ad.userdetail.extra.do")
	public String userdetailextra(Model model,@RequestParam (required=false, value="user_id")String user_id) {
		/* 로그인 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("추가 정보 보기 요청"+user_id);
		MemberDTO dto = service.viewdetailextra(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);

		
		return "adUserDetailExtra";
	}  
	
	// 회원 일반 -> 인증자 처리 
	@RequestMapping(value = "/ad.userlist.do", method=RequestMethod.POST)
	public String history_userstate(@RequestParam HashMap<String, String> params, @RequestParam String user_id, Model model) {
		
		logger.info("params : {}",params);
		int row = service.history_userstate(params, user_id); // 밑에서 확인해보려고 row 에 담은거임
		logger.info("insert row : "+row);
		
		logger.info("상세보기 요청"+user_id);
		MemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);
		return "adUserDetailExtra";
	}	
	
	@RequestMapping(value="/ustatechange.do")
	public String userstatechange(Model model,@RequestParam (required=false, value="user_id")String user_id) {	
		logger.info("상태변경 창으로 이동"+user_id);
		MemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);
		return "adUserDetailState";
	}
	
	@RequestMapping(value = "/ad.updateUserState", method=RequestMethod.POST)
	public String updateUserState(@RequestParam HashMap<String, String> params, 
			                       @RequestParam String user_id, Model model){
	    String radioValue = params.get("radioValue"); // 라디오 버튼의 선택 값 추출
		logger.info("params : {}",params);
		int row = service.updateUserState(params, user_id, radioValue); // 밑에서 확인해보려고 row 에 담은거임
		logger.info("insert row : "+row);
		
		logger.info("회원 상태변경 요청"+user_id);
		MemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);
		return "adUserDetail";
	}		
	
	// 회원 히스토리 보기
    @RequestMapping(value="/user.history.go", method = RequestMethod.GET)
    public String userhistory(Model model, @RequestParam (required=false, value="user_id")String user_id) {
    	logger.info("리스트요청");
    	ArrayList<MemberDTO> userhistory=service.userhistory(user_id);
    
    	model.addAttribute("userhistory",userhistory);

        return "adUserHistory";
    }
	
    // 회원 히스토리 처리내역 보기
	@RequestMapping(value="/ad.history.detail.do")
	public String uhistorydetail(Model model, @RequestParam (required=false, value="user_id")String user_id, @RequestParam String user_state, @RequestParam String state_time) {
		/* 로그인 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("상세보기 요청"+user_id,user_state,state_time);
		MemberDTO dto = service.uhistorydetail(user_id,user_state,state_time);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);

		
		return "adUserHistoryDetail";
	} 
	
	@RequestMapping(value="/authuserlist.do")
	public String authuserlist(Model model) {


        return "adAuthUserList";
	} 
	
    @RequestMapping(value="/authuser.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> authuserlist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("리스트 불러오세요");
       return service.authuserlist(params);
    }		
	
	/* ******************라이더********************** */
	
	// 라이더 승인처리
	@RequestMapping(value = "/ad.riderlist.do", method=RequestMethod.POST)
	public String history_riderstate(@RequestParam HashMap<String, String> params, @RequestParam String user_id, Model model) {
		
		logger.info("params : {}",params);
		int row = service.history_riderstate(params, user_id); // 밑에서 확인해보려고 row 에 담은거임
		logger.info("insert row : "+row);
		
		logger.info("라이더 상세보기 요청"+user_id);
		MemberDTO dto = service.riderdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);
		return "adRiderDetail";
	}
	
	// 라이더 반려처리
	@RequestMapping(value = "/ad.riderlist.go", method=RequestMethod.POST)
	public String history_riderstate2(@RequestParam HashMap<String, String> params, @RequestParam String user_id, Model model) {
		
		logger.info("params : {}",params);
		int row = service.history_riderstate2(params, user_id); // 밑에서 확인해보려고 row 에 담은거임
		logger.info("insert row : "+row);
		
		logger.info("라이더 상세보기 요청"+user_id);
		MemberDTO dto = service.riderdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);
		return "adRiderDetail";
	}	
	// 라이더 승인/반려 페이지 이동
	@RequestMapping(value="/ad.riderlist.do")
	public String adriderlist(Model model) {

        return "adRiderList";
	} 	
	
	
    @RequestMapping(value="/rider.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> riderlist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("리스트 불러오세요");
       return service.riderlist(params);
    }		
	
	
	@RequestMapping(value="/riderdetail.do")
	public String riderdetail(Model model, @RequestParam (required=false, value="user_id")String user_id) {
		/* 로그인 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("라이더 상세보기 요청"+user_id);
		MemberDTO dto = service.riderdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);

		
		return "adRiderDetail";
	}
	
	@RequestMapping(value="/ad.riderdetail.extra.do")
	public String riderdetailextra(Model model, @RequestParam (required=false, value="user_id")String user_id) {
		/* 로그인 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("추가 정보 보기 요청"+user_id);
		MemberDTO dto = service.riderdetailextra(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);

		
		return "adRiderDetailExtra";
	}  	
	
	
	
}
