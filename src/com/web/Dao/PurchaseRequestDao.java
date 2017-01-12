package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.domain.PurchaseRequest;

@Repository
public class PurchaseRequestDao {
	
	Logger log = Logger.getLogger(PurchaseRequestDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchPurchaseRequestList() {
		List list = null;
		String sql = "select id, stockId, requestQty, requestUom, requestBy from purchaseRequest order by id desc";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	public PurchaseRequest fetchPurchaseRequest(int id) {
		PurchaseRequest purchaseRequest = new PurchaseRequest();
		RowMapper<PurchaseRequest> rowMapper = new RowMapper<PurchaseRequest>() {
			public PurchaseRequest mapRow(ResultSet rs, int sowNum) throws SQLException {
				PurchaseRequest purchaseRequest = new PurchaseRequest();
				purchaseRequest.setId(rs.getInt("id"));
				purchaseRequest.setStockId(rs.getInt("stockId"));
				purchaseRequest.setRequestQty(rs.getFloat("requestQty"));
				purchaseRequest.setRequestUom(rs.getString("requestUom"));
				purchaseRequest.setRequestBy(rs.getInt("requestBy"));
				return purchaseRequest;
			}
		};
		String sql = "select id, stockId, requestQty, requestUom, requestBy from purchaseRequest where id = ?";
		purchaseRequest = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return purchaseRequest;
	}
	
	public void savePurchaseRequest(PurchaseRequest purchaseRequest) {
		//String sql = "inset into purchaseRequest set stockId = ?, requestQty = ?, requestUom = ?, requestBy ? from  where id = ?";
		String sql = "insert into purchaseRequest (stockId, requestQty, requestUom, requestBy ) values (?, ?, ?, ?)";
		jdbcTemplate.update(sql,  purchaseRequest.getStockId(), purchaseRequest.getRequestQty()
				, purchaseRequest.getRequestUom(), purchaseRequest.getRequestBy());
	}
	
	public void updatePurchaseRequest(PurchaseRequest purchaseRequest) {
		String sql = "update purchaseRequest set stockId = ?, requestQty = ?, requestUom = ?, requestBy ? where id = ?";
		jdbcTemplate.update(sql,  purchaseRequest.getStockId(), purchaseRequest.getRequestQty()
				, purchaseRequest.getRequestUom(), purchaseRequest.getRequestBy(), purchaseRequest.getId());
	}
	
	public void deletePurchaseRequest(int id) {
		String sql = "delete from purchaseRequest where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
}
