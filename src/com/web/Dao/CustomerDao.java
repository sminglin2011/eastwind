package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.web.domain.Customer;
import com.web.domain.CustomerBillContact;
import com.web.domain.CustomerDeliveryContact;

@Repository
public class CustomerDao {
	
	Logger log = Logger.getLogger(CustomerDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	
	/***************************** Customer **********************************************/
	public List fetchCustomerList() {
		List  list = null;
		String sql = "select distinct c.id, c.name, c.migrationId, c.terms, c.accountCode from customer c"
				+ " left join customerbillcontact cbc on cbc.customerId = c.id"
				+ " left join customerdeliverycontact cdc on cdc.customerId = c.id"
				+ " where c.id > 0";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	public List fetchCustomerListByKeyword(String keyword) {
		List list = null;
		String sql = "select distinct c.id, c.name, c.migrationId, c.terms, c.accountCode from customer c"
				+ " left join customerbillcontact cbc on cbc.customerId = c.id"
				+ " left join customerdeliverycontact cdc on cdc.customerId = c.id"
				+ " where c.id > 0 and "
				+ " ("
				+ " c.name like '%"+keyword+"%' or"
				+ " cbc.billAttention like '%"+keyword+"%' or"
				+ " cdc.deliveryAttention like '%"+keyword+"%' "
				+ ")";
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("name", keyword + "%");
		params.put("billAttention", keyword + "%");
		params.put("deliveryAttention", keyword + "%");
		
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	public Customer fetchCustomerByName(String name) {
		String sql = "select id, name, migrationId from customer where name = ?";
		Customer customer = new Customer();
		RowMapper<Customer> rowMapper = new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				log.debug("rowNum=" +rowNum);
				Customer customer = new Customer();
				customer.setId(String.valueOf(rs.getInt("id")));
				customer.setName(rs.getString("name"));
				customer.setMigrationId(rs.getString("migrationId"));
				return customer;
			}
		};
		try {
			customer = jdbcTemplate.queryForObject(sql, rowMapper, name);
		} catch (EmptyResultDataAccessException e) {
			log.error("fetchCustomerByName(" + name +") return Empty, "
					+ "means " + name + " can regist!" );
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		
		return customer;
	}
	
	public Customer fetchCustomer(int id) {
		Customer customer = new Customer();
		String sql = "select id, name, migrationId from customer where id = ?";
		RowMapper<Customer> rowMapper = new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Customer customer = new Customer();
				customer.setId(String.valueOf(rs.getInt("id")));
				customer.setName(rs.getString("name"));
				customer.setMigrationId(rs.getString("migrationId"));
				return customer;
			}
		};
		try {
			customer = jdbcTemplate.queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			throw e;
		}
		
		return customer;
	}
	
