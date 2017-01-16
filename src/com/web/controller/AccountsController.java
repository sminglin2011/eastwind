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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.ChartOfAccounts;
import com.web.domain.LedgerGroup;
import com.web.service.AccountsService;

@Controller
public class AccountsController {
	Logger log = Logger.getLogger(AccountsController.class);

	@Autowired
	private AccountsService accountsSvc;
	
	//封装jsonView 格式{status:y, errorMsg:''}
	private Map<String, Object> map = new HashMap<>();
	
	@RequestMapping(value="generalLedger.htm")
	public ModelAndView generalLedger(ModelMap model) throws Exception {
		model.put("list", accountsSvc.loadGeneralLedgerList());
		return new ModelAndView("accounts/general_ledger");
	}
	@RequestMapping(value="ledgerGroup.htm")
	public ModelAndView ledgerGroup(ModelMap model) throws Exception {
		model.put("list", accountsSvc.loadLedgerGroupList());
		model.put("glList", accountsSvc.loadGeneralLedgerList());
		return new ModelAndView("accounts/ledger_group");
	}
	
	@RequestMapping(value="saveLedgerGroup.htm")
	public Object saveLedgerGroup(ModelMap model, HttpServletResponse res, @RequestBody LedgerGroup ledgerGroup) throws Exception {
		map = accountsSvc.saveLedgerGroup(model, ledgerGroup);
		return com.web.views.JsonView.Render(map, res);
	}
	@RequestMapping(value="saveCOA.htm")
	public Object saveCOA(ModelMap model, HttpServletResponse res, @RequestBody ChartOfAccounts coa) throws Exception {
		log.debug("coa???==" + coa);
		map = accountsSvc.saveCOA(model, coa);
		return com.web.views.JsonView.Render(map, res);
	}
	@RequestMapping(value="deleteLedgerGroup.htm")
	public Object deleteLedgerGroup(ModelMap model, HttpServletResponse res, String param) throws Exception {
		map = accountsSvc.deleteLedgerGroup(model, param);
		log.debug("what is it ??????" + map);
		return com.web.views.JsonView.Render(map, res);
	}
	@RequestMapping(value="chartOfAccountsMain.htm")
	public ModelAndView chartOfAccountsMain(ModelMap model, HttpServletResponse res, String param) throws Exception {
		return new ModelAndView("accounts/chart_of_accounts");
	}
	@ResponseBody
	@RequestMapping(value="chartOfAccounts.htm")
	public Object chartOfAccounts(ModelMap model, HttpServletResponse res, String param) throws Exception {
		List list = accountsSvc.loadCOAList();
		log.debug("what is it ??????" + map);
		return com.web.views.JsonView.Render(list, res);
	}
	
	@ResponseBody
	@RequestMapping(value="generalLedgerService.htm")
	public Object generalLedgerService(ModelMap model, HttpServletResponse res, String param) throws Exception {
		List list = accountsSvc.loadGeneralLedgerList();
		log.debug("what is it ??????" + map);
		return com.web.views.JsonView.Render(list, res);
	}
	@ResponseBody
	@RequestMapping(value="ledgerGroupService.htm")
	public Object ledgerGroupService(ModelMap model, HttpServletResponse res, String param) throws Exception {
		List list = accountsSvc.loadLedgerGroupList();
		log.debug("what is it ??????" + map);
		return com.web.views.JsonView.Render(list, res);
	}
}
