package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.MemberDTO;



public interface MemberListDAO {

	ArrayList<MemberDTO> userlist();


	MemberDTO viewdetail(String user_id);


	ArrayList<MemberDTO> authuserlist();


	ArrayList<MemberDTO> riderlist();


	MemberDTO riderdetail(String user_id);


	int history_userstate(HashMap<String, String> params);


	Object writeUserHistory(String userState, String content);


	int uhistorywrite(HashMap<String, String> params);


	MemberDTO viewdetailextra(String user_id);


	MemberDTO riderdetailextra(String user_id);


	int history_riderstate(HashMap<String, String> params);


	void riderchange(String user_id);


	void userchange(String user_id);


	int history_riderstate2(HashMap<String, String> params);


	ArrayList<MemberDTO> userhistory(String user_id);


	MemberDTO uhistorydetail(String user_id, String user_state, String state_time);


	int totalCount();


	int totalCountUserdiv(HashMap<String, Object> params);


	int totalCountUserstate(HashMap<String, Object> params);


	int totalCountAll(HashMap<String, Object> params);


	int totalCountSearch(String search);


	ArrayList<MemberDTO> list(int offset);


	ArrayList<MemberDTO> listUserdiv(HashMap<String, Object> params);


	ArrayList<MemberDTO> listUserstate(HashMap<String, Object> params);


	ArrayList<MemberDTO> listAll(HashMap<String, Object> params);


	ArrayList<MemberDTO> listSearch(HashMap<String, Object> params);


	ArrayList<MemberDTO> riderlist(int offset);


	int rtotalCount();


	int atotalCount();


	ArrayList<MemberDTO> authuserlist(int offset);


	int updateUserState(HashMap<String, String> params);


	void userStatechange(String user_id, String radiovalue);












	



	
}