	public int saveCustomer(Customer customer) {
		String sql = "insert into customer (name, migrationId) values (?, ?)";
		log.debug("dao save customer sql = " + sql);
		int i = 0;
		try {
			i = jdbcTemplate.update(sql, customer.getName(), customer.getMigrationId());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return i;
	}
	
	public void updateCustomer(Customer customer) {
		String sql = "update customer set name = ?, migrationId = ? where id = ?";
		log.debug("dao update customer sql = " + sql);
		try {
			jdbcTemplate.update(sql, customer.getName(), customer.getMigrationId(), customer.getId());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
	}
	/***************************** Customer **********************************************/
	
	/***************************** billContact **********************************************/
	public List fetchCustomerBillContactList(int customerId) {
		List  list = null;
		String sql = "select id, customerId, billAttention, billTelephone, billMobile"
				+ ", billEmail, billFax, billAddress1, billAddress2, billAddress3"
				+ ", billPostcode from customerBillContact where customerId = ?";
		list = jdbcTemplate.queryForList(sql, customerId);
		return list;
	}
	
	public CustomerBillContact fetchCustomerBillContact(int id) {
		CustomerBillContact billContact = new CustomerBillContact();
		String sql = "select id, customerId, billAttention, billTelephone, billMobile"
				+ ", billEmail, billFax, billAddress1, billAddress2, billAddress3"
				+ ", billPostcode from customerBillContact where id = ?";
		RowMapper<CustomerBillContact> rowMapper = new RowMapper<CustomerBillContact>() {
			public CustomerBillContact mapRow(ResultSet rs, int rowNum) throws SQLException {
				CustomerBillContact billContact = new CustomerBillContact();
				billContact.setId(String.valueOf(rs.getInt("id")));
				billContact.setCustomerId(String.valueOf(rs.getInt("custoemrId")));
				billContact.setBillAttention(rs.getString("billAttention"));
				billContact.setBillTelephone(rs.getString("billTelephone"));
				billContact.setBillMobile(rs.getString("billMobile"));
				billContact.setBillEmail(rs.getString("billEmail"));
				billContact.setBillFax(rs.getString("billFax"));
				billContact.setBillAddress1(rs.getString("billAddress1"));
				billContact.setBillAddress2(rs.getString("billAddress2"));
				billContact.setBillAddress3(rs.getString("billAddress3"));
				billContact.setBillPostcode(String.valueOf(rs.getInt("billPostcode")));
				return billContact;
			}
		};
		try {
			billContact = jdbcTemplate.queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return billContact;
	}
	
	public int saveCustomerBillContact(CustomerBillContact billContact) {
		String sql = "insert into customerBillContact (customerId, billAttention, billTelephone, billMobile, billEmail"
				+ ", billFax, billAddress1, billAddress2, billAddress3, billPostcode) values (?,?,?,?,?,?,?,?,?,?)";
		log.debug("doo save bill contact sql = " + sql);
		int i = 0;
		try {
			i = jdbcTemplate.update(sql, billContact.getCustomerId(), billContact.getBillAttention(), billContact.getBillTelephone()
					, billContact.getBillMobile(), billContact.getBillEmail(), billContact.getBillFax(), billContact.getBillAddress1()
					, billContact.getBillAddress2(), billContact.getBillAddress3(), billContact.getBillPostcode());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return i;
	}
	
	public int updateCustomerBillContact(CustomerBillContact billContact) {
		String sql = "update customerBillContact set customerId = ?, billAttention = ?, billTelephone = ?"
				+ ", billMobile = ?, billEmail = ?"
				+ ", billFax = ?, billAddress1 = ?, billAddress2 = ?, billAddress3 = ?, billPostcode = ? where id = ?";
		log.debug("doo save bill contact sql = " + sql);
		int i = 0;
		try {
			jdbcTemplate.update(sql, billContact.getCustomerId(), billContact.getBillAttention(), billContact.getBillTelephone()
					, billContact.getBillMobile(), billContact.getBillEmail(), billContact.getBillFax(), billContact.getBillAddress1()
					, billContact.getBillAddress2(), billContact.getBillAddress3(), billContact.getBillPostcode(), billContact.getId());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return i;
	}
	/***************************** billContact **********************************************/
	
	/***************************** deliveryContact **********************************************/
	
	public List fetchCustomerDeliveryContactList(int customerId) {
		List  list = null;
		String sql = "select id, customerId, deliveryAttention, deliveryTelephone, deliveryMobile"
				+ ", deliveryEmail, deliveryAddress1, deliveryAddress2, deliveryAddress3"
				+ ", deliveryPostcode from customerDeliveryContact where customerId = ?";
		list = jdbcTemplate.queryForList(sql, customerId);
		return list;
	}
	
	public CustomerDeliveryContact fetchCustomerDeliveryContact(int id) {
		CustomerDeliveryContact deliveryContact = new CustomerDeliveryContact();
		String sql = "select id, customerId, deliveryAttention, deliveryTelephone, deliveryMobile"
				+ ", deliveryEmail, deliveryAddress1, deliveryAddress2, deliveryAddress3"
				+ ", deliveryPostcode from customerDeliveryContact where id = ?";
		RowMapper<CustomerDeliveryContact> rowMapper = new RowMapper<CustomerDeliveryContact>() {
			public CustomerDeliveryContact mapRow(ResultSet rs, int rowNum) throws SQLException {
				CustomerDeliveryContact deliveryContact = new CustomerDeliveryContact();
				deliveryContact.setId(String.valueOf(rs.getInt("id")));
				deliveryContact.setCustomerId(String.valueOf(rs.getInt("custoemrId")));
				deliveryContact.setDeliveryAttention(rs.getString("deliveryAttention"));
				deliveryContact.setDeliveryTelephone(rs.getString("deliveryTelephone"));
				deliveryContact.setDeliverylMobile(rs.getString("deliverylMobile"));
				deliveryContact.setDeliveryEmail(rs.getString("deliveryEmail"));
				deliveryContact.setDeliveryAddress1(rs.getString("deliveryAddress1"));
				deliveryContact.setDeliveryAddress2(rs.getString("deliveryAddress2"));
				deliveryContact.setDeliveryAddress3(rs.getString("deliveryAddress3"));
				deliveryContact.setDeliveryPostcode(String.valueOf(rs.getInt("deliveryPostcode")));
				return deliveryContact;
			}
		};
		try {
			deliveryContact = jdbcTemplate.queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return deliveryContact;
	}
	
	public int saveCustomerDeliveryContact(CustomerDeliveryContact deliveryContact) {
		String sql = "insert into customerDeliveryContact (customerId, deliveryAttention, deliveryTelephone, deliveryMobile, deliveryEmail"
				+ ", deliveryAddress1, deliveryAddress2, deliveryAddress3, deliveryPostcode) values (?,?,?,?,?,?,?,?,?)";
		log.debug("dao save deliveryContact sql = " + sql);
		int i = 0;
		try {
			jdbcTemplate.update(sql,null, deliveryContact.getDeliveryAttention(), deliveryContact.getDeliveryTelephone()
					, deliveryContact.getDeliverylMobile(), deliveryContact.getDeliveryEmail(), deliveryContact.getDeliveryAddress1()
					, deliveryContact.getDeliveryAddress2(), deliveryContact.getDeliveryAddress3(), deliveryContact.getDeliveryPostcode());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return i;
	}
	
	public int updateCustomerDeliveryContact(CustomerDeliveryContact deliveryContact) {
		String sql = "update customerDeliveryContact set customerId = ?, deliveryAttention = ?, deliveryTelephone = ?"
				+ ", deliveryMobile = ?, deliveryEmail = ?"
				+ ", deliveryAddress1 = ?, deliveryAddress2 = ?, deliveryAddress3 = ?, deliveryPostcode =? where id = ?";
		log.debug("dao update deliveryContact sql = " + sql);
		int i = 0;
		try {
			jdbcTemplate.update(sql, deliveryContact.getCustomerId(), deliveryContact.getDeliveryAttention(), deliveryContact.getDeliveryTelephone()
					, deliveryContact.getDeliverylMobile(), deliveryContact.getDeliveryEmail(), deliveryContact.getDeliveryAddress1()
					, deliveryContact.getDeliveryAddress2(), deliveryContact.getDeliveryAddress3(), deliveryContact.getDeliveryPostcode()
					, deliveryContact.getId());
		} catch (DataAccessException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return i;
	}
	/***************************** deliveryContact **********************************************/
	
	/************************ Other Function *********************************************/
	public int selectLastInsertId(){
		String sql = "select last_insert_id()";
		int last_inserted_id = jdbcTemplate.queryForObject(sql, Integer.class);
		return last_inserted_id;
	}
	
	protected RowMapper<Customer> customerRowMapper(ResultSet rs, int rowNum) {
		RowMapper<Customer> rowMapper = new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Customer customer = new Customer();
				customer.setId(String.valueOf(rs.getInt("id")));
				customer.setName(rs.getString("name"));
				customer.setMigrationId(rs.getString("migrationId"));
				return customer;
			}
		};
		return rowMapper;
	}
}
