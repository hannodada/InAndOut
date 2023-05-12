package com.ino.star.dao;

import java.util.ArrayList;

import com.ino.sales.dto.SalesDTO;
import com.ino.star.dto.CategoryDTO;

public interface StarDAO {

	ArrayList<SalesDTO> starPleaseList(String loginId);

	ArrayList<CategoryDTO> getStarList();

	SalesDTO salesDetail(int sales_no);

}
