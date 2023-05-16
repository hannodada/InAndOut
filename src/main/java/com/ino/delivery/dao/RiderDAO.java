package com.ino.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.delivery.dto.RiderDTO;

public interface RiderDAO {

	ArrayList<RiderDTO> listRO();

	RiderDTO dtoROD(String delivery_offer_no);

	// ArrayList<RiderDTO> listDH();

	// ArrayList<RiderDTO> listDS();

	RiderDTO dtoUO(String rider_id);

	// ArrayList<RiderDTO> listRL();

	//int uoWrite(RiderDTO dto);

	RiderDTO dtoUOS(String msg_div_no);

	int deliveryUpdate(String idx);

	int deliveryInsert(String idx);

	int deliveryNone(String idx);

	//ArrayList<RiderDTO> selectBySC(String delivery_state, String delivery_offer_no);

	HashMap<String, Object> select(RiderDTO dto);

	int writeUO(RiderDTO dto);

	int totalCountRL();

	ArrayList<RiderDTO> listRL(int cnt, int offset);

	ArrayList<RiderDTO> listRO(int cnt, int offset);

	int totalCountRO();

	int totalCountDS();

	ArrayList<RiderDTO> listDS(int cnt, int offset);

	int totalCountDH();

	ArrayList<RiderDTO> listDH(int cnt, int offset);

	HashMap<String, Object> filtering(RiderDTO dto);


}
