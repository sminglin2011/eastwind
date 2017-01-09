package com.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.SalesOrderService;
import com.web.service.UserService;

@Controller
public class SalesOrderController {
	
	Logger log = Logger.getLogger(SalesOrderController.class);
	
	@Autowired
	private SalesOrderService salesOrderService;

	@RequestMapping(value="/order_main.htm")
	public ModelAndView order_main() {
		log.debug("order_main");
		List list = salesOrderService.fetchSOList();
		log.debug("list = " + list);
		return new ModelAndView("so/order_main", "list", list);
	}
	
	
	@RequestMapping(value="/new_order.htm")
	public ModelAndView new_user() {
		
		return new ModelAndView("so/new_order", "list", "");
	}
}
