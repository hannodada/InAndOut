package com.ino.admin.dao;

import java.util.ArrayList;


import com.ino.admin.dto.AdminSalesDTO;

public interface AdminSalesDAO {

	int stotalCount();

	ArrayList<AdminSalesDTO> slist(int offset);

}
