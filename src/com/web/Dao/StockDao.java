package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.domain.Category;
import com.web.domain.StockItem;

@Repository
public class StockDao {

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
	
}
