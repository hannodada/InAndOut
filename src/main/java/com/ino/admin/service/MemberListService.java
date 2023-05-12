package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.MemberListDAO;
import com.ino.admin.dto.MemberDTO;
import com.ino.admin.dto.StarDTO;

@Service
public class MemberListService {
	
	@Autowired MemberListDAO dao;

	Logger logger  = LoggerFactory.getLogger(this.getClass());
	
	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
	    String userdiv = String.valueOf(params.get("userdiv"));
	    String userstate = String.valueOf(params.get("userstate"));
	    String userId = String.valueOf(params.get("userid"));
	    String search = String.valueOf(params.get("search"));
	    logger.info(page + "를 선택된 회원분류가" + userdiv +"때만 보여줘");
	    logger.info(page + "를 선택된 회원상태가" + userstate +"때만 보여줘");
	    logger.info("한페이지에 " + 5 +"개씩 보여줄 것 ");
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    
	    // 1페이지  offset 0
	    // 2페이지 offset 5
	    // 3 페이지 offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // 만들 수 있는 총 페이지 수 : 전체 게시글의 수 / 페이지당 보여줄 수 있는 수
	    int total = 0;	    
		
	    if(search.equals("default") || search.equals("")) {
	      if(userdiv.equals("default") && userstate.equals("default")) {
	      
	      // 전체 보여주기
	      total = dao.totalCount();
	       
	      }else if(!(userdiv.equals("default")) && userstate.equals("default")){
	             
	      // 회원 분류만 선택된 경우
	      total = dao.totalCountUserdiv(params);
	             
	       }else if(userdiv.equals("default") && !(userstate.equals("default"))){
	             
	      // 회원 상태만 선택 된 경우
	      total = dao.totalCountUserstate(params);
	             
	       }else {
	        
	      // 회원 분류, 회원 상태 둘다 선택 된 경우 
	      total = dao.totalCountAll(params);
	      }
	    
	    }else {	      
	    	   	   
	      // 검색기능 작동
	      total = dao.totalCountSearch(search);
	       }
	       		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("총게시글 수 : "+ total);
	      logger.info("총 페이지 수 : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<MemberDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);
	      
	      
	      if(search.equals("default") ||search.equals("")) {
	        if(userdiv.equals("default") && userstate.equals("default")) {
	          // 전체 보여주기
	          list = dao.list(offset);
	       
	        }else if(!(userdiv.equals("default")) && userstate.equals("default")) {
	          // 회원 분류만 선택 된 경우 
	          list = dao.listUserdiv(params);
	        }
	         
	        else if(userdiv.equals("default") && !(userstate.equals("default"))){
	          // 회원 상태만 선택 된 경우
	          list = dao.listUserstate(params);
	        
	        }else {
	          // 회원 분류, 회원 상태 모두 선택
	          list = dao.listAll(params);
	         }
	     
	      }else {
	         // 검색 기능
	         list = dao.listSearch(params);
	      }
	      		
		
	      //logger.info("list size : "+ list.size());
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;
	   		
	
	}

	public MemberDTO viewdetail(String user_id) {
	
		return dao.viewdetail(user_id);
	}



	public ArrayList<MemberDTO> riderlist() {
		
		return dao.riderlist();
	}


	public MemberDTO riderdetail(String user_id) {
		
		return dao.riderdetail(user_id);
	}






	public int uhistorywrite(HashMap<String, String> params) {
		
		return dao.uhistorywrite(params);
	}


	public MemberDTO viewdetailextra(String user_id) {
		
		return dao.viewdetailextra(user_id);
	}

	public int history_userstate(HashMap<String, String> params, String user_id) {
		int result = dao.history_userstate(params);
		dao.userchange(user_id);
		return result;		
		
	}

	public MemberDTO riderdetailextra(String user_id) {
		
		
		return dao.riderdetailextra(user_id);
	}

	// 승인처리 시 히스토리 작성
	public int history_riderstate(HashMap<String, String> params,String user_id) {
		int result = dao.history_riderstate(params);
		dao.riderchange(user_id);
		return result;
	}
	
	// 반려처리 시 히스토리 작성
	public int history_riderstate2(HashMap<String, String> params, String user_id) {
		
		return dao.history_riderstate2(params);
	}


	public ArrayList<MemberDTO> userhistory(String user_id) {
		
		return dao.userhistory(user_id);
	}



	public MemberDTO uhistorydetail(String user_id, String user_state, String state_time) {
		
		return dao.uhistorydetail(user_id,user_state,state_time);
	}

	public HashMap<String, Object> riderlist(HashMap<String, Object> params) {
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1페이지  offset 0
	    // 2페이지 offset 5
	    // 3 페이지 offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // 만들 수 있는 총 페이지 수 : 전체 게시글의 수 / 페이지당 보여줄 수 있는 수
	    int total = 0;	    		
		
	    total = dao.rtotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("총게시글 수 : "+ total);
	      logger.info("총 페이지 수 : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<MemberDTO> riderlist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      riderlist = dao.riderlist(offset);
		
	      map.put("list", riderlist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;	
	}

	public HashMap<String, Object> authuserlist(HashMap<String, Object> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1페이지  offset 0
	    // 2페이지 offset 5
	    // 3 페이지 offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // 만들 수 있는 총 페이지 수 : 전체 게시글의 수 / 페이지당 보여줄 수 있는 수
	    int total = 0;	    		
		
	    total = dao.atotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("총게시글 수 : "+ total);
	      logger.info("총 페이지 수 : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<MemberDTO> authuserlist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      authuserlist = dao.authuserlist(offset);
		
	      map.put("list", authuserlist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;
	}

	public int updateUserState(HashMap<String, String> params, String user_id, String radioValue) {
		int result = dao.updateUserState(params);
		dao.userStatechange(user_id,radioValue);
		return result; 
	}



	// 승인처리 시 히스토리 작성 









	




	}


