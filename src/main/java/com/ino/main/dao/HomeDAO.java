package com.ino.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.main.dto.HomeDTO;



public interface HomeDAO {

	int overlay(String user_id);
	
	int overlay2(String nickname);

	int join(HashMap<String, String> params);

	int login(String user_id, String pw);

	ArrayList<HomeDTO> list();

	int delete(String id);

	HashMap<String, Object> detail(String user_id);

	
	

	int userRegist(HashMap<String, String> params);

	void fileWrite(String oriFileName, String newFileName, String user_id, String cate_no);

	int bizregist(String user_id, int biz_num, String biz, String store_name, String state);

	void bizfileWrite(String oriFileName, String newFileName, String user_id, String cate_no);

	

	

	

	


	

	

}
