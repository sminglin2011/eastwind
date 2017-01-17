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

import com.web.domain.AccountPayable;
import com.web.domain.ChartOfAccounts;
import com.web.domain.LedgerGroup;

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
	
}
