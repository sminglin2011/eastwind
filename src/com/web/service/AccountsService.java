package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DuplicatesPredicate;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.AccountsDao;
import com.web.controller.GoodsReceivedController;
import com.web.domain.ChartOfAccounts;
import com.web.domain.LedgerGroup;

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
	@Transactional
	public void saveLedgerGroup(LedgerGroup lg) {
		accountsDao.saveLedgerGroupList(lg);
	}
	@Transactional
	public void updateLedgerGroup(LedgerGroup lg) {
		accountsDao.updateLedgerGroupList(lg);
	}@Transactional
	public void deleteLedgerGroup(int id) {
		accountsDao.deleteLedgerGroup(id);;
	}
	
	
	public List loadCOAList() {
		return accountsDao.fetchCOAList();
	}
	@Transactional
	public void saveCOA(ChartOfAccounts coa) {
		accountsDao.saveCOA(coa);
	}
	@Transactional
	public void updateCOA(ChartOfAccounts coa) {
		accountsDao.updateCOA(coa);
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
	
	public Map<String, Object> saveLedgerGroup(ModelMap model, LedgerGroup lg) {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			saveLedgerGroup(lg);
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
		}
		return map;
	}
	public Map<String, Object> deleteLedgerGroup(ModelMap model, String id) {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			deleteLedgerGroup(Integer.parseInt(id));
		} catch (DuplicateKeyException dke) {
			map.put("status", "n");
			map.put("msg", "Ledger Group already exist");
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
		}
		return map;
	}
	
	public Map<String, Object> saveCOA(ModelMap model, ChartOfAccounts coa) {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			if (coa.getId() == 0) {
				saveCOA(coa);
			} else if (coa.getId() > 0){
				updateCOA(coa);
			}
			
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
			e.printStackTrace();
		}
		return map;
	}
}
