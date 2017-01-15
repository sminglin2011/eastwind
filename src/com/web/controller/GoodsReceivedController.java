package com.web.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.AccountsService;
import com.web.service.GoodsReceivedService;

@Controller
public class GoodsReceivedController {
	
	Logger log = Logger.getLogger(GoodsReceivedController.class);

	@Autowired
	private GoodsReceivedService grSvc;
	
	@RequestMapping(value="goodsReceivedMain.htm")
	public ModelAndView goodsReceivedMain(ModelMap model) throws Exception{
		model.put("list", grSvc.loadGoodsReceivedList(model));
		return new ModelAndView("goodsReceived/goods_received_main");
	}
}
