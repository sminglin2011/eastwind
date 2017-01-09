package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.StockItem;
import com.web.service.StockService;

@Controller
public class StockController {
	
	Logger log = Logger.getLogger(StockController.class);
	
	@Autowired
	private StockService stockService;

	@RequestMapping(value="/stockMain.htm")
	public ModelAndView stockMain() {
		log.debug("stockMain");
		List categoryList = stockService.loadCategoryList();
		List list = stockService.loadStockList();
		log.debug("list = " + list);
		Map model = new HashMap();
		model.put("categoryList", categoryList);
		model.put("list", list);
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
}
