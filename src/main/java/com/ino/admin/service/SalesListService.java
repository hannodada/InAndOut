package com.ino.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.SalesDAO;
import com.ino.admin.dto.SalesDTO;

@Service
public class SalesListService {

	@Autowired SalesDAO dao;
	
}
