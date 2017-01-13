package com.web.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.PurchaseOrderDao;
import com.web.Dao.PurchaseRequestDao;
import com.web.Dao.StockDao;
import com.web.domain.PurchaseOrder;
import com.web.domain.PurchaseOrderItems;
import com.web.domain.PurchaseRequest;
import com.web.domain.StockItem;
import com.web.domain.StockItemSupplier;
import com.web.domain.UomEntity;
import com.web.exception.BusinessException;
import com.web.util.GeneratorId;

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
	@Autowired
	private PurchaseOrderDao poDao;
	
	
	/**
	 * load all purchase request include all status
	 * @param model
	 * @return
	 */
	public ModelMap loadAllPurchaseRequestList(ModelMap model) throws Exception{
		List list = prDao.fetchAllPurchaseRequestList();
		model.put("list", list);
		return model;
	}
	/**
	 * load purchase request waiting purchasing
	 * @param model
	 * @return
	 */
	public ModelMap loadPurchaseRequestList(ModelMap model) throws Exception {
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
	/**
	 * reject purchase request
	 * @param ids
	 * @return
	 */
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
	
	public ModelMap goToBachtPurchasing(ModelMap model, String ids) throws Exception {
		List prList = null;
		try {
			prList = prDao.fetchPurchaseRequestListByIds(ids);
			model.put("list", prList);
		} catch(BusinessException be){
			throw be;
		} catch (Exception e) {
			throw e;
		}
		return model;
	}
	@Transactional
	public Map<String, Object> saveBatchPurchase(List<PurchaseOrderItems> poItemList) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("status", "y");
		log.debug("batch purchasing service ......................." + poItemList);
		List<PurchaseOrder> poList = new ArrayList<>();
		List<PurchaseOrderItems> orderItemList = new ArrayList<>();
		String poNumber = GeneratorId.generate9();
		try {
			int default_supplier = 0;
			PurchaseOrder po = null;
			for (int i = 0; i < poItemList.size(); i++) {
				PurchaseOrderItems poItem = poItemList.get(i);
				StockItemSupplier sis = stockDao.fetchStockItemDefaultSupplier(poItem.getStockId());
				/***
				 * 如果采购的单位与默认供应商设置单位不一致，返回 BusinessException 
				 */
				if (!sis.getUom().equals(poItem.getPurchaseUom())) {
					throw new BusinessException("Purchase UOM (Unit Of Measure) havn't for default supplier");
				}
				int itemSupplier = sis.getSupplierId();
				if (default_supplier != itemSupplier) {
					default_supplier = itemSupplier;
					po = new PurchaseOrder();
					po.setPoNumber(poNumber);
					po.setSupplierId(default_supplier);
					po.setDate(new Date());
					poList.add(po);
				}
				poItem.setPrice(sis.getPrice());
				poItem.setItemDescription(sis.getStockDescription());
				poItem.set_poNumber(poNumber);
				poItem.setSupplierId(default_supplier);
				orderItemList.add(poItem);
			}
			poDao.batchInsertPO(poList);
			poDao.batchInsertPOItem(orderItemList);
			
		} catch (BusinessException e) {
			map.put("status", "n");
			map.put("errorMsg", "Purchase UOM (Unit Of Measure) havn't for default supplier");
		} catch (Exception e) {
			map.put("status", "n");
			map.put("errorMsg", "Batch Purchase Error");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@Transactional
	public void deletePurchaseRequest(String id) {
		prDao.deletePurchaseRequest(Integer.parseInt(id));
	}
}
