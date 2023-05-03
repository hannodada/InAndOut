package com.ino.mypage.service;

import java.util.ArrayList;
import java.util.List;

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

	public int mystar(String starid) {
		
		return dao.mystar(starid);
		
	}

	public MypageDTO myrider(String riderid) {
		// TODO Auto-generated method stub
		return dao.myrider(riderid);
	}

	public ArrayList<MypageDTO> saleslist(String saleslist) {
		// TODO Auto-generated method stub
		return dao.saleslist(saleslist);
	}

	public ArrayList<MypageDTO> galleryList(String galleryList) {
		// TODO Auto-generated method stub
		return dao.galleryList(galleryList);
	}
	
	
}
