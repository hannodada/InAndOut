package com.ino.delivery.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.delivery.dao.RiderDAO;
import com.ino.delivery.dto.RiderDTO;

@Service
public class RiderService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RiderDAO dao;
	
	public ArrayList<RiderDTO> listRO() {
		logger.info("listRO 서비스 이동");
		return dao.listRO();
	}

	public RiderDTO dtoROD(String delivery_offer_no) {
		logger.info("dtoROD 서비스 이동");
		return dao.dtoROD(delivery_offer_no);
		//,sales_no
	}

	public ArrayList<RiderDTO> listDH() {
		logger.info("listDH 서비스 이동");
		return dao.listDH();
	}

	public ArrayList<RiderDTO> listDS() {
		return dao.listDS();
	}

	public RiderDTO dtoUO(String user_id) {
		logger.info("dtoUO 서비스 도착 : "+ user_id);
		return dao.dtoUO(user_id);
	}

	public ArrayList<RiderDTO> listRL() {
		return dao.listRL();
	}

	/*
	 * public String uoWrite(HashMap<String, String> params) {
	 * 
	 * RiderDTO dto = new RiderDTO();
	 * 
	 * logger.info("params :" + params); dto.setFrom_addr(params.get("from_addr"));
	 * dto.setTo_addr(params.get("to_addr"));
	 * 
	 * int row = dao.uoWrite(dto); logger.info("update row :" + row);
	 * 
	 * return "riderOffer"; }
	 */

	public RiderDTO dtoUOS(String sales_no) {
		return dao.dtoUOS(sales_no);
	}



	public void deliveryInsert(String idx) {
		
		int row = dao.deliveryInsert(idx);
		logger.info("insert 횟수(1 정상)"+row);
		
	}

	public void deliveryUpdate(String idx) {
		
		int row =dao.deliveryUpdate(idx);
		logger.info("update 횟수(1 정상)"+row);
	}

	public void deliveryNone(String idx) {

		int row = dao.deliveryNone(idx);
		logger.info("update 횟수(1 정상)"+row);
		
	}

	/*
	  public ArrayList<RiderDTO> select(String delivery_state, String delivery_offer_no) {
	  
	  logger.info(delivery_state,delivery_offer_no);
	  
	  return dao.selectBySC(delivery_state,delivery_offer_no); 
	  }
	 */

	public HashMap<String, Object> select(HashMap<String, String> params) {
	
		logger.info("params 값" + params);
		
		RiderDTO dto = new RiderDTO();
		dto.setDelivery_accept_no(Integer.parseInt(params.get("delivery_offer_no")));
		dto.setDelivery_state(params.get("delivery_state"));
		
		logger.info("dto delivery_accept_no : "+dto.getDelivery_accept_no());
		logger.info("dto Delivery_state : "+dto.getDelivery_state());
		
		return dao.select(dto);
	}

	public String writeDo(HashMap<String, String> params) {
		
		logger.info("params 값" + params);
		
		String page = "redirect:/riderList";
		
		RiderDTO dto = new RiderDTO();
		dto.setUser_id(params.get("user_id"));
		dto.setSales_no(Integer.parseInt(params.get("sales_no")));
		dto.setFrom_addr(params.get("from_addr"));
		dto.setTo_addr(params.get("to_addr"));
		dto.setRider_id(params.get("rider_id"));
		
		logger.info("user_id : " + dto.getUser_id());
		logger.info("sales_no : " + dto.getSales_no());
		logger.info("From_addr : " + dto.getFrom_addr());
		logger.info("To_addr : " + dto.getTo_addr());
		logger.info("rider_id : " + dto.getRider_id());
		
		int row = dao.writeUO(dto);
		logger.info("insert 횟수"+row);
		
		page = "redirect:/deliveryState.go";
		
		return page;
	}

	/*
	public String selectDo(HashMap<String, String> params) {
		return dao.seletDo(params);
	}	
	*/


}
