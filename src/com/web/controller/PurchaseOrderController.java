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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.GoodsReceived;
import com.web.domain.ParamMap;
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
	public ModelAndView editPurchaseOrder(ModelMap model, String id) throws Exception {
		log.debug("edit purchase order id = " + id);
		model = poSvc.editPo(model, id);
		return new ModelAndView("purchase/edit_purchase_order");
	}
	
	@RequestMapping(value="/approvePurchaseOrder.htm")
	public Object approvePurchaseOrder(ModelMap model, HttpServletResponse res
			, @RequestParam(value="id")String id, @RequestParam(value="approve")String approve) throws Exception {
		log.debug("edit purchase order id = " + approve);
		map = poSvc.approvePo(model, id, approve);
		return com.web.views.JsonView.Render(map, res);
	}
	
	@RequestMapping(value="/savePurchase.htm")
	public Object savePurchase(ModelMap model, HttpServletResponse res
			, @RequestBody List<PurchaseOrderItems> poItemList) throws Exception {
		log.debug("come in here controller savePurchase" + poItemList);
		map = poSvc.saveEditPoItems(model, poItemList);
		return com.web.views.JsonView.Render(map, res);
	}
	
	@RequestMapping(value="/goToPoConvertToGR.htm")
	public ModelAndView goToPoConvertToGR(ModelMap model, HttpServletResponse res
			, String poNumber) throws Exception {
		log.debug("come in here controller goToPoConvertToGR" + poNumber);
		model = poSvc.goToPoConvertToGR(model, poNumber);
		log.debug("come in here controller goToPoConvertToGR" + model.get("poItems") );
		return new ModelAndView("purchase/goodsReceived");
	}
	
	@RequestMapping(value="/poConvertToGR.htm")
	public Object poConvertToGR(ModelMap model, HttpServletResponse res
			, @RequestBody List<GoodsReceived> list) throws Exception {
		log.debug("come in here controller poConvertToGR" + list);
		map = poSvc.poConvertToGR(model, list);
		return com.web.views.JsonView.Render(map, res);
	}
	
}
