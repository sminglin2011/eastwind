package com.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.StockDao;
import com.web.domain.Category;
import com.web.domain.StockItem;

@Service
@Transactional
public class StockService {

	Logger log = Logger.getLogger(StockService.class);
	
	@Autowired
	private StockDao stockDao;
	
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
}
