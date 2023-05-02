package com.ino.sales.dao;

import java.util.ArrayList;
import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;

public interface SalesDAO {

	ArrayList<BizDTO> getBizList();

	ArrayList<goodsDTO> getGoodsList();

	int salesWrite(SalesDTO dto);

	void fileWrite(String ori_photo_name, String new_photo_name, int idx, String cate_no);

	ArrayList<SalesDTO> salesList();

}
