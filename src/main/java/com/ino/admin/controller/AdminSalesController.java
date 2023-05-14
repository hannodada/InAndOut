package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.admin.dto.AdminGalleryDTO;
import com.ino.admin.service.AdminGalleryService;
import com.ino.admin.service.AdminSalesListService;
import com.ino.sales.service.SalesService;

@Controller
public class AdminSalesController {
	
	@Autowired AdminSalesListService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/adsaleslist.do")
	public String adSaleslist(Model model) {
	
	    return "adSalesList";
	}

	   @RequestMapping(value="/adsales.ajax", method = RequestMethod.POST)
	    @ResponseBody
	    public HashMap<String, Object> list( @RequestParam HashMap<String, Object> params
	 		  		
	    		){
	    	logger.info("판매글 목록 리스트 요청");
	       return service.slist(params);
	    }		
	

	    @RequestMapping(value = "/ad.sblind", method = RequestMethod.GET)
	    public String postdelete(String no) throws Exception {
	    	service.sblind(no);
	       return "redirect:/adsaleslist.do";
	    }
	    //게시물 선택 블라인드
	    @RequestMapping(value = "/ad.sblind")
	    public String ajaxTest(HttpServletRequest request) throws Exception {

	        String[] ajaxMsg = request.getParameterValues("valueArr");
	        int size = ajaxMsg.length;
	       
	        for(int i=0; i<size; i++) {
	        	service.sblind(ajaxMsg[i]);
	        }
	        return "redirect:/adsaleslist.do";
	    }		
	
	
}
