package com.ino.star.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.star.dao.StarDAO;

@Service
public class StarService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired StarDAO dao;
	
}
