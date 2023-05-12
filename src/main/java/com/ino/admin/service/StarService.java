package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ino.admin.dao.CategoryDAO;
import com.ino.admin.dao.StarDAO;
import com.ino.admin.dto.CategoryDTO;
import com.ino.admin.dto.MemberDTO;
import com.ino.admin.dto.StarDTO;


@Service
public class StarService {
	
@Autowired StarDAO dao;
Logger logger  = LoggerFactory.getLogger(this.getClass());


	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1페이지  offset 0
	    // 2페이지 offset 5
	    // 3 페이지 offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // 만들 수 있는 총 페이지 수 : 전체 게시글의 수 / 페이지당 보여줄 수 있는 수
	    int total = 0;	    		
		
	    total = dao.totalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("총게시글 수 : "+ total);
	      logger.info("총 페이지 수 : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<StarDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      list = dao.list(offset);
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
		
		

	}


	public int starwrite(HashMap<String, String> params) {
		logger.info("별점등록");
		return dao.starwrite(params);
	}


	public HashMap<String, Object> staroverlay(String cate_no) {
	      HashMap<String, Object> map2 = new HashMap<String, Object>();
	      // 같은 아이디가 있는가? 있으면 1 없으면 0
	      map2.put("staroverlay", dao.staroverlay(cate_no));      
	      return map2;

	}


	public int starupdate(HashMap<String, String> params) {
		
		return dao.starupdate(params);
	}




	public StarDTO stardetail(String cate_no, String string) {
		
		return dao.stardetail(cate_no);
	}









	



}
