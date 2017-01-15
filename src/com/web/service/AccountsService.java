package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.AccountsDao;
import com.web.controller.GoodsReceivedController;
import com.web.domain.ChartOfAccounts;

@Service
public class AccountsService {
	
	Logger log = Logger.getLogger(AccountsService.class);

	@Autowired
	private AccountsDao accountsDao;
	
	private Map<String, Object> map = new HashMap<>();
	
	public List loadGeneralLedgerList() {
		return accountsDao.fetchGeneralLedgerList();
	}
	
	public List loadLedgerGroupList() {
		return accountsDao.fetchLedgerGroupList();
	}
	
	public List loadCOAList() {
		return accountsDao.fetchCOAList();
	}
	@Transactional
	public void saveCOA(ChartOfAccounts coa) {
		accountsDao.saveCOA(coa);
	}
	@Transactional
	public void batchSaveCOA(List<ChartOfAccounts> coaList) {
		accountsDao.batchSaveCOA(coaList);
	}
	@Transactional
	public void deleteCOA(int id) {
		accountsDao.deleteCOA(id);
	}
	
	/**************************** Business function ***************************************/
}
