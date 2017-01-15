package com.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.GoodsReceivedDao;
import com.web.Dao.PurchaseOrderDao;
import com.web.constant.AppConstant;
import com.web.domain.GoodsReceived;
import com.web.domain.PurchaseOrder;
import com.web.domain.PurchaseOrderItems;
import com.web.domain.User;
import com.web.exception.ParameterException;

@Service
public class PurchaseOrderService {

	Logger log = Logger.getLogger(PurchaseOrderService.class);
	
	@Autowired
	private PurchaseOrderDao poDao;
	@Autowired
	private GoodsReceivedDao grDao;
	
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
	public PurchaseOrder loadPo(String poNumber) throws Exception {
		return poDao.fetchPurchaseOrder(poNumber);
	}
	/*************************** purchaseOrderItems *****************************************/
	public List loadPoItems (String poNumber) {
		return poDao.fetchPurchaseOrderItemsByPoNumber(poNumber);
	}
	@Transactional
	public void savePoItem(PurchaseOrderItems poItem) throws Exception{
		poDao.savePurchaseOrderItem(poItem);
	}
	@Transactional
	public void updatePoItem(PurchaseOrderItems poItem) throws Exception{
		poDao.updatePurchaseOrderItem(poItem);
	}
	
	/*************************** Business function for controller *****************************************/
	public ModelMap goToPurchaseOrderMain(ModelMap model) throws Exception {
		List list = loadPoList();
		model.put("list", list);
		return model;
	}
	
	public ModelMap editPo(ModelMap model, String id) throws Exception {
		PurchaseOrder po = loadPo(Integer.parseInt(id));
		List poItems = loadPoItems(po.getPoNumber());
		po.setPoItemList(poItems);
		model.put("po", po);
		return model;
	}
	
	public Map<String, Object> approvePo(ModelMap model, String id, String approve) throws Exception {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			PurchaseOrder po = loadPo(Integer.parseInt(id));
			po.setStatus(approve);
			updatePo(po);
		} catch (ParameterException e) {
			map.put("status", "n");
			map.put("msg", "Parameter Exception");
			e.printStackTrace();
			throw e;
		}
		
		return map;
	}
	
	public Map<String, Object> saveEditPoItems(ModelMap model, List<PurchaseOrderItems> list) throws Exception {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			for (int i = 0; i < list.size(); i++) {
				PurchaseOrderItems item = list.get(i);
				if(item.getId() == 0) {
					savePoItem(item);
				} else {
					updatePoItem(item);
				}
			}
			
		} catch (DataAccessException e) {
			map.put("status", "n");
			map.put("msg", "save purchase item error");
			e.printStackTrace();
			throw e;
		}
		
		return map;
	}
	public ModelMap goToPoConvertToGR(ModelMap model, String poNumber) throws Exception {
		List list = loadPoItems(poNumber);
		model.put("poItems", list);
		return model;
	}
	@Transactional
	public Map<String, Object> poConvertToGR(ModelMap model, List<GoodsReceived> grList) throws Exception {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			grDao.batchInsertGR(grList);
			boolean isFull = true; // 针对是否整张PO都有收货，如果有收到po的全部货物，po状态修改为full
			String poNumber = "";
			for (int i = 0; i < grList.size(); i++) {
				poNumber = grList.get(i).getPoNumber();
				if(grList.get(i).getReceivedQty() + grList.get(i).get_laterReceivedQty() != grList.get(i).get_purchaseQty()){
					isFull = false;
					break;
				}
			}
			if(isFull) {
				PurchaseOrder po = loadPo(poNumber);
				po.setStatus(AppConstant.POSTATUS_FULL);
				updatePo(po);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", "n");
			map.put("msg", "强行转换对象出错");
			throw e;
		}
		
		
		return map;
	}
}
