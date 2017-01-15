package com.web.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.AccountsService;

@Controller
public class AccountsController {
	Logger log = Logger.getLogger(AccountsController.class);

	@Autowired
	private AccountsService accountsSvc;
	
	@RequestMapping(value="generalLedger.htm")
	public ModelAndView generalLedger(ModelMap model){
		model.put("list", accountsSvc.loadGeneralLedgerList());
		return new ModelAndView("accounts/general_ledger");
	}
}
