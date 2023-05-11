package com.ino.mypage.DAO;

import java.util.ArrayList;

import com.ino.mypage.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO mypage(String id);

	Integer mystar(String starid);

	MypageDTO myrider(String riderid);

	ArrayList<MypageDTO> saleslist(String saleslist);

	ArrayList<MypageDTO> galleryList(String galleryList);
	
	

}
