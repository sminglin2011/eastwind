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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.AccountPayableDao;
import com.web.Dao.AccountsDao;
import com.web.controller.GoodsReceivedController;
import com.web.domain.AccountPayable;
import com.web.domain.AccountPayableItem;
import com.web.domain.ChartOfAccounts;
import com.web.domain.LedgerGroup;
import com.web.exception.AjaxRequestException;

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
	/**************************** AP item ***************************************/
	private List loadApItems(String apNumber) {
		return apDao.fetchAPItemms(apNumber);
	}
	/**************************** Business function ***************************************/
	
	public List gotApList(ModelMap model) {
		return loadAPList();
	}
	/********* if split the @Transactional function to other function, it cannot roll back   ************/
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Map<String, Object> saveAP(ModelMap model, AccountPayable ap) throws RuntimeException {
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
			if(ap.getId() == 0) { //save
				apDao.saveAP(ap);
				if(itemList.size()<= 0) {
					throw new AjaxRequestException("AP Items empty");
				}else {
					apDao.batchInsertApItems(itemList);
				}
			} else if (ap.getId() > 0) { //udpate
				apDao.updateAP(ap);
				if(itemList.size()<= 0) {
					throw new AjaxRequestException("AP Items empty");
				}else {
					apDao.deleteApItems(ap.getApNumber());
					apDao.batchInsertApItems(itemList);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw new AjaxRequestException(e.getLocalizedMessage()); // must throw this runtime exception then it can roll back
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "save error");
			e.printStackTrace();
		}
		return map;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Map<String, Object> deleteAP(ModelMap model, String id) {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			apDao.deleteAP(Integer.parseInt(id));
		} catch (RuntimeException e) {
			throw new AjaxRequestException(e.getLocalizedMessage());
		} catch (Exception e) {
			map.put("status", "n");
			map.put("msg", "delete error");
			e.printStackTrace();
		}
		return map;
	}
	
}
