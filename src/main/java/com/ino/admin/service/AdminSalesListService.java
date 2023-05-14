package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.AdminSalesDAO;

import com.ino.admin.dto.AdminSalesDTO;

@Service
public class AdminSalesListService {

	@Autowired AdminSalesDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());

	public HashMap<String, Object> slist(HashMap<String, Object> params) {
	
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    

	    int total = 0;	    		
		
	    total = dao.stotalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    

	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminSalesDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      list = dao.slist(offset);
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
		
		
	}

	public void sblind(String sales_no) {
	    dao.sblind(sales_no);
	}


	
}
