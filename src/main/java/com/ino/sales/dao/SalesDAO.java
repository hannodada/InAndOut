package com.ino.sales.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;

public interface SalesDAO {

	ArrayList<BizDTO> getBizList();

	ArrayList<goodsDTO> goodsCall(String biz_id);

	int salesWrite(SalesDTO dto);

	void fileWrite(String ori_photo_name, String new_photo_name, int idx, String cate_no);

	ArrayList<SalesDTO> salesList();

	SalesDTO salesDetail(int sales_no);

	void upHit(int sales_no);

	ArrayList<String> salesDetailPhoto(int sales_no);

}
