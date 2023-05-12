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

import com.ino.admin.dto.CategoryDTO;
import com.ino.admin.dto.StarDTO;
import com.ino.admin.service.CategoryService;


@Controller
public class CategoryController {

	@Autowired CategoryService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/ad.goodslist.do")
	public String categorylist() {

        return "adGoodsList";
	} 	
	
    @RequestMapping(value="/category.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> list( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("리스트 불러오세요");
       return service.list(params);
    }	

    
	@RequestMapping(value="/goodsdetail.do")
	public String detail(Model model, @RequestParam String goods_id) {
		logger.info("detail : "+goods_id);
			
		CategoryDTO dto = service.goodsdetail(goods_id,"detail");
		

			model.addAttribute("detail", dto);
						
		return "adGoodsDetail";
   }    
    
	@RequestMapping(value = "/ad.goodsupdate.go")
	public String goodsupdateForm(Model model, @RequestParam String goods_id) {
		
		CategoryDTO dto = service.goodsdetail(goods_id,"update");
		model.addAttribute("dto", dto);
		
		return "adGoodsUpdate";
	}	   

	@RequestMapping(value="/ad.goodsupdate.do",method=RequestMethod.POST)
	public String goodsUpdate(@RequestParam HashMap<String, String> params ) {
	
	//if(session.getAttribute("loginId") !=null) {}
		logger.info("수정요청");
		logger.info("params: "+params);
		service.goodsupdate(params);
		
	return "redirect:/ad.goodslist.do";
}  	    
}
