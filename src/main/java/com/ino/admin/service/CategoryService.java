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
import com.ino.admin.dto.CategoryDTO;
import com.ino.admin.dto.StarDTO;


@Service
public class CategoryService {
	
	@Autowired CategoryDAO dao;
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
	      
	      ArrayList<CategoryDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      list = dao.list(offset);
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}

	public CategoryDTO goodsdetail(String goods_id, String string) {
		
		return dao.goodsdetail(goods_id);
	}

	public int goodsupdate(HashMap<String, String> params) {
		return dao.goodsupdate(params);
		
		
	}



}
