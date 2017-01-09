package com.web.controller;

import java.nio.channels.FileChannel.MapMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonView;
import com.web.domain.Customer;
import com.web.domain.CustomerBillContact;
import com.web.exception.ParameterException;
import com.web.service.CustomerService;

@Controller
public class CustomerController { //extends BaseController
	
	Logger log = Logger.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;
	
	/************************************* customer *********************************************/
	
	@RequestMapping(value="/customerMain.htm")
	public ModelAndView customerMain(ModelMap model) {
		List customerList = customerService.loadCustomerList();
		model.put("list", customerList);
		return new ModelAndView("customer/customer_main");
	}
	@RequestMapping(value="customerFilterKeyword.htm")
	public ModelAndView filterKeyword(ModelMap model, String keyword) {
		List list = customerService.filterByKeyword(keyword);
		model.put("list", list);
		model.put("keyword", keyword);
		return new ModelAndView("customer/customer_main");
	}
	
	@RequestMapping(value="/newCustomer.htm")
	public ModelAndView newCustomer() {
		return new ModelAndView("customer/new_customer");
	}
	/******
	 * new customer page, checking duplicate customer name
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkDuplicateName.htm")
	public String checkDuplicateName(HttpServletRequest req) {
		log.debug("checkDuplicateName.........." + req.getParameter("param"));
//		req.getParameter("param") è¿™ä¸ªå�‚æ•°å�¯ä»¥å¾—åˆ°ä»Žé¡µé�¢ä¼ æ�¥çš„å�‚æ•°
		String customerName = req.getParameter("param");
		try {
			boolean exist = customerService.checkDuplicateCustomerName(customerName);
			if (exist) {
				return "Customer Name Exist";
			} 
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		// return "y" if correct return y
		return "y";
	}
	
	/***
	 * save customer from new customer page
	 * @param customer
	 * @return
	 */
	@RequestMapping(value="/saveCustomer.htm")
	public Object saveCustomer(Customer customer, HttpServletResponse res) {
		log.debug("save customer = " + customer);
		Map<String, Object> map = new HashMap<>();
	    map.put("status", "y");
		try {
			/**
			 * after save customer and contact info, return customer
			 **/
			customer = customerService.saveCustomer(customer);
			/*** auto save customerBillConatact and customerDeliveryContact, but link to customer Id is 0,
			 * so need updated to new customer Id
			 *   ****/
			customerService.updateCustomerBillContact(customer.getBillContact());
			customerService.updateCustomerDeliveryContact(customer.getDeliveryContact());
		} catch (Exception e) {
			map.put("status", "n");
			log.error(e.getMessage());
			e.printStackTrace();
		}
		return com.web.views.JsonView.Render(map, res);
	}
	
	/************************************* customer *********************************************/
	
	@RequestMapping(value="/customerContactMaster.htm")
	public ModelAndView customerContactMaster(ModelMap model, String customerId) {
		log.debug("customerContactMaster come " + customerId);
		int custId = 0;
		try {
			custId = Integer.parseInt(customerId);
		} catch (ParameterException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		
		List billContactList = customerService.loadCustomerBillContactList(custId);
		List deliveryContactList = customerService.loadCustomerDeliveryContactList(custId);
		Customer customer = customerService.loadCustomer(customerId);
		model.put("billContactList", billContactList);
		model.put("deliveryContactList", deliveryContactList);
		model.put("customer", customer);
		log.debug(billContactList);
		log.debug(deliveryContactList);
		log.debug(customer);
		
		return new ModelAndView("customer/contact_main");
	}
	
	
	@RequestMapping(value="/newCustomerDeliveryContact.htm")
	public ModelAndView newCustomerDeliveryContact(ModelMap model, String customerId) {
		log.debug("??????????");
		Customer customer = customerService.loadCustomer(customerId);
		model.put("customer", customer);
		return new ModelAndView("customer/new_customerDeliveryContact");
	}
	
	
	
	/************************************* customer bill contact *********************************************/
	@RequestMapping(value="/newCustomerBillContact.htm")
	public ModelAndView newCustomerBillContact(ModelMap model, String customerId) {
		log.debug("new Customer Bill contact customer id = " + customerId);
		CustomerBillContact billContact = new CustomerBillContact();
		Customer customer = customerService.loadCustomer(customerId);
		model.addAttribute("customer", customer);
		model.addAttribute("billContact", billContact);
		return new ModelAndView("customer/new_customerBillContact");
	}
	
	@RequestMapping(value="/editCustomerBillContact.htm")
	public ModelAndView editCustomerBillContact(ModelMap model, String id) {
		log.debug("edit Customer Bill contact id = " + id);
		CustomerBillContact billContact = new CustomerBillContact();
		billContact = customerService.loadCustomerBillContact(Integer.parseInt(id));
		Customer customer = customerService.loadCustomer(billContact.getCustomerId());
		model.addAttribute("customer", customer);
		model.addAttribute("billContact", billContact);
		return new ModelAndView("customer/new_customerBillContact");
	}
	
	@RequestMapping(value="/saveCustomerBillContact.htm")
	public Object saveCustomerBillContact(ModelMap model, CustomerBillContact billContact, HttpServletResponse res) {
		log.debug("model  =" + model);
		log.debug(" <save bill contact + ????" + billContact);
		Map<String, Object> map = new HashMap<>();
		    map.put("status", "y");
		try {
			customerService.saveCustomerBillContact(billContact);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		final HttpHeaders httpHeaders= new HttpHeaders();
//	    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
//	    return new ResponseEntity<String>("{status: y}", httpHeaders, HttpStatus.OK);
	   
	    return com.web.views.JsonView.Render(map, res);
	}
	/************************************* customer bill contact *********************************************/
	
	
}
