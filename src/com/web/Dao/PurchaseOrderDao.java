package com.web.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.domain.Customer;
import com.web.domain.PurchaseOrder;
import com.web.domain.PurchaseOrderItems;
import com.web.domain.PurchaseRequest;

@Repository
public class PurchaseOrderDao {
	
	Logger log = Logger.getLogger(PurchaseOrderDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchPurchaseOrderList() throws Exception{
		String sql = "select po.id, poNumber, date, supplierId, s.name as _supplierName, preparedby, po.status"
				+ ", (select COALESCE(sum(price*purchaseqty),0) from purchaseorderitems i where i.ponumber = po.ponumber) as total"
				+ " from PurchaseOrder po"
				+ " left join supplier s on s.id = po.supplierId "
				+ " order by po.date desc, po.id desc";
		return jdbcTemplate.queryForList(sql);
	}
	
	public PurchaseOrder fetchPurchaseOrder(int id) {
		String sql = "select id, poNumber, date, supplierId, preparedby, po.status from PurchaseOrder po where id = ?";
		RowMapper<PurchaseOrder> rowMapper = new RowMapper<PurchaseOrder>() {
			public PurchaseOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
				PurchaseOrder po = new PurchaseOrder();
				po.setDate(rs.getDate("date"));
				po.setId(rs.getInt("id"));
				po.setPoNumber(rs.getString("poNumber"));
				po.setPreparedby(rs.getInt("preparedby"));
				po.setSupplierId(rs.getInt("supplierId"));
				po.setStatus(rs.getString("status"));
				return po;
			}
		};
		return jdbcTemplate.queryForObject(sql, rowMapper, id);
	}
	
	public PurchaseOrder fetchPurchaseOrder(String poNumber) {
		String sql = "select id, poNumber, date, supplierId, preparedby, po.status from PurchaseOrder po where poNumber = ?";
		RowMapper<PurchaseOrder> rowMapper = new RowMapper<PurchaseOrder>() {
			public PurchaseOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
				PurchaseOrder po = new PurchaseOrder();
				po.setDate(rs.getDate("date"));
				po.setId(rs.getInt("id"));
				po.setPoNumber(rs.getString("poNumber"));
				po.setPreparedby(rs.getInt("preparedby"));
				po.setSupplierId(rs.getInt("supplierId"));
				po.setStatus(rs.getString("status"));
				return po;
			}
		};
		return jdbcTemplate.queryForObject(sql, rowMapper, poNumber);
	}
	
	public void deletePurchaseOrder(int id) throws Exception {
		String sql = "delete from PurchaseOrder where id = ?";
		jdbcTemplate.update(sql);
	}
	
	public void savePurchaseOrder (PurchaseOrder po) throws Exception {
		String sql = "insert into PurchaseOrder (poNumber, date, supplierId, preparedby ) values (?, ?, ?, ?)";
		jdbcTemplate.update(sql, po.getPoNumber(), po.getDate(), po.getSupplierId(), po.getPreparedby());
	}
	
	public void updatePurchaseOrder(PurchaseOrder po) throws Exception {
		String sql = "update PurchaseOrder set poNumber = ?, date = ?, supplierId = ?, preparedby = ?"
				+ ", status = ?"
				+ " where id = ?";
		jdbcTemplate.update(sql, po.getPoNumber(), po.getDate(), po.getSupplierId(), po.getPreparedby()
				, po.getStatus(), po.getId());
	}
	
	public void batchInsertPO(List<PurchaseOrder> poList) throws Exception {
		String sql = "insert into PurchaseOrder (poNumber, date, supplierId, preparedby ) values (?, ?, ?, ?)";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				PurchaseOrder po = poList.get(i);
				ps.setString(1, po.getPoNumber());
				ps.setDate(2, new java.sql.Date(po.getDate().getTime()));
				ps.setInt(3, po.getSupplierId());
				ps.setInt(4, po.getPreparedby());
			}
			
			@Override
			public int getBatchSize() {
				return poList.size();
			}
		});
	}
	
	
	/************************************************************************************************/
	public List fetchPurchaseOrderItemsByPoNumber(String poNumber) {
		String sql = "select i.id, i.poNumber, i.stockId, i.itemDescription, i.prid"
				+ ", (select COALESCE(sum(gr.receivedQty),0) from goodsReceived gr where gr.ponumber = i.ponumber and i.stockId = gr.stockId) as _receivedQty"
				+ ", i.purchaseQty"
				+ ", (i.purchaseQty-(select COALESCE(sum(gr.receivedQty),0) from goodsReceived gr where gr.ponumber = i.ponumber))as _balanceQty"
				+ ", i.purchaseUom, i.requestQty, i.requestUom"
				+ ", i.supplierId, i.price from PurchaseOrderItems i where i.poNumber = ?";
		return jdbcTemplate.queryForList(sql, poNumber);	
	}
	
	public void savePurchaseOrderItem (PurchaseOrderItems poItem) throws Exception {
		String sql = "insert into PurchaseOrderItems (stockId, prId, purchaseQty, purchaseUom"
				+ ", requestQty, requestUom, supplierId, price ) values (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, poItem.getStockId(), poItem.getPrId()
				, poItem.getPurchaseQty(), poItem.getPurchaseUom(), poItem.getRequestQty()
				, poItem.getRequestUom(), poItem.getSupplierId(), poItem.getPrice());
	}
	
	public void updatePurchaseOrderItem (PurchaseOrderItems poItem) throws Exception {
		String sql = "update PurchaseOrderItems set stockId = ? , prId = ?, purchaseQty = ?, purchaseUom = ?"
				+ ", requestQty = ?, requestUom = ?, supplierId = ?, price = ? where id = ?";
		jdbcTemplate.update(sql, poItem.getStockId(), poItem.getPrId()
				, poItem.getPurchaseQty(), poItem.getPurchaseUom(), poItem.getRequestQty()
				, poItem.getRequestUom(), poItem.getSupplierId(), poItem.getPrice(), poItem.getId());
	}
	
	public void batchInsertPOItem(List<PurchaseOrderItems> poItemList) throws Exception {
		String sql = "insert into PurchaseOrderItems (stockId, prId, purchaseQty, purchaseUom"
				+ ", requestQty, requestUom, supplierId, poNumber, price, itemDescription) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				PurchaseOrderItems poItem = poItemList.get(i);
				ps.setInt(1, poItem.getStockId());
				ps.setInt(2, poItem.getPrId());
				ps.setDouble(3, poItem.getPurchaseQty());
				ps.setString(4, poItem.getPurchaseUom());
				ps.setDouble(5, poItem.getRequestQty());
				ps.setString(6, poItem.getRequestUom());
				ps.setInt(7, poItem.getSupplierId());
				ps.setString(8,  poItem.get_poNumber());
				ps.setDouble(9, poItem.getPrice());
				ps.setString(10, poItem.getItemDescription());
			}
			
			@Override
			public int getBatchSize() {
				return poItemList.size();
			}
		});
	}
	
}
