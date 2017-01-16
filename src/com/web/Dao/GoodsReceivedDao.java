package com.web.Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.web.domain.GoodsReceived;
import com.web.util.DateFormat;

@Repository
public class GoodsReceivedDao {

	Logger log = Logger.getLogger(GoodsReceivedDao.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchGoodsReceivedList() throws Exception {
		String sql = "select gr.vendorInvoice, gr.receivedDate, gr.poNumber, gr.stockId, si.description as itemDescription"
				+ ", gr.receivedQty, gr.receivedUom, gr.apNumber, gr.supplierId, s.name as supplierName"
				+ " from goodsreceived gr"
				+ " left join stockitem si on si.id = gr.stockid"
				+ " left join supplier s on s.id = gr.supplierId";
		return jdbcTemplate.queryForList(sql);
	}
	
	public GoodsReceived fetchGoodsReceived(int id) {
		GoodsReceived goodsReceived = new GoodsReceived();
		
		return goodsReceived;
	}
	
	public void saveGoodsReceived(GoodsReceived gr) throws Exception {
		String sql = "insert into GoodsReceived (vendorInvoice, receivedDate, poNumber, stockId, receivedQty"
				+ ", receivedUom, apNumber, supplierId) values (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, gr.getVendorInvoice(), gr.getReceivedDate(), gr.getPoNumber(), gr.getStockId()
				, gr.getReceivedQty(), gr.getReceivedUom(), gr.getApNumber(), gr.getSupplierId()); 
	}
	
	public void updateGoodsReceived(GoodsReceived gr) throws Exception {
		String sql = "update GoodsReceived set vendorInvoice = ?, receivedDate = ?, poNumber = ?, stockId = ?"
				+ ", receivedQty = ?, receivedUom = ?, apNumber = ?, supplierId = ? where id = ?";
		jdbcTemplate.update(sql, gr.getVendorInvoice(), gr.getReceivedDate(), gr.getPoNumber(), gr.getStockId()
				, gr.getReceivedQty(), gr.getReceivedUom(), gr.getApNumber(), gr.getSupplierId(), gr.getId()); 
	}
	
	public void batchInsertGR(List<GoodsReceived> grList) throws Exception {
		String sql = "insert into GoodsReceived (vendorInvoice, receivedDate, poNumber, stockId, receivedQty"
				+ ", receivedUom, apNumber, supplierId) values (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				GoodsReceived gr = grList.get(i);
				ps.setString(1, gr.getVendorInvoice());
				ps.setDate(2, new Date(DateFormat.stringToDate(gr.getReceivedDate()).getTime()));
				ps.setString(3, gr.getPoNumber());
				ps.setInt(4, gr.getStockId());
				ps.setDouble(5, gr.getReceivedQty());
				ps.setString(6, gr.getReceivedUom());
				ps.setString(7, gr.getApNumber());
				ps.setInt(8, gr.getSupplierId());
			}
			
			@Override
			public int getBatchSize() {
				return grList.size();
			}
		});
	}
}
