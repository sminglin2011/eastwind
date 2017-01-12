package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.Customer;
import com.web.domain.Supplier;
import com.web.service.SupplierService;

@Controller
public class SupplierController {
	
	Logger log = Logger.getLogger(SupplierController.class);

	@Autowired
	private SupplierService supplierService;

	@RequestMapping(value="/supplierMain.htm")
	public ModelAndView supplierMain(ModelMap model) {
		List list = supplierService.loadSupplierList();
		model.put("list", list);
		return new ModelAndView("supplier/supplier_main");
	}
	
	
	@RequestMapping(value="/supplierFilterKeyword.htm")
	public ModelAndView filterKeyword(ModelMap model, String keyword) {
		List list = supplierService.filterByKeyword(keyword);
		model.put("list", list);
		model.put("keyword", keyword);
		return new ModelAndView("supplier/supplier_main");
	}
	
	@RequestMapping(value="/newSupplier.htm")
	public ModelAndView newSupplier() {
		return new ModelAndView("supplier/new_supplier");
	}
	/******
	 * new supplier page, checking duplicate supplier name
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkDuplicateSupplierName.htm")
	public String checkDuplicateName(HttpServletRequest req) {
		log.debug("checkDuplicateName.........." + req.getParameter("param"));
		String supplierName = req.getParameter("param");
		try {
			boolean exist = supplierService.checkDuplicateSupplierName(supplierName);
			if (exist) {
				return "Customer Name Exist";
			} 
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		return "y";
	}
	@RequestMapping(value="/editSupplier.htm")
	public ModelAndView editSupplier(ModelMap model, String id) {
		log.debug("supplier id = " + id);
		Supplier supplier = supplierService.loadSupplier(id);
		model.put("supplier", supplier);
		return new ModelAndView("supplier/new_supplier");
	}
	@RequestMapping(value="/saveSupplier.htm")
	public Object saveSupplier(@RequestBody Supplier supplier, HttpServletResponse res) {
		log.debug("save supplier = " + supplier);
		Map<String, Object> map = new HashMap<>();
	    map.put("status", "y");
		try {
			supplierService.saveSupplier(supplier);
		} catch (Exception e) {
			map.put("status", "n");
			log.error(e.getMessage());
			e.printStackTrace();
		}
		return com.web.views.JsonView.Render(map, res);
	}
	@ResponseBody
	@RequestMapping(value="deleteSupplier.htm")
	public String deleteSupplier(ModelMap model, String id) {
		log.debug("be deleted customer id = " + id);
		try {
			supplierService.deleteSupplier(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "e";
		}
		return "y";
	}
}
