package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.domain.Customer;
import com.web.domain.Supplier;

@Repository
public class SupplierDao {
	
	Logger log = Logger.getLogger(SupplierDao.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchSupplierListByKeyword(String keyword) {
		List list = null;
		String sql = "select id, name, terms, accountCode from supplier where name like '%"+keyword+"%' or terms like '%"+keyword+"%'"
				+ " or accountCode like '%"+keyword+"%' ";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	public List fetchSupplierList() {
		List  list = null;
		String sql = "select id, name, terms, accountCode from supplier s order by s.id desc";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	public void saveSupplier(Supplier supplier) {
		String sql = "insert into supplier (name, terms, accountCode) values (?, ?, ?)";
		log.debug("dao save supplier sql = " + sql);
		try {
			jdbcTemplate.update(sql, supplier.getName(), supplier.getTerms(), supplier.getAccountCode());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
	}
	public void updateSupplier(Supplier supplier) {
		String sql = "update supplier set name = ?, terms = ?, accountCode = ? where id = ?";
		log.debug("dao update supplier sql = " + sql);
		try {
			jdbcTemplate.update(sql, supplier.getName(), supplier.getTerms(), supplier.getAccountCode()
					, supplier.getId());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
	}
	
	public Supplier fetchSupplier(int id) {
		Supplier supplier = new Supplier();
		String sql = "select id, name, terms, accountCode from supplier where id = ?";
		RowMapper<Supplier> rowMapper = new RowMapper<Supplier>() {
			public Supplier mapRow(ResultSet rs, int rowNum) throws SQLException {
				Supplier supplier = new Supplier();
				supplier.setId(rs.getInt("id"));
				supplier.setName(rs.getString("name"));
				supplier.setTerms(rs.getString("terms"));
				supplier.setAccountCode(rs.getInt("accountCode"));
				return supplier;
			}
		};
		try {
			supplier = jdbcTemplate.queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw e;
		}
		
		return supplier;
	}
	public Supplier fetchSupplierByName(String name) {
		Supplier supplier = new Supplier();
		String sql = "select id, name, terms, accountCode from customer where name = ?";
		RowMapper<Supplier> rowMapper = new RowMapper<Supplier>() {
			public Supplier mapRow(ResultSet rs, int rowNum) throws SQLException {
				Supplier supplier = new Supplier();
				supplier.setId(rs.getInt("id"));
				supplier.setName(rs.getString("name"));
				supplier.setTerms(rs.getString("terms"));
				supplier.setAccountCode(rs.getInt("accountCode"));
				return supplier;
			}
		};
		try {
			supplier = jdbcTemplate.queryForObject(sql, rowMapper, name);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw e;
		}
		
		return supplier;
	}
	
	public void deleteSupplier(Integer id) {
		String sql = "delete from supplier where id = ?";
		log.debug("dao delete supplier sql = " + sql);
		try {
			jdbcTemplate.update(sql, id);
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
	}
}
