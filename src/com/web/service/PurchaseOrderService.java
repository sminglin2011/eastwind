package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.PurchaseOrderDao;
import com.web.domain.PurchaseOrder;
import com.web.domain.User;

@Service
public class PurchaseOrderService {

	Logger log = Logger.getLogger(PurchaseOrderService.class);
	
	@Autowired
	private PurchaseOrderDao poDao;
	
	private Map<String, Object> map = new HashMap<>();
	
	public List loadPoList() throws Exception {
		return poDao.fetchPurchaseOrderList();
	}
	@Transactional
	public void savePo(PurchaseOrder po) throws Exception {
		poDao.savePurchaseOrder(po);
	}
	@Transactional
	public void updatePo(PurchaseOrder po) throws Exception {
		poDao.updatePurchaseOrder(po);
	}
	@Transactional
	public void deletePo(int id) throws Exception {
		poDao.deletePurchaseOrder(id);
	}
	
	public PurchaseOrder loadPo(int id) throws Exception {
		return poDao.fetchPurchaseOrder(id);
	}
	
	
	/*************************** Business function for controller *****************************************/
	public ModelMap goToPurchaseOrderMain(ModelMap model) throws Exception {
		List list = loadPoList();
		model.put("list", list);
		return model;
	}
}
