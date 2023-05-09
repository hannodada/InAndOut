package com.ino.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.chat.dao.ChatDAO;
import com.ino.chat.dto.ChatDTO;
import com.ino.chat.dto.MsgDTO;
import com.ino.sales.dto.SalesDTO;

@Service
public class ChatService {
	
	@Autowired ChatDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ArrayList<ChatDTO> list(String loginId) {
		
		return dao.list(loginId);
	}

	public ArrayList<MsgDTO> msglist(int id) {
		// TODO Auto-generated method stub
		return dao.msglist(id);
	}

	public ArrayList<String> userlist(int roomid) {
		// TODO Auto-generated method stub
		return dao.userlist(roomid);
	}

	public void msgsend(HashMap<String, Object> params) {
		logger.info("service msgsend: " + params);
		dao.msgsend(params);
	}

	public void recentmsg(HashMap<String, Object> params) {
		dao.recentmsg(params);
	}
	
	public void recentmsgno(HashMap<String, Object> params) {
		dao.recentmsgno(params);
	}
	
	public void recentmsgtime(HashMap<String, Object> params) {
		dao.recentmsgtime(params);
	}

	public void newroom(String loginId, String username) {
		// TODO Auto-generated method stub
		logger.info("newchat service");
		dao.newchat(loginId+username);
		int roomid = dao.lastroom();
		dao.roomjoin(roomid,loginId);
		dao.roomjoin(roomid,username);
	}

	public String salephoto(String msg_div_no) {
		// TODO Auto-generated method stub
		return dao.salephoto(msg_div_no);
	}

	public String userphoto(String roomusername) {
		// TODO Auto-generated method stub
		return dao.userphoto(roomusername);
	}

	public String issale(int id) {
		// TODO Auto-generated method stub
		return dao.issale(id);
	}

	public int salenum(int id) {
		// TODO Auto-generated method stub
		return dao.salenum(id);
	}

	public SalesDTO msgsale(int salenum) {
		// TODO Auto-generated method stub
		return dao.msgsale(salenum);
	}

	public String msguser(int id, String loginId) {
		// TODO Auto-generated method stub
		return dao.msguser(id, loginId);
	}

	public String username(String msguser) {
		// TODO Auto-generated method stub
		return dao.username(msguser);
	}

	public void chatsaledone(String modalsaleid) {
		dao.chatsaledone(modalsaleid);
		
	}

}
