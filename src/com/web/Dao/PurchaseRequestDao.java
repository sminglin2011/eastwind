package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Repository;

import com.web.domain.PurchaseRequest;

@Repository
public class PurchaseRequestDao {
	
	Logger log = Logger.getLogger(PurchaseRequestDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * fetch all purchase request, haven't fully purchase
	 * @return
	 */
	public List fetchPurchaseRequestList() {
		List list = null;
		String sql = "select id, stockId, requestQty, requestUom, requestBy"
				+ ", (select description from stockItem where id = stockId) as itemDescription"
				+ " from purchaserequest p "
				+ " where (p.status != 'reject' or p.status is null) and p.requestqty <>  (select COALESCE(SUM(purchaseqty),0) "
				+ " from purchaseorderItems where prid =  p.id)"
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
		String sql = "update purchaseRequest set stockId = ?, requestQty = ?, requestUom = ?, requestBy = ? where id = ?";
		jdbcTemplate.update(sql,  purchaseRequest.getStockId(), purchaseRequest.getRequestQty()
				, purchaseRequest.getRequestUom(), purchaseRequest.getRequestBy(), purchaseRequest.getId());
	}
	
	public void rejectPurchaseRequestByIds(String ids) {
		String sql = "update purchaseRequest set status = 'reject' where id in ("+ids+")";
//		List ids = Arrays.asList(new Integer[]{ids});
//		Map<String, List> paramMap = Collections.singletonMap("goodsid", ids);
//		MapSqlParameterSource parameters = new MapSqlParameterSource();
//		parameters.addValue("ids", ids.split(","));
//		String sql = "select * from purchaseRequest  where id in ("+ids+")";
		jdbcTemplate.update(sql);
	}
	
	public void deletePurchaseRequest(int id) {
		String sql = "delete from purchaseRequest where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
}
