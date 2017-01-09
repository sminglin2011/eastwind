package com.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SalesOrderService {

	Logger log = Logger.getLogger(SalesOrderService.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public List fetchSOList() {
		List list = null;
		String sql = "select sonumber, soDate, postStatus, billStatus, DeliverStatus,"
				+ " referenceOur, referenceOur,contactType, custCode, custAttention, custName,"
				+ " custTelephone, inChargeCode, incoTerm, poNO, eventDate, eventTime, deliveryDate, deliveryTime,"
				+ " collectionDate, collectionTime, noPax, custMobile, mainSONo, occasion from m02So where postStatus<>'v'";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
}
