package com.ino.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.chat.dto.ChatDTO;
import com.ino.chat.dto.MsgDTO;
import com.ino.sales.dto.SalesDTO;

public interface ChatDAO {
	ArrayList<ChatDTO> list(String loginId);

	ArrayList<MsgDTO> msglist(int id);

	void msgsend(HashMap<String, String> params);

	ArrayList<String> userlist(int roomid);

	void recentmsg(HashMap<String, String> params);

	void recentmsgno(HashMap<String, String> params);

	void recentmsgtime(HashMap<String, String> params);

	void newchat(String saleno, String username);

	int lastroom();

	void roomjoin(int roomid, String loginId);

	String salephoto(String msg_div_no);

	String userphoto(String roomusername);

	String issale(int id);

	int salenum(int id);

	SalesDTO msgsale(int salenum);

	String msguser(int id, String loginId);

	String username(String msguser);

	void chatsaledone(String modalsaleid);

	String findroomuser(String user_id, String sales_no);

	void chatmsgsend(MsgDTO dto);
}
