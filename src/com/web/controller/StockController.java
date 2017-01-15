package com.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.StockItem;
import com.web.domain.StockItemSupplier;
import com.web.service.StockService;
import com.web.service.SupplierService;

@Controller
public class StockController {
	
	Logger log = Logger.getLogger(StockController.class);
	
	@Autowired
	private StockService stockService;
	@Autowired
	private SupplierService suppliceSvc;
	
	//封装jsonView 格式{status:y, errorMsg:''}
	private Map<String, Object> map = new HashMap<>();

	
	@RequestMapping(value="/stockMain.htm")
	public ModelAndView stockMain(ModelMap model) {
		log.debug("stockMain");
		model = stockService.goToStockMain(model);
		return new ModelAndView("stock/stock_main", "model", model);
	}
	
	@RequestMapping(value="stockFilterKeyword.htm")
	public ModelAndView filterKeyword(String keyword) {
		List list = stockService.filterByKeyword(keyword);
		Map model = new HashMap<>();
		model.put("list", list);
		model.put("keyword", keyword);
		return new ModelAndView("stock/stock_main", "model", model);
	}
	
	
	@RequestMapping(value="/newStock.htm")
	public ModelAndView newStock() {
		Map model = new HashMap();
		//fetchCategory for new stock page
		List categoryList = stockService.loadCategoryList();
		model.put("categoryList", categoryList);
		
		log.debug("categoryList="+categoryList);
		return new ModelAndView("stock/new_stock", "model", model);
	}
	
	@ResponseBody
	@RequestMapping(value="/saveNewStock.htm")
	public String saveNewStock(StockItem stock) {
		log.debug("controller save stock = " + stock);
		if (stock.getId() == 0) {
			stockService.saveStock(stock);
		} else {
			stockService.updateStock(stock);
		}
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteStock.htm")
	public String deleteStock(String id) {
		log.debug("controller delete stockId = " + id);
		if (id != null) {
			stockService.deleteStock(Integer.parseInt(id));
		} else {
			log.error("Delete Stock id is null");
		}
		return "";
	}
	
	@RequestMapping(value="/editStock.htm")
	public ModelAndView editStock(String id) {
		Map model = new HashMap<>();
		StockItem stock = null;
		if(id != null) {
			stock = stockService.loadStock(Integer.parseInt(id));
		} else {
			log.error("edit stock id is null");
		}
		model.put("stock", stock);
		//fetchCategory for new stock page
		List categoryList = stockService.loadCategoryList();
		model.put("categoryList", categoryList);
		return new ModelAndView("stock/edit_stock","model",model);
	}
	
	/***************************************** Stock Item Supplier **********************************************/
	@RequestMapping(value="/stockItemSupplier.htm")
	public ModelAndView stockItemSupplier(ModelMap model, String stockId) throws Exception {
		log.debug("go in to item supplier listing");
		StockItem stockItem = stockService.loadStock(Integer.parseInt(stockId));
		List stockItemSupplierList = stockService.loadStockItemSupplieryListByStockId(stockId);
		List supplierList = suppliceSvc.loadSupplierList();
		log.debug("???? supplier List = " + supplierList);
		model.put("stockItem", stockItem);
		model.put("stockItemSupplierList", stockItemSupplierList);
		model.put("supplierList", supplierList);
		return new ModelAndView("stock/stock_item_supplier");
	}
	@RequestMapping(value="/addStockItemSupplier.htm")
	public Object addStockItemSupplier(ModelMap model, @RequestBody StockItemSupplier stockItemSupplier
			, HttpServletResponse res) {
		log.debug("StockItemSupplier=" + stockItemSupplier);
		map = stockService.addStockItemSupplier(stockItemSupplier);
		return com.web.views.JsonView.Render(map, res);
	}
	@RequestMapping(value="/defaultSupplier.htm")
	public Object defaultSupplier(ModelMap model, @RequestParam(value="id") int id
			, HttpServletResponse res) {
		log.debug("id=" + id);
		map = stockService.defaultStockItemSupplier(id);
		return com.web.views.JsonView.Render(map, res);
	}
	@RequestMapping(value="/removeSupplier.htm")
	public Object removeSupplier(ModelMap model, @RequestParam(value="id") int id
			, HttpServletResponse res) {
		log.debug("id=" + id);
		map = stockService.removeSupplierFromStockItem(id);
		return com.web.views.JsonView.Render(map, res);
	}
	/***************************************** Stock Item Supplier end *******************************************/
}
