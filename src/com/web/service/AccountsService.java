package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.AccountsDao;
import com.web.domain.ChartOfAccounts;

@Repository
public class AccountsService {

	@Autowired
	private AccountsDao accountsDao;
	
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
