package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.domain.User;

@Repository
public class UserDao {

Logger log = Logger.getLogger(UserDao.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	
	public List fetchUserList() throws Exception {
		List list = null;
		String sql = "select id, username, email, password from user";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	

	public void saveUser(User user) throws Exception {
		String sql = "insert into user (username, email, password) values (?, ?, ?)";
		jdbcTemplate.update(sql, user.getUsername(), user.getEmail(), user.getPassword());
	}
	
	public void updateUser(User user) throws Exception {
		String sql = "update user set username=?, email=?, password=? where id = ?";
		jdbcTemplate.update(sql, user.getUsername(), user.getEmail(), user.getPassword(), user.getId());
	}
	
	public void deleteUser(int id) throws Exception {
		String sql = "delete from user where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	public User fetchUser(int id) throws Exception {
		User user = null;
		String sql = "select id, username, email, password from user where id = ?";
		RowMapper<User> rowMapper = new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setEmail(rs.getString("email"));
				user.setId(rs.getInt("id"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				return user;
			}
		};
		user = jdbcTemplate.queryForObject(sql, rowMapper, id);
		
		return user;
	}
	
	public List fetchUserListByKeyword(String keyword) throws Exception {
		List list = null;
		String sql = "select id, username, email, password from user where username like '%"+keyword+"%' or email like '%"+keyword+"%' ";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
}
