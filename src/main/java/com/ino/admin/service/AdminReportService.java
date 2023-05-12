package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.AdminReportDAO;
import com.ino.admin.dto.AdminReportDTO;
import com.ino.admin.dto.AdminStarDTO;

@Service
public class AdminReportService {

	@Autowired AdminReportDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());



	public AdminReportDTO ureportdetail(String report_no) {
		
		return dao.ureportdetail(report_no);
	}

	public HashMap<String, Object> userlist(HashMap<String, Object> params) {
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.utotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminReportDTO> ulist = null;	    
		
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
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.stotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminReportDTO> slist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      slist = dao.slist(offset);
		
	      map.put("list", slist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}
	
}
