package com.web.Dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.web.domain.ChartOfAccounts;
import com.web.domain.LedgerGroup;

@Repository
public class AccountsDao {

	Logger log = Logger.getLogger(AccountsDao.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchGeneralLedgerList() {
		String sql = "select id, accountType, accountCode, endCode, ledgerType from sysGeneralLedger";
		return jdbcTemplate.queryForList(sql);
	}
	
	public List fetchLedgerGroupList() {
		String sql = "select id, ledgerType, ledgerGroup from sysLedgerGroup";
		return jdbcTemplate.queryForList(sql);
	}
	
	public void saveLedgerGroupList(LedgerGroup lg) {
		String sql = "insert into sysLedgerGroup (ledgerType, ledgerGroup) values (?, ?)";
		jdbcTemplate.update(sql, lg.getLedgerType(), lg.getLedgerGroup());
	}
	public void updateLedgerGroupList(LedgerGroup lg) {
		String sql = "update sysLedgerGroup set ledgerType = ?, ledgerGroup = ? where id = ?";
		jdbcTemplate.update(sql, lg.getLedgerType(), lg.getLedgerGroup(), lg.getId());
	}
	
	public void deleteLedgerGroup(int id) {
		String sql = "delete from sysLedgerGroup where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	public List fetchCOAList() {
		String sql = "select id, description, accountCode, ledgerType, ledgerGroup, opening, gstType, gstRate"
				+ " from sysChartOfAccounts";
		return jdbcTemplate.queryForList(sql);
	}
	
	public void saveCOA(ChartOfAccounts coa) {
		String sql = "insert into sysChartOfAccounts (description, accountCode, ledgerType, ledgerGroup, opening, gstType"
				+ ", gstRate) values (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, coa.getDescription(), coa.getAccountCode(), coa.getLedgerType()
				, coa.getLedgerGroup(), coa.getOpening(), coa.getGstType(), coa.getGstRate());
	}
	
	public void updateCOA(ChartOfAccounts coa) { // accountCode cannot update
		String sql = "update sysChartOfAccounts set description=?, ledgerType=?, ledgerGroup=?, opening=?"
				+ ", gstType=?, gstRate=? where id = ?";
		jdbcTemplate.update(sql, coa.getDescription(), coa.getLedgerType()
				, coa.getLedgerGroup(), coa.getOpening(), coa.getGstType(), coa.getGstRate(), coa.getId());
	}
	
	public void batchSaveCOA(List<ChartOfAccounts> coaList) {
		String sql = "insert into sysChartOfAccounts (description, accountCode, ledgerType, ledgerGroup, opening, gstType"
				+ ", gstRate) values (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ChartOfAccounts coa = coaList.get(i);
				ps.setString(1, coa.getDescription());
				ps.setInt(2, coa.getAccountCode());
				ps.setString(3, coa.getLedgerType());
				ps.setString(4, coa.getLedgerGroup());
				ps.setDouble(5, coa.getOpening());
				ps.setString(6, coa.getGstType());
				ps.setDouble(7, coa.getGstRate());
			}
			
			@Override
			public int getBatchSize() {
				return coaList.size();
			}
		});
	}
	
	public void deleteCOA(int id) {
		String sql = "delete from sysChartOfAccounts where id = ?"; 
		jdbcTemplate.update(sql, id);
	}
	
}
