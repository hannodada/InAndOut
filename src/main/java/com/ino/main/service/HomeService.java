package com.ino.main.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.plaf.basic.BasicSplitPaneUI.KeyboardDownRightHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ino.main.dao.HomeDAO;
import com.ino.main.dto.HomeDTO;





@Service
public class HomeService {
	
	@Autowired HomeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<HomeDTO> normalTopList() {
		
		return dao.normalTopList();
	}

	public ArrayList<String> findTopPhoto(String top1, String top2, String top3, String top4, String top5) {
		
		return dao.findTopPhoto(top1,top2,top3,top4,top5);
	}

	public ArrayList<HomeDTO> hitGallery() {
		
		return dao.hitGallery();
	}

	public ArrayList<HomeDTO> attentionTopList() {
		
		return dao.attentionTopList();
	}

	


	
}
