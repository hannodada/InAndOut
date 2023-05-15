package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.AdminMemberDTO;



public interface AdminMemberListDAO {

	ArrayList<AdminMemberDTO> userlist();


	AdminMemberDTO viewdetail(String user_id);


	ArrayList<AdminMemberDTO> authuserlist();


	ArrayList<AdminMemberDTO> riderlist();


	AdminMemberDTO riderdetail(String user_id);


	int history_userstate(HashMap<String, String> params);


	Object writeUserHistory(String userState, String content);


	int uhistorywrite(HashMap<String, String> params);


	AdminMemberDTO viewdetailextra(String user_id);


	AdminMemberDTO riderdetailextra(String user_id);


	int history_riderstate(HashMap<String, String> params);


	void riderchange(String user_id);


	void userchange(String user_id);


	int history_riderstate2(HashMap<String, String> params);


	ArrayList<AdminMemberDTO> userhistory(String user_id);




	int totalCount();


	int totalCountUserdiv(HashMap<String, Object> params);


	int totalCountUserstate(HashMap<String, Object> params);


	int totalCountAll(HashMap<String, Object> params);


	int totalCountSearch(String search);


	ArrayList<AdminMemberDTO> list(int offset);


	ArrayList<AdminMemberDTO> listUserdiv(HashMap<String, Object> params);


	ArrayList<AdminMemberDTO> listUserstate(HashMap<String, Object> params);


	ArrayList<AdminMemberDTO> listAll(HashMap<String, Object> params);


	ArrayList<AdminMemberDTO> listSearch(HashMap<String, Object> params);


	ArrayList<AdminMemberDTO> riderlist(int offset);


	int rtotalCount();


	int atotalCount();


	ArrayList<AdminMemberDTO> authuserlist(int offset);


	int updateUserState(HashMap<String, String> params);


	void userStatechange(String user_id, String radiovalue);


	AdminMemberDTO uhistorydetail(String user_state);


	int totalCousntSearch(String search);












	



	
}