package com.ino.star.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.sales.dto.SalesDTO;
import com.ino.star.dao.StarDAO;
import com.ino.star.dto.CategoryDTO;

@Service
public class StarService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired StarDAO dao;
	
	public ArrayList<SalesDTO> starPleaseList(String loginId) {

		return dao.starPleaseList(loginId);
	}

	public ArrayList<CategoryDTO> getStarList() {
		
		return dao.getStarList();
	}

	public SalesDTO salesDetail(int sales_no, String string) {
		
		return dao.salesDetail(sales_no);
	}
	
}
