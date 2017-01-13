package com.web.Dao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.domain.Category;
import com.web.domain.StockItem;
import com.web.domain.StockItemSupplier;
import com.web.domain.UomEntity;

@Repository
public class StockDao implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger log = Logger.getLogger(StockDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * Category List
	 * @return
	 */
	public List fetchCategoryList() {
		List list = null;
		list = jdbcTemplate.queryForList("select id, name from stockCategory");
		return list;
	}
	
	/***
	 * Category
	 * @param id
	 * @return
	 */
	public Category fetchCategory(int id) {
		Category category = new Category();
		RowMapper<Category> rowMapper = new RowMapper<Category>() {
			@Override
			public Category mapRow(ResultSet rs, int sowNum) throws SQLException {
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
				return category;
			}
		};
		String sql = "select id, name from stockCategory where id = ?";
		category = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return category;
	}
	
	/**
	 * Stock List
	 * @return
	 */
	public List fetchStockList() {
		List list = null;
		list = jdbcTemplate.queryForList("select id, description, description1, unitMs, avgUnitPrice, categoryId from stockItem");
		return list;
	}
	
	/***
	 * StockItem
	 * @param id
	 * @return
	 */
	public StockItem fetchStockItem(int id) {
		StockItem stock = new StockItem();
		RowMapper<StockItem> rowMapper = new RowMapper<StockItem>() {
			@Override
			public StockItem mapRow(ResultSet rs, int sowNum) throws SQLException {
				StockItem item = new StockItem();
				item.setId(rs.getInt("id"));
				item.setDescription(rs.getString("description"));
				item.setDescription1(rs.getString("description1"));
				item.setUnitMs(rs.getString("unitMs"));
				item.setCategoryId(rs.getInt("categoryId"));
				return item;
			}
		};
		String sql = "select id, description, description1, unitMs, avgUnitPrice, categoryId from stockItem where id = ?";
		stock = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return stock;
	}
	
	public void saveStock(StockItem stock) {
		String sql = "insert into stockItem (description, description1, unitMs, avgUnitPrice, categoryId) values "
				+ "(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, stock.getDescription(), stock.getDescription1(), stock.getUnitMs(),
				 stock.getAvgUnitPrice(), stock.getCategoryId());
	}
	
	public void updateStock(StockItem stock) {
		String sql = "update stockItem set description=?, description1=?, unitMs=?, avgUnitPrice=?, "
				+ "categoryId=? where id = ?";
		jdbcTemplate.update(sql, stock.getDescription(), stock.getDescription1(), stock.getUnitMs(),
				stock.getAvgUnitPrice(), stock.getCategoryId(), stock.getId());
	}
	
	public void deleteStock(int id) {
		String sql = "delete from stockItem where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	public List fetchStockListByKeyword(String keyword) {
		List list = null;
		String sql = "select id, description, description1, unitMs, avgUnitPrice, categoryId from stockItem"
				+ " where description like '%"+keyword+"%' or description1 like '%"+keyword+"%' or unitMs like '%"+keyword+"%'";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	
	/***************************************** stock item supplier ******************************************************/
	public List fetchStockItemSupplieryListByStockId(int stockId) {
		List list = null;
		String sql = "select sis.id, sis.stockId, si.description, si.description1," 
						+ " sis.supplierid, s.name,"
						+ " sis.price, sis.isdefault"
						+ " from stockitemsupplier sis"
						+ " left join stockitem si on sis.stockid = si.id"
						+ " left join supplier s on s.id = sis.supplierId"
						+ " where sis.stockid = ? order by sis.isdefault desc";
		list = jdbcTemplate.queryForList(sql, stockId);
		log.debug("dao list = ??????===" + list);
		return list;
	}
	
	
	public void saveStockItemSupplier(StockItemSupplier stockItemSupplier) {
		String sql = "insert into stockItemSupplier (stockId, supplierId, price, uom, isdefault) values "
				+ "(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, stockItemSupplier.getStockId(), stockItemSupplier.getSupplierId()
				, stockItemSupplier.getPrice(), stockItemSupplier.getUom(), stockItemSupplier.isIsdefault());
	}
	/**
	 * return stockId by stockItemSupplier id
	 * @param id
	 * @return
	 */
	public int returnStockIdFromStockItemSupplier(int id){
		String sql = "select stockId from stockItemSupplier where id = ?";
		int stockId = jdbcTemplate.queryForObject(sql, Integer.class, id);
		return stockId;
	}
	/**
	 * update isDefault = false all stockId = stockId
	 * @param stockId
	 */
	public void updateNonDefaultStockItemSupplier(int stockId) {
		String update_all_non_default = "update stockItemSupplier set isdefault = false where stockId = ?";
		jdbcTemplate.update(update_all_non_default, stockId);
	}
	/**
	 * update default stockItemSupplier
	 * @param id
	 */
	public void updateDefaultStockItemSupplier(int id) {
		String update_default = "update stockItemSupplier set isdefault = true where id = ?";
		jdbcTemplate.update(update_default, id);
	}
	/***
	 * remove supplier from stockItem
	 * @param id
	 */
	public void deleteStockItemSupplier(int id) {
		String delte_sql = "delete from stockItemSupplier where id = ?";
		jdbcTemplate.update(delte_sql, id);
	}
	
	public List fetchUOMFromStockItemSupplierByStockId(int stockId) {
		List uomList = null;
		String sql = "select distinct(uom) from stockItemSupplier where stockId = ?";
		uomList = jdbcTemplate.queryForList(sql, stockId);
		return uomList;
	}
	
	public StockItemSupplier fetchStockItemDefaultSupplier(int stockId) {
		String sql = "select sis.id, sis.stockId, si.description as stockDescription"
				+ ", sis.supplierId, sis.price, sis.uom, sis.isdefault"
				+ " from stockItemSupplier sis left join stockItem si"
				+ " on si.id = sis.stockId where isdefault = true and stockId = ?";
		RowMapper<StockItemSupplier> rowMapper = new RowMapper<StockItemSupplier>() {
			@Override
			public StockItemSupplier mapRow(ResultSet rs, int sowNum) throws SQLException {
				StockItemSupplier sis = new StockItemSupplier();
				sis.setId(rs.getInt("id"));
				sis.setIsdefault(rs.getBoolean("isdefault"));
				sis.setPrice(rs.getDouble("price"));
				sis.setStockId(rs.getInt("stockId"));
				sis.setSupplierId(rs.getInt("supplierId"));
				sis.setUom(rs.getString("uom"));
				sis.setStockDescription(rs.getString("stockDescription"));
				return sis;
			};
		};
		return jdbcTemplate.queryForObject(sql, rowMapper, stockId);
	}
	/***************************************** stock item supplier end ****************************************/
}
