package com.web.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.PurchaseRequestDao;
import com.web.Dao.StockDao;
import com.web.domain.PurchaseRequest;
import com.web.domain.StockItem;
import com.web.domain.StockItemSupplier;
import com.web.domain.UomEntity;
import com.web.exception.BusinessException;

@Service
public class PurchaseRequestService implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger log = Logger.getLogger(PurchaseRequestService.class);

	@Autowired
	private PurchaseRequestDao prDao;
	@Autowired
	private StockDao stockDao;
		
	public ModelMap loadPurchaseRequestList(ModelMap model) {
		List list = prDao.fetchPurchaseRequestList();
		model.put("list", list);
		return model;
	}
	
	public PurchaseRequest loadPurchaseRequest(String id) {
		PurchaseRequest pr = new PurchaseRequest();
		pr = prDao.fetchPurchaseRequest(Integer.parseInt(id));
		return pr;
	}
	public ModelMap goToPurchaseRequestPage(ModelMap model, String stockId) throws Exception {
		StockItem stockItem = null;
		List uomList = null;
		try {
			stockItem = stockDao.fetchStockItem(Integer.parseInt(stockId));
			uomList = stockDao.fetchUOMFromStockItemSupplierByStockId(Integer.parseInt(stockId));
			if (uomList == null || uomList.isEmpty()) {
				throw new BusinessException("Please add stock item supplier first", "11");
			}
			
			model.put("stockItem", stockItem);
			model.put("uomList", uomList);
		} catch(BusinessException be){
			throw be;
		} catch (Exception e) {
			throw e;
		}
			
		
		return model;
	}
	@Transactional
	public Map<String, Object> savePurchaseRequest(PurchaseRequest purchaseRequest) {
		Map<String, Object> map = new HashMap<>();
		map.put("status", "y");
		
		try {
			if (purchaseRequest.getId() == 0) {
				prDao.savePurchaseRequest(purchaseRequest);
			} else {
				prDao.updatePurchaseRequest(purchaseRequest);
			}
		} catch (Exception e) {
			map.put("status", "n");
			map.put("errorMsg", "Save Purchase Request Error");
			e.printStackTrace();
		}
		
		return map;
	}
	@Transactional
	public Map<String, Object> rejectPurchaseRequest(String ids) {
		Map<String, Object> map = new HashMap<>();
		map.put("status", "y");
		
		try {
			prDao.rejectPurchaseRequestByIds(ids);
		} catch (Exception e) {
			map.put("status", "n");
			map.put("errorMsg", "Batch Reject Purchase Request Error");
			e.printStackTrace();
		}
		
		return map;
	}
	@Transactional
	public void deletePurchaseRequest(String id) {
		prDao.deletePurchaseRequest(Integer.parseInt(id));
	}
}
