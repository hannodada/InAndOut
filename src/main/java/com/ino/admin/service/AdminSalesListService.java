package com.ino.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.AdminSalesDAO;
import com.ino.admin.dto.AdminSalesDTO;

@Service
public class AdminSalesListService {

	@Autowired AdminSalesDAO dao;
	
}
