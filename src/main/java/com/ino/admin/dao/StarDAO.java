package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.CategoryDTO;
import com.ino.admin.dto.MemberDTO;
import com.ino.admin.dto.StarDTO;


public interface StarDAO {

	ArrayList<CategoryDTO> categorylist();

	ArrayList<StarDTO> starlist();

	int totalCount();

	ArrayList<StarDTO> list(int offset);

	int starwrite(HashMap<String, String> params);

	int staroverlay(String cate_no);

	int starupdate(HashMap<String, String> map);

	StarDTO stardetail(String cate_no);




}
