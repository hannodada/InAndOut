package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.admin.dto.MemberDTO;
import com.ino.admin.dto.ReportDTO;
import com.ino.admin.service.MemberListService;
import com.ino.admin.service.ReportService;


@Controller
public class ReportController {
	
	@Autowired ReportService service;
	
	Logger logger  = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/userreportlist.do")
    public String ureportlist (Model model) {
    	logger.info("회원신고리스트요청");

        return "adUserReportList";
  }
    
    @RequestMapping(value="/ureport.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> userlist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("리스트 불러오세요");
       return service.userlist(params);
    }	    
    
    
    @RequestMapping(value="/salesreportlist.do")
    public String sreportlist (Model model) {
    	logger.info("회원신고리스트요청");

        return "adSalesReportList";
  }
    
    @RequestMapping(value="/sreport.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> saleslist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("리스트 불러오세요");
       return service.saleslist(params);
    }	       
    
    
    
    
    
	@RequestMapping(value="/detail.sreport.do")
	public String ureportdetail(Model model, @RequestParam String report_no) {
		/* 로그인 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("상세보기 요청"+report_no);
		ReportDTO dto = service.ureportdetail(report_no);
		logger.info("dto : ",dto);
		model.addAttribute("dto", dto);

		
		return "adUserReportDetail";
	}     

    
    
    
    @RequestMapping(value="/galleryreportlist.do")
    public String greportlist (Model model) {
    	logger.info("갤러리신고리스트요청");


        return "adGalleryReportList";
  }  
       
    
    
    
    
    
    
}
    

