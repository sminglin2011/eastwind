package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.PurchaseOrderItems;
import com.web.domain.PurchaseRequest;
import com.web.domain.StockItem;
import com.web.service.PurchaseOrderService;
import com.web.service.PurchaseRequestService;
import com.web.service.StockService;

@Controller
public class PurchaseOrderController extends BaseController{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger log = Logger.getLogger(PurchaseOrderController.class);

	@Autowired
	private PurchaseOrderService poSvc;
	
	//封装jsonView 格式{status:y, errorMsg:''}
	private Map<String, Object> map = new HashMap<>();
	
   
	@RequestMapping(value="/purchaseOrderMain.htm")
	public ModelAndView purchaseOrderMain(ModelMap model) throws Exception {
		model = poSvc.goToPurchaseOrderMain(model);
		return new ModelAndView("purchase/purchase_order_main");
	}
	
	@RequestMapping(value="/newPurchaseOrder.htm")
	public ModelAndView newPurhaseOrder(ModelMap model) throws Exception {
		
		return new ModelAndView("purchase/new_purchase_order");
	}
	
	@RequestMapping(value="/editPurchaseOrder.htm")
	public ModelAndView editPurchaseOrder(ModelMap model) throws Exception {
		
		return new ModelAndView("purchase/edit_purchase_order");
	}
	
	
	
}
