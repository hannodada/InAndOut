package com.ino.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.main.dto.HomeDTO;





public interface HomeDAO {

	ArrayList<HomeDTO> normalTopList();

	ArrayList<String> findTopPhoto(String top1, String top2, String top3, String top4, String top5);
	
	ArrayList<HomeDTO> hitGallery();

	ArrayList<HomeDTO> attentionTopList();
	

	

	

	

	

	


	

	

}
