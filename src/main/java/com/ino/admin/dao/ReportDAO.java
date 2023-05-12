package com.ino.admin.dao;

import java.util.ArrayList;

import com.ino.admin.dto.ReportDTO;

public interface ReportDAO {

	ArrayList<ReportDTO> ureportlist();

	ReportDTO ureportdetail(String report_no);

	int utotalCount();

	ArrayList<ReportDTO> ulist(int offset);

	int stotalCount();

	ArrayList<ReportDTO> slist(int offset);

}
