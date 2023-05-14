package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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

import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.service.AdminMemberListService;


@Controller
public class AdminMemberListController {
	
	
	
	@Autowired AdminMemberListService service;
	
	
	Logger logger  = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/ad.userlist.do")
    public String userlist(HttpSession session) {
    	
    	String page = "redirect:/";
    
		if(session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "adUserList";
		}
		
        return page;
    }
    
    @RequestMapping(value="/list.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> list(HttpSession session, @RequestParam HashMap<String, Object> params
 		  		
    		){
    	
       return service.list(params);
    }
    
	@RequestMapping(value="/ad.userdetail.do")
	public String userdetail(Model model, @RequestParam (required=false, value="user_id")String user_id) {
		/* �α��� 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("�󼼺��� ��û"+user_id);
		AdminMemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);

		
		return "adUserDetail";
	}  
	
	
	// ȸ�� �߰�����
	@RequestMapping(value="/ad.userdetail.extra.do")
	public String userdetailextra(Model model,@RequestParam (required=false, value="user_id")String user_id) {
		/* �α��� 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("�߰� ���� ���� ��û"+user_id);
		AdminMemberDTO dto = service.viewdetailextra(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);

		
		return "adUserDetailExtra";
	}  
	
	// ȸ�� �Ϲ� -> ������ ó�� 
	@RequestMapping(value = "/ad.userlist.do", method=RequestMethod.POST)
	public String history_userstate(@RequestParam HashMap<String, String> params, @RequestParam String user_id, Model model) {
		
		logger.info("params : {}",params);
		int row = service.history_userstate(params, user_id); // �ؿ��� Ȯ���غ����� row �� ��������
		logger.info("insert row : "+row);
		
		logger.info("�󼼺��� ��û"+user_id);
		AdminMemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);
		return "adUserDetailExtra";
	}	
	
	@RequestMapping(value="/ustatechange.do")
	public String userstatechange(Model model,@RequestParam (required=false, value="user_id")String user_id) {	
		logger.info("���º��� â���� �̵�"+user_id);
		AdminMemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);
		return "adUserDetailState";
	}
	
	@RequestMapping(value = "/ad.updateUserState", method=RequestMethod.POST)
	public String updateUserState(@RequestParam HashMap<String, String> params, 
			                       @RequestParam String user_id, Model model){
	    String radioValue = params.get("radioValue"); // ���� ��ư�� ���� �� ����
		logger.info("params : {}",params);
		int row = service.updateUserState(params, user_id, radioValue); // �ؿ��� Ȯ���غ����� row �� ��������
		logger.info("insert row : "+row);
		
		logger.info("ȸ�� ���º��� ��û"+user_id);
		AdminMemberDTO dto = service.viewdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("user", dto);
		return "adUserDetail";
	}		
	
	// 회원히스토리 이동
    @RequestMapping(value="/user.history.go", method = RequestMethod.GET)
    public String userhistory(Model model, @RequestParam (required=false, value="user_id")String user_id) {
    	logger.info("����Ʈ��û");
    	ArrayList<AdminMemberDTO> userhistory=service.userhistory(user_id);
    
    	model.addAttribute("userhistory",userhistory);

        return "adUserHistory";
    }
	
    // 회원 히스토리 디테일로 이동
	@RequestMapping(value="/ad.uhistory.detail.do")
	public String uhistorydetail(Model model,@RequestParam String user_state
	
			) {

		
		logger.info("유저아이디,상태"+user_state);
		AdminMemberDTO dto = service.uhistorydetail(user_state);
		
		logger.info("히스토리 디테일 dto"+dto);
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
    	logger.info("����Ʈ �ҷ�������");
       return service.authuserlist(params);
    }		
	
	/* ******************���̴�********************** */
	
	// ���̴� ����ó��
	@RequestMapping(value = "/ad.riderlist.do", method=RequestMethod.POST)
	public String history_riderstate(@RequestParam HashMap<String, String> params, @RequestParam String user_id, Model model) {
		
		logger.info("params : {}",params);
		int row = service.history_riderstate(params, user_id); // �ؿ��� Ȯ���غ����� row �� ��������
		logger.info("insert row : "+row);
		
		logger.info("���̴� �󼼺��� ��û"+user_id);
		AdminMemberDTO dto = service.riderdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);
		return "adRiderDetail";
	}
	
	// ���̴� �ݷ�ó��
	@RequestMapping(value = "/ad.riderlist.go", method=RequestMethod.POST)
	public String history_riderstate2(@RequestParam HashMap<String, String> params, @RequestParam String user_id, Model model) {
		
		logger.info("params : {}",params);
		int row = service.history_riderstate2(params, user_id); // �ؿ��� Ȯ���غ����� row �� ��������
		logger.info("insert row : "+row);
		
		logger.info("���̴� �󼼺��� ��û"+user_id);
		AdminMemberDTO dto = service.riderdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);
		return "adRiderDetail";
	}	
	// ���̴� ����/�ݷ� ������ �̵�
	@RequestMapping(value="/ad.riderlist.do")
	public String adriderlist(Model model) {

        return "adRiderList";
	} 	
	
	
    @RequestMapping(value="/rider.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> riderlist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("����Ʈ �ҷ�������");
       return service.riderlist(params);
    }		
	
	
	@RequestMapping(value="/riderdetail.do")
	public String riderdetail(Model model, @RequestParam (required=false, value="user_id")String user_id) {
		/* �α��� 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("���̴� �󼼺��� ��û"+user_id);
		AdminMemberDTO dto = service.riderdetail(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);

		
		return "adRiderDetail";
	}
	
	@RequestMapping(value="/ad.riderdetail.extra.do")
	public String riderdetailextra(Model model, @RequestParam (required=false, value="user_id")String user_id) {
		/* �α��� 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("�߰� ���� ���� ��û"+user_id);
		AdminMemberDTO dto = service.riderdetailextra(user_id);
		logger.info("dto : ",dto);
		model.addAttribute("rider", dto);

		
		return "adRiderDetailExtra";
	}  	
	
	
	
}
