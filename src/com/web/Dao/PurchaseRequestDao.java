package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.constant.AppConstant;
import com.web.domain.PurchaseRequest;

@Repository
public class PurchaseRequestDao {
	
	Logger log = Logger.getLogger(PurchaseRequestDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * fetch all purchase request, include all status
	 * @return
	 */
	public List fetchAllPurchaseRequestList() {
		List list = null;
		String sql = "select id, stockId, requestQty, requestUom, requestBy, prStatus"
				+ ", (select description from stockItem where id = stockId) as itemDescription"
				+ " from purchaserequest p "
				+ " order by id desc";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	/**
	 * fetch all purchase request, haven't fully purchase
	 * @return
	 */
	public List fetchPurchaseRequestList() {
		List list = null;
		//采购数量<>请求数量
//		String sql = "select id, stockId, requestQty, requestUom, requestBy, prStatus"
//				+ ", (select description from stockItem where id = stockId) as itemDescription"
//				+ " from purchaserequest p "
//				+ " where (p.prStatus != '"+AppConstant.PRSTATUS_REJECT+"' or p.prStatus is null) "
//				+ "and p.requestqty <>  (select COALESCE(SUM(purchaseqty),0) "
//				+ " from purchaseorderItems where prid =  p.id)"
//				+ " order by id desc";
		// 采购请求Id 不在采购单里
		String sql = "select id, stockId, requestQty, requestUom, requestBy, prStatus"
				+ ", (select description from stockItem where id = stockId) as itemDescription"
				+ " from purchaserequest p "
				+ " where (p.prStatus != '"+AppConstant.PRSTATUS_REJECT+"' or p.prStatus is null) "
				+ "and p.id not in  (select prid from purchaseorderItems)"
				+ " order by id desc";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	public List fetchPurchaseRequestListByIds(String ids) {
		List list = null;
		String sql = "select pr.id, pr.stockId, requestQty, requestUom, requestBy, prStatus"
				+ ", si.description as _itemDescription"
//				+ ", GROUP_CONCAT(distinct(sis.uom)) AS _uomList"
				+ " from purchaserequest pr left join "
				+ " stockItem si on si.id = pr.stockId"
//				+ " left join"
//				+ " stockitemsupplier sis on sis.stockId = pr.stockId"
				+ " where pr.id in ("+ids+")"
				+ " order by id desc";
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
		String sql = "select id, stockId, requestQty, requestUom, requestBy, prStatus from purchaseRequest where id = ?";
		purchaseRequest = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return purchaseRequest;
	}
	
	public void savePurchaseRequest(PurchaseRequest purchaseRequest) {
		String sql = "insert into purchaseRequest (stockId, requestQty, requestUom, requestBy ) values (?, ?, ?, ?)";
		jdbcTemplate.update(sql,  purchaseRequest.getStockId(), purchaseRequest.getRequestQty()
				, purchaseRequest.getRequestUom(), purchaseRequest.getRequestBy());
	}
	
	public void updatePurchaseRequest(PurchaseRequest purchaseRequest) {
		String sql = "update purchaseRequest set stockId = ?, requestQty = ?, requestUom = ?, requestBy = ? where id = ?";
		jdbcTemplate.update(sql,  purchaseRequest.getStockId(), purchaseRequest.getRequestQty()
				, purchaseRequest.getRequestUom(), purchaseRequest.getRequestBy(), purchaseRequest.getId());
	}
	
	public void rejectPurchaseRequestByIds(String ids) {
		String sql = "update purchaseRequest set prStatus = '"+AppConstant.PRSTATUS_REJECT+"' where id in ("+ids+")";
		jdbcTemplate.update(sql);
	}
	
	public void approvePurchaseRequestByIds(String ids, String status) {
		String sql = "update purchaseRequest set prStatus = '"+ status +"' where id in ("+ids+")";
		jdbcTemplate.update(sql);
	}
	
	public void deletePurchaseRequest(int id) {
		String sql = "delete from purchaseRequest where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
}
