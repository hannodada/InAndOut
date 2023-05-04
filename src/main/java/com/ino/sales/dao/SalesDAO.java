package com.ino.sales.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;

public interface SalesDAO {

	String getUserSido(String loginId);

	String getUserSigungu(String loginId);

	ArrayList<SalesDTO> salesList(String sido, String sigungu);
	
	ArrayList<SalesDTO> filteringByHit();

	ArrayList<SalesDTO> filteringBySales_no();

	ArrayList<BizDTO> getBizList();
	
	int salesWrite(SalesDTO dto);

	void fileWrite(String ori_photo_name, String new_photo_name, int idx, String cate_no);

	ArrayList<goodsDTO> goodsCall(String biz_id);

	SalesDTO salesDetail(int sales_no);

	void upHit(int sales_no);

	ArrayList<String> salesDetailPhoto(int sales_no);



}
