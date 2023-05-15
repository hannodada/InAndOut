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

import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminReportDTO;
import com.ino.admin.service.AdminMemberListService;
import com.ino.admin.service.AdminReportService;


@Controller
public class AdminReportController {
	
	@Autowired AdminReportService service;
	
	Logger logger  = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/userreportlist.do")
    public String ureportlist (Model model) {
    	logger.info("ȸ���Ű���Ʈ��û");

        return "adUserReportList";
  }
    
    @RequestMapping(value="/ureport.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> userlist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("����Ʈ �ҷ�������");
       return service.userlist(params);
    }	    
    
    
    @RequestMapping(value="/salesreportlist.do")
    public String sreportlist (Model model) {
    	logger.info("ȸ���Ű���Ʈ��û");

        return "adSalesReportList";
  }
    
    @RequestMapping(value="/sreport.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> saleslist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("����Ʈ �ҷ�������");
       return service.saleslist(params);
    }	       
    
    
    
    
    
	@RequestMapping(value="/detail.sreport.do")
	public String ureportdetail(Model model, @RequestParam String report_no) {
		/* �α��� 
		String page ="redirect:/ad.userlist.do";
		*/
		
		logger.info("�󼼺��� ��û"+report_no);
		AdminReportDTO dto = service.ureportdetail(report_no);
		logger.info("dto : ",dto);
		model.addAttribute("dto", dto);

		
		return "adUserReportDetail";
	}     

    
    
    
    @RequestMapping(value="/galleryreportlist.do")
    public String greportlist (Model model) {
    	logger.info("�������Ű���Ʈ��û");


        return "adGalleryReportList";
  }  
       
    
    
    
    
    
    
}
    

