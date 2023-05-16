package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.AdminReportDTO;

public interface AdminReportDAO {

	ArrayList<AdminReportDTO> ureportlist();

	AdminReportDTO ureportdetail(String report_no);

	int utotalCount();

	ArrayList<AdminReportDTO> ulist(int offset);

	int stotalCount();

	ArrayList<AdminReportDTO> slist(int offset);

	AdminReportDTO sreportdetail(String report_no);

	AdminReportDTO greportdetail(String report_no);

	int sblind_history(String report_no,HashMap<String, String> params, String report_id);

	void blindchange(String report_no);

	void blindnochange(String report_no);

	ArrayList<AdminReportDTO> glist(int offset);

	int gtotalCount();


}
