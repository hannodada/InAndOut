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

	public HashMap<String, Object> overlay(String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 같은 아이디가 있는가? 있으면 1 없으면 0
		map.put("overlay", dao.overlay(user_id));		
		return map;
	}
	
	public HashMap<String, Object> overlay2(String nickname) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 같은 닉네임이 있는가? 있으면 1 없으면 0
		map.put("overlay2", dao.overlay2(nickname));		
		return map;
	}
	
	public String userRegist(MultipartFile profile, HashMap<String, String> params, 
			MultipartFile bizprofile) {
		String page = "joinForm";
		
		//**이거 idx 값으로 해서 dto로 넣어야 할까?? 고민중..,,,
		int userRegistrow = dao.userRegist(params);
		logger.info("userRegistrow변경되면 이거 나옴!!: "+userRegistrow);
		HomeDTO dto = new HomeDTO();
		dto.setUser_id(params.get("user_id"));
		
		
		String user_id = dto.getUser_id();
		logger.info("if문 밖에는 있나???"+user_id);
		
		if(!profile.getOriginalFilename().equals("")) {
			logger.info("profile파일 업로드 작업");
			fileSave(user_id, profile);
		}
		//****  만약인증사용자 추가 정보가 들어오면 실행되는 구문
		if(!params.get("store_name").equals("")) {
			
			
			int biz_num = Integer.parseInt((params.get("biz_num")));
			String biz = params.get("biz");
			String store_name =  params.get("store_name");
			String state = "인증대기";
			logger.info(user_id+biz_num+biz+store_name+state);
			int bizregistrow = dao.bizregist(user_id,biz_num,biz,store_name,state);
			logger.info("이거 안들어가나??"+user_id);
			logger.info("bizregistrow변경되면 이거 나옴!!: "+bizregistrow);
			
		}
		if(!bizprofile.getOriginalFilename().equals("")) {
			logger.info("bizprofile파일 업로드 작업");
			bizfileSave(user_id, bizprofile);
		}
		return page;
	}

	public HashMap<String, Object> join(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", dao.join(params));
		return map;
	}

	public int login(String id, String pw) {
		return dao.login(id,pw);
	}

	

	public HashMap<String, Object> delete(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = delList.size();
		//몇 개 인건지!!
		int successCnt = 0;
		for (String id : delList) {
			successCnt += dao.delete(id);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}

	public HashMap<String, Object> detail(String id) {		
		return dao.detail(id);
	}

	private void fileSave(String user_id, MultipartFile file) {
		String oriFileName = file.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		logger.info(oriFileName+" => " + newFileName);
		try {
			byte[] bytes= file.getBytes();
			Path path = Paths.get("D:/SPRING/gnb/src/main/webapp/resources/photo/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"save OK");
			String cate_no = "p001";
			dao.fileWrite(oriFileName,newFileName,user_id,cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
	}
	private void bizfileSave(String user_id, MultipartFile bizprofile) {
		String oriFileName = bizprofile.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		logger.info(oriFileName+" => " + newFileName);
		try {
			byte[] bytes= bizprofile.getBytes();
			Path path = Paths.get("D:/SPRING/gnb/src/main/webapp/resources/photo/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"bizsave OK");
			String cate_no = "p002";
			dao.bizfileWrite(oriFileName,newFileName,user_id,cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
	}

	
	



	
	
}
