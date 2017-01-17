package com.web.service;

import java.util.ArrayList;
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

import com.web.Dao.AccountPayableDao;
import com.web.Dao.AccountsDao;
import com.web.controller.GoodsReceivedController;
import com.web.domain.AccountPayable;
import com.web.domain.AccountPayableItem;
import com.web.domain.ChartOfAccounts;
import com.web.domain.LedgerGroup;

@Service
public class APService {
	
	Logger log = Logger.getLogger(APService.class);

	@Autowired
	private AccountsDao accountsDao;
	@Autowired
	private AccountPayableDao apDao;
	
	private Map<String, Object> map = new HashMap<>();
	
	private List loadAPList() {
		return apDao.fetchAPList();
	}
	
	@Transactional
	private void saveAP(AccountPayable ap) {
		apDao.saveAP(ap);
	}
	@Transactional
	private void updateAP(AccountPayable ap) {
		apDao.updateAP(ap);
	}@Transactional
	private void deleteAP(int id) {
		apDao.deleteAP(id);
	}
	/**************************** AP item ***************************************/
	private List loadApItems(String apNumber) {
		return apDao.fetchAPItemms(apNumber);
	}
	@Transactional
	private void batchSaveApItems(List<AccountPayableItem> itemList) {
		apDao.batchInsertApItems(itemList);
	}
	@Transactional
	private void deleteApItems(String apNumber) {
		apDao.deleteApItems(apNumber);
	}
	/**************************** Business function ***************************************/
	
	public List gotApList(ModelMap model) {
		return loadAPList();
	}
	@Transactional
	public Map<String, Object> saveAP(ModelMap model, AccountPayable ap) {
		map.put("status", "y");
		map.put("msg", "success");
		List<AccountPayableItem> itemList = new ArrayList<>();
		AccountPayableItem item = null;
		for (int i = 0; i < ap.getItems().size(); i++) {
			item = ap.getItems().get(i);
			if(!item.isNull()) {
				log.debug("come here how many ???? " + i);
				itemList.add(item);
			}
		}
		try {
			if(ap.getId() == 0) {
				saveAP(ap);
				batchSaveApItems(itemList);
			} else if (ap.getId() > 0) {
				deleteApItems(ap.getApNumber());
				batchSaveApItems(itemList);
			}
			
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
			e.printStackTrace();
		}
		return map;
	}
	@Transactional
	public Map<String, Object> deleteAP(ModelMap model, String id) {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			deleteAP(Integer.parseInt(id));
		} catch (DuplicateKeyException dke) {
			map.put("status", "n");
			map.put("msg", "Delete error");
			dke.printStackTrace();
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "delete error");
			e.printStackTrace();
		}
		return map;
	}
	
}
