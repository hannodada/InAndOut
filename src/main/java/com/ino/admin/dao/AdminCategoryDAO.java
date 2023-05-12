package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.AdminCategoryDTO;
import com.ino.admin.dto.AdminStarDTO;


public interface AdminCategoryDAO {


	int totalCount();

	ArrayList<AdminCategoryDTO> list(int offset);

	AdminCategoryDTO goodsdetail(String goods_id);

	int goodsupdate(HashMap<String, String> params);



}
