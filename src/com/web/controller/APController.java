package com.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.domain.AccountPayable;
import com.web.service.APService;
import com.web.service.AccountsService;

@Controller
public class APController extends BaseController{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger log = Logger.getLogger(APController.class);
	
	@Autowired
	private AccountsService accountsSvc;
	@Autowired
	private APService apSvc;
	
	//封装jsonView 格式{status:y, errorMsg:''}
	private Map<String, Object> map = new HashMap<>();
	
	@ResponseBody
	@RequestMapping(value="apListService.htm")
	public Object apListService(ModelMap model, HttpServletResponse res){
		return com.web.views.JsonView.Render(apSvc.gotApList(model), res);
	}
	
	@ResponseBody
	@RequestMapping(value="saveAP.htm")
	public Object saveAP(ModelMap model, HttpServletResponse res, @RequestBody AccountPayable ap){
		map.put("status", "y");
		log.debug("come here what is it===ap=" + ap);
		apSvc.saveAP(model, ap);
		return com.web.views.JsonView.Render(map, res);
	}

	
}
