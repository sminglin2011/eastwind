package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.StockDao;
import com.web.Dao.SupplierDao;
import com.web.domain.Category;
import com.web.domain.StockItem;
import com.web.domain.StockItemSupplier;
import com.web.domain.Supplier;

import sun.util.logging.resources.logging;

@Service
@Transactional
public class StockService {

	Logger log = Logger.getLogger(StockService.class);
	
	@Autowired
	private StockDao stockDao;
	@Autowired
	private SupplierDao supplierDao;
	
	public List loadCategoryList() {
		return stockDao.fetchCategoryList();
	}
	
	public Category loadCategory(int id) {
		return stockDao.fetchCategory(id);
	}
	
	public List loadStockList() {
		List list = null;
		list = stockDao.fetchStockList();
		return list;
	}
	
	public StockItem loadStock(int id) {
		StockItem stock = stockDao.fetchStockItem(id);
		return stock;
	}
	@Transactional
	public void saveStock(StockItem stock) {
		log.debug("service save stock");
		stockDao.saveStock(stock);
	}
	@Transactional
	public void updateStock(StockItem stock) {
		stockDao.updateStock(stock);
	}
	@Transactional
	public void deleteStock(int id) {
		stockDao.deleteStock(id);
	}
	
	public List filterByKeyword(String keyword) {
		List list = null;
		list = stockDao.fetchStockListByKeyword(keyword);
		/*****这里看是否可以过滤点category 通过list*****/
		return list;
	}
	
	/***************************************** stock item supplier ******************************************************/
	public List loadStockItemSupplieryListByStockId(String stockId) {
		return stockDao.fetchStockItemSupplieryListByStockId(Integer.parseInt(stockId));
	}
	@Transactional
	public Map<String, Object> addStockItemSupplier(StockItemSupplier stockItemSupplier) {
		// check supplier name if existing? yes return supplier id, no throw exception
		Map<String, Object> map = new HashMap<>();
		map.put("status", "y");
		try {
			Supplier supplier = supplierDao.fetchSupplierByName(stockItemSupplier.getSupplierName());
			stockItemSupplier.setSupplierId(supplier.getId());
			stockDao.saveStockItemSupplier(stockItemSupplier);
		} catch (EmptyResultDataAccessException e) {
			log.info("supplier name not exist, please create first");
			map.put("status", "n");
			map.put("errorMsg", "Supplier not exist!");
			e.printStackTrace();
			throw e;
		} catch (DuplicateKeyException e) {
			log.info("duplicate supplier and uom");
			map.put("status", "n");
			map.put("errorMsg", "duplicate supplier and UOM");
			e.printStackTrace();
			throw e;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	@Transactional
	public Map<String, Object> defaultStockItemSupplier(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("status", "y");
		try {
			int stockId = stockDao.returnStockIdFromStockItemSupplier(id);
			log.debug("service inside stockId = " + stockId);
			stockDao.updateNonDefaultStockItemSupplier(stockId);
			stockDao.updateDefaultStockItemSupplier(id);
		} catch (DataAccessException e) {
			map.put("status", "n");
			map.put("errorMsg", "excuce sql error!");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	@Transactional
	public Map<String, Object> removeSupplierFromStockItem(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("status", "y");
		try {
			stockDao.deleteStockItemSupplier(id);
		} catch (DataAccessException e) {
			map.put("status", "n");
			map.put("errorMsg", "excuce sql error!");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/***************************************** stock item supplier end ****************************************/
}
