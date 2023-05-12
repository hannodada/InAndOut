package com.ino.admin.dao;

import java.util.ArrayList;

import com.ino.admin.dto.AdminReportDTO;

public interface AdminReportDAO {

	ArrayList<AdminReportDTO> ureportlist();

	AdminReportDTO ureportdetail(String report_no);

	int utotalCount();

	ArrayList<AdminReportDTO> ulist(int offset);

	int stotalCount();

	ArrayList<AdminReportDTO> slist(int offset);

}
