package com.ino.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.delivery.dto.RiderDTO;

public interface RiderDAO {

	ArrayList<RiderDTO> listRO();

	RiderDTO dtoROD(String delivery_offer_no);

	ArrayList<RiderDTO> listDH();

	ArrayList<RiderDTO> listDS();

	RiderDTO dtoUO(String user_id);

	ArrayList<RiderDTO> listRL();

	//int uoWrite(RiderDTO dto);

	RiderDTO dtoUOS(String sales_no);

	int deliveryUpdate(String idx);

	int deliveryInsert(String idx);

	int deliveryNone(String idx);

	//ArrayList<RiderDTO> selectBySC(String delivery_state, String delivery_offer_no);

	HashMap<String, Object> select(RiderDTO dto);

	int writeUO(RiderDTO dto);


}
