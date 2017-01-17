package com.web.Dao;

import java.sql.Date;
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

import com.web.domain.AccountPayable;
import com.web.domain.AccountPayableItem;
import com.web.domain.ChartOfAccounts;
import com.web.domain.GoodsReceived;
import com.web.domain.LedgerGroup;
import com.web.util.DataFormat;

@Repository
public class AccountPayableDao {

	Logger log = Logger.getLogger(AccountPayableDao.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchAPList() {
		String sql = "select ap.id, ap.apNumber, ap.date, ap.payType, ap.terms, ap.supplierId, s.name as supplierName,"
				+ " ap.goodsReceivedId "
				+ " from accountpayable ap"
				+ " left join supplier s on s.id = ap.supplierId";
		return jdbcTemplate.queryForList(sql);
	}
	
	public AccountPayable fetchAP(int id) {
		String sql = "select ap.id, ap.apNumber, ap.date, ap.payType, ap.terms, ap.supplierId, s.name as supplierName,"
				+ " ap.goodsReceivedId "
				+ " from accountpayable ap"
				+ " left join supplier s on s.id = ap.supplierId"
				+ " where ap.id = ?";
		RowMapper<AccountPayable> rowMapper = new RowMapper<AccountPayable>() {
			public AccountPayable mapRow(ResultSet rs, int rowNum) throws SQLException {
				AccountPayable ap = new AccountPayable();
				ap.setApNumber(rs.getString("apNumber"));
				ap.setDate(rs.getString("date"));
				ap.setGoodsReceivedId(rs.getInt("goodsReceivedId"));
				ap.setId(rs.getInt("id"));
				ap.setPayType(rs.getString("payType"));
				ap.setSupplierId(rs.getInt("supplierId"));
				ap.setSupplierName(rs.getString("supplierName"));
				ap.setTerms(rs.getString("terms"));
				return ap;
			}
		};
		return jdbcTemplate.queryForObject(sql, rowMapper, id);
	}
	
	public void saveAP(AccountPayable ap) {
		String sql = "insert into accountpayable (apNumber, date, payType, terms, supplierId"
				+ ", goodsReceivedId) values (?, ?, ?, ?, ?, ?) ";
		jdbcTemplate.update(sql, ap.getApNumber(), ap.getDate(), ap.getPayType(), ap.getTerms(), ap.getSupplierId()
				, ap.getGoodsReceivedId());
	}
	public void updateAP(AccountPayable ap) {
		String sql = "update accountpayable set apNumber=?, date=?, payType=?, terms=?, supplierId=?"
				+ ", goodsReceivedId=? where id = ? ";
		jdbcTemplate.update(sql, ap.getApNumber(), ap.getDate(), ap.getPayType(), ap.getTerms(), ap.getSupplierId()
				, ap.getGoodsReceivedId(), ap.getId());
	}
	
	public void deleteAP(int id) {
		String sql = "delete from accountpayable where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	/*************************** AP Item ***********************************/
	public List fetchAPItemms(String apNumber) {
		String sql = "select i.id, i.apNumber, i.supplierId, s.name as supplierName, i.stockId, i.description, i.remarks, i.quantity, i.uom"
				+ ", i.unitPrice, i.goodsReceivedId, i.gstType, i.gstRate, i.purchaseOrderId, i.accountCode"
				+ " from accountpayableItem i"
				+ " left join supplier s on s.id = i.supplierId"
				+ " where i.apNumber = ?";
		return jdbcTemplate.queryForList(sql, apNumber);
	}
	
	public void batchInsertApItems(List<AccountPayableItem> apItemList) {
		String sql = "insert into AccountPayableItem (apNumber, supplierId, stockId, description, remarks"
				+ ", quantity, uom, unitPrice, goodsReceivedId, gstType, gstRate, purchaseOrderId, accountCode)"
				+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				AccountPayableItem item = apItemList.get(i);
				ps.setString(1, item.getApNumber());
				ps.setInt(2, item.getSupplierId());
				ps.setInt(3, item.getStockId());
				ps.setString(4, item.getDescription());
				ps.setString(5, item.getRemarks());
				ps.setDouble(6, item.getQuantity());
				ps.setString(7, item.getUom());
				ps.setDouble(8, item.getUnitPrice());
				ps.setInt(9, item.getGoodsReceivedId());
				ps.setString(10, item.getGstType());
				ps.setDouble(11, item.getGstRate());
				ps.setInt(12, item.getPurchaseOrderId());
				ps.setInt(13, item.getAccountCode());
			}
			
			@Override
			public int getBatchSize() {
				return apItemList.size();
			}
		});
	}
	
	public void deleteApItems(String apNumber) {
		String sql = "delete from AccountPayableItem where apNumber = ?";
		jdbcTemplate.update(sql, apNumber);
	}
}
