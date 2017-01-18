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
import org.springframework.transaction.annotation.Propagation;
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
		
	public List loadCOAList() {
		return accountsDao.fetchCOAList();
	}
	
	/**************************** Business function ***************************************/
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Map<String, Object> saveLedgerGroup(ModelMap model, LedgerGroup lg)throws RuntimeException {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			accountsDao.saveLedgerGroup(lg);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
			e.printStackTrace();
		}
		return map;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Map<String, Object> deleteLedgerGroup(ModelMap model, String id) throws RuntimeException {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			accountsDao.deleteLedgerGroup(Integer.parseInt(id));
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "delete error");
			e.printStackTrace();
		}
		return map;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Map<String, Object> saveCOA(ModelMap model, ChartOfAccounts coa) throws RuntimeException {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			if (coa.getId() == 0) {
				accountsDao.saveCOA(coa);
			} else if (coa.getId() > 0){
				accountsDao.updateCOA(coa);
			}
		}  catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
			e.printStackTrace();
		}
		return map;
	}
}
