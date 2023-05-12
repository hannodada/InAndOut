package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.CategoryDTO;
import com.ino.admin.dto.StarDTO;


public interface CategoryDAO {


	int totalCount();

	ArrayList<CategoryDTO> list(int offset);

	CategoryDTO goodsdetail(String goods_id);

	int goodsupdate(HashMap<String, String> params);



}
