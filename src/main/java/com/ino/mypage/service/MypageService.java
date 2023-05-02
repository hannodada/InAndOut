package com.ino.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.mypage.DAO.MypageDAO;
import com.ino.mypage.dto.MypageDTO;


@Service
public class MypageService {
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MypageDAO dao;

	public MypageDTO mypage(String id) {
		logger.info("db에 있는 값 가져오는중");
		return dao.mypage(id);
	}
	
	
}
