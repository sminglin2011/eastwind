package com.web.Dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

//@Repository
public class TestDao {

//	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchList() {
		List list = null;
		String sql = "select * from m03staff";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
}
