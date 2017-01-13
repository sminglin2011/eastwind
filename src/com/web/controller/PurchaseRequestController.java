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
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.PurchaseRequest;
import com.web.domain.StockItem;
import com.web.service.PurchaseRequestService;
import com.web.service.StockService;

@Controller
public class PurchaseRequestController extends BaseController{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger log = Logger.getLogger(PurchaseRequestController.class);

	@Autowired
	private PurchaseRequestService prSvc;
	
	//封装jsonView 格式{status:y, errorMsg:''}
	private Map<String, Object> map = new HashMap<>();
   
	@RequestMapping(value="/purchaseRequestMain.htm")
	public ModelAndView purchaseRequestMain(ModelMap model) {
		prSvc.loadPurchaseRequestList(model);
		return new ModelAndView("purchase/purchase_request_main");
	}
	
	@RequestMapping(value="/purchaseRequest.htm")
	public ModelAndView purchaseRequest(ModelMap model, String stockId) throws Exception{
		log.debug("coming purchase request");
		model = prSvc.goToPurchaseRequestPage(model, stockId);
		return new ModelAndView("purchase/purchase_request");
	}
	
	@RequestMapping(value="/savePurchaseRequest.htm")
	public Object savePurchaseRequest(ModelMap model, HttpServletResponse res
			, @RequestBody PurchaseRequest pr) {
		log.debug("save purchase request------------" + pr);
		map = prSvc.savePurchaseRequest(pr);
		return com.web.views.JsonView.Render(map, res);
	}
	@RequestMapping(value="/rejectPurchaseRequest.htm")
	public Object rejectPurchaseRequest (ModelMap model, HttpServletResponse res
			, String param) {
		log.debug("come in here controller rejectPurchaseRequest");
		map = prSvc.rejectPurchaseRequest(param);
		return com.web.views.JsonView.Render(map, res);
	}
	
}
