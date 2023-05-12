package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.ReportDAO;
import com.ino.admin.dto.ReportDTO;
import com.ino.admin.dto.StarDTO;

@Service
public class ReportService {

	@Autowired ReportDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());



	public ReportDTO ureportdetail(String report_no) {
		
		return dao.ureportdetail(report_no);
	}

	public HashMap<String, Object> userlist(HashMap<String, Object> params) {
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1페이지  offset 0
	    // 2페이지 offset 5
	    // 3 페이지 offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // 만들 수 있는 총 페이지 수 : 전체 게시글의 수 / 페이지당 보여줄 수 있는 수
	    int total = 0;	    		
		
	    total = dao.utotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("총게시글 수 : "+ total);
	      logger.info("총 페이지 수 : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<ReportDTO> ulist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      ulist = dao.ulist(offset);
		
	      map.put("list", ulist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}

	public HashMap<String, Object> saleslist(HashMap<String, Object> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1페이지  offset 0
	    // 2페이지 offset 5
	    // 3 페이지 offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // 만들 수 있는 총 페이지 수 : 전체 게시글의 수 / 페이지당 보여줄 수 있는 수
	    int total = 0;	    		
		
	    total = dao.stotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("총게시글 수 : "+ total);
	      logger.info("총 페이지 수 : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<ReportDTO> slist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      slist = dao.slist(offset);
		
	      map.put("list", slist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}
	
}
