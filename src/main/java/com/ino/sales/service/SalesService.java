package com.ino.sales.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.sales.dao.SalesDAO;
import com.ino.sales.dto.BizDTO;

@Service
public class SalesService {

	@Autowired SalesDAO dao;
	
	public ArrayList<BizDTO> getBizList() {
		
		return dao.getBizList();
	}

	
	
}
