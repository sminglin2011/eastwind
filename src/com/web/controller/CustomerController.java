package com.web.controller;

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
	
	@RequestMapping(value="/customerMain.htm")
	public ModelAndView customerMain() {
		Map model = new HashMap<>();
		List customerList = customerService.loadCustomerList();
		model.put("list", customerList);
		return new ModelAndView("customer/customer_main","model",model);
	}
	
	@RequestMapping(value="/customerDetails.htm")
	public ModelAndView customerDetails() {
		return new ModelAndView("customer/customer_details");
	}
	
	@ResponseBody
	@RequestMapping(value="/saveCustomer.htm")
	public String saveCustomer(Customer customer) {
		log.debug("save customer = " + customer);
		try {
			customer = customerService.saveCustomer(customer);
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		
		customerService.updateCustomerBillContact(customer.getBillContact());
		customerService.updateCustomerDeliveryContact(customer.getDeliveryContact());
		return "{'info':'save info', 'status':'y'}";
	}
	
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
	
	@RequestMapping(value="/customerContactMaster.htm")
	public ModelAndView customerContactMaster(String customerId) {
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
		Map model = new HashMap<>();
		model.put("billContactList", billContactList);
		model.put("deliveryContactList", deliveryContactList);
		model.put("customer", customer);
		log.debug(billContactList);
		log.debug(deliveryContactList);
		log.debug(customer);
		
		return new ModelAndView("customer/contact_main","model", model);
	}
	
	@RequestMapping(value="/newCustomerBillContact.htm")
	public ModelAndView newCustomerBillContact(String customerId) {
		log.debug("new Customer Bill contact customer id = " + customerId);
		Map model = new HashMap<>();
		Customer customer = customerService.loadCustomer(customerId);
		model.put("customer", customer);
		model.put("billContact", new CustomerBillContact());
		return new ModelAndView("customer/new_customerBillContact", "model", model);
	}
	@RequestMapping(value="/newCustomerDeliveryContact.htm")
	public ModelAndView newCustomerDeliveryContact(String customerId) {
		log.debug("??????????");
		Map model = new HashMap<>();
		Customer customer = customerService.loadCustomer(customerId);
		model.put("customer", customer);
		return new ModelAndView("customer/new_customerDeliveryContact", "model", model);
	}
	
	@RequestMapping(value="/saveCustomerBillContact.htm")
	public Object saveCustomerBillContact(ModelMap model, CustomerBillContact billContact, HttpServletResponse res) {
		log.debug("model  =" + model);
		log.debug(" <save bill contact + ????" + billContact);
		
		try {
			//customerService.saveCustomerBillContact(billContact);
		} catch (Exception e) {
			e.printStackTrace();
		}
		final HttpHeaders httpHeaders= new HttpHeaders();
	    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
//	    return new ResponseEntity<String>("{status: y}", httpHeaders, HttpStatus.OK);
	    Map<String, Object> map = new HashMap<>();
	    map.put("status", "y");
	    return com.web.views.JsonView.Render(map, res);
	}
}
