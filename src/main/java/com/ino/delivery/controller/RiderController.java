package com.ino.delivery.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.delivery.dto.RiderDTO;
import com.ino.delivery.service.RiderService;


@Controller
public class RiderController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RiderService service;
	
	
	@RequestMapping(value = "/riderList.go") // 라이더 리스트 보기
	public String riderList(Model model, HttpSession session) {
		// select 사진 들고와야함
		
		String page = "redirect:/";
		
		if(session.getAttribute("loginId")!=null) {
			logger.info("riderList 컨트롤러 이동");
			ArrayList<RiderDTO> listRL = service.listRL();
			model.addAttribute("riderList",listRL);
			// 해당 채팅에서 판매글 번호 들고오기
			
			page = "riderList";
		}
		
		return page;
	}
	/*
	 * @RequestMapping(value = "/userOffer.go") public String Rider() { return
	 * "userOffer"; }
	 */
	
	
	@RequestMapping(value = "/userOffer.do") // 사용자가 제안하는 페이지
	public String userOfferGo(@RequestParam String user_id, Model model, @RequestParam String sales_no) {
		
		logger.info("user_id 값 =  " +user_id,sales_no);
		
		if(user_id != null) {
		
		RiderDTO dto = service.dtoUO(user_id);
		logger.info("user_id =  " + dto);
		model.addAttribute("dto", dto);
	
		}
		
		RiderDTO dtoS = service.dtoUOS(sales_no);
		model.addAttribute("dtoS",dtoS);
		
		return "userOffer";
	}
	
	
	/*
	 * @RequestMapping(value = "/riderOfferWrite.do") public String
	 * userOfferWrite(@RequestParam HashMap<String, String> params) {
	 * 
	 * logger.info("인수,인도 주소" + params);
	 * 
	 * return service.uoWrite(params); }
	 */
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/riderOfferDetail") // 라이더에게 제한한 사용자 물품 상세보기
	public String riderOfferDetail(@RequestParam String idx, Model model) {
		
		// select 
		logger.info("riderOfferDetail : " + idx);
		String page = "riderOffer";
		
		RiderDTO dtoROD = service.dtoROD(idx);
		
		if(dtoROD != null) {
			page = "riderOfferDetail";
			logger.info("ff : "+ dtoROD);
			model.addAttribute("dto", dtoROD);
		}
		return page;
	}
	
	@RequestMapping(value = "/riderOffer.go") // 라이더 제안 확인
	public String riderOffer(Model model, HttpSession session) {
		
		// select
		String page = "redirect:/";
		
		if(session.getAttribute("loginId")!=null) {
			logger.info("riderOffer 컨트롤러 이동");
			
			ArrayList<RiderDTO> listRO = service.listRO();
			model.addAttribute("riderOffer",listRO);
			
			page = "riderOffer";
		}
		return page;
	}
	
	
	
	//-----------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/deliveryState.do") // 배송 상태 변경
	public String deliveryState(@RequestParam String idx, HttpSession session) {
		
		// DB에 update로 배송상태를 배송완료로 변경하기 
		// 배송 이력 보기
		logger.info("deliveryState.do 컨트롤러 이동 : " + idx);
		service.deliveryUpdate(idx);
		
		service.deliveryInsert(idx);
		
		return "redirect:/deliveryState.go";
	}
	
	
	@RequestMapping(value = "/deliveryState.go")
	public String deliveryStateG(Model model, HttpSession session) {
		
		String page = "redirect:/";
		
		if(session.getAttribute("loginId")!=null) {
			
		logger.info("deliveryState");
		ArrayList<RiderDTO> listDS = service.listDS();
		model.addAttribute("deliveryState",listDS);
		
		page = "deliveryState";
		}
		return page;
	}
	
	@RequestMapping(value = "/deliveryNone.do") // 
	public String deliveryNone(@RequestParam String idx) {
		
		service.deliveryNone(idx);
		
		return "redirect:/riderOffer.go";
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	/*
	@RequestMapping(value = "recognize.ajax")
	@ResponseBody
	public HashMap<String, Object> recognizeAjax(@RequestParam HashMap<String, String> params){
		
		logger.info("ajax params 값 : "+params);
		
		String idxd = params.get("delivery_offer_no");
		logger.info("delivery_offer_no : "+idxd);
		
		
		service.deliveryUpdate(params);
		
		service.deliveryInsert(params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("url", "deliveryState.go");
		
		return map;
	}
	*/
	
	
	
	
	
	//-----------------------------------------------------------------------------------------------------------
	
	/*@RequestMapping(value = "/select.do")
		public String selectDo(@RequestParam HashMap<String, String> params){
			logger.info("select value값 "+params);
			return service.selectDo(params);
		}
	*/
	
	
	@RequestMapping(value = "/deliveryHistory.go") // 배송 이력 보기
	public String deliveryHistory(Model model, HttpSession session) {
		
		// DB에 배송상태(delivery_state = '배송완료')가 배송완료인 것들만 출력하기
		String page = "redirect:/";
		
		if(session.getAttribute("loginId")!=null) {
			
			logger.info("deliveryHistory 컨트롤러 이동");
			ArrayList<RiderDTO> listDH = service.listDH();
			model.addAttribute("deliveryHistory",listDH);
			
			page = "deliveryHistory";
		}
		
		return page;
	}
	
	@RequestMapping(value = "/select.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> selectAjax(Model model, @RequestParam HashMap<String, String> params) {

		logger.info("delivery_state :"+params.get("delivery_state"));
		logger.info("delivery_offer_no :"+params.get("delivery_offer_no"));
//		ArrayList<RiderDTO> selectList = service.select(delivery_state, delivery_offer_no);
		
//		logger.info("delivery_state : " + delivery_state,delivery_offer_no);
		
//		map.put("delivery_state", selectList);
		
		return service.select(params);
	}

	
	@RequestMapping(value ="write.do") // userOffer에서 제안요청하기 버튼 클릭시 
	public String writeDo(@RequestParam HashMap<String, String> params) {
		
		logger.info("params 값"+params);
		
		return service.writeDo(params);
	}
	
	
	
	
	
}
