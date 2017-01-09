package com.web.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.UserDao;
import com.web.domain.User;

@Service
public class UserService {

	Logger log = Logger.getLogger(UserService.class);
	
	@Autowired
	private UserDao userDao;
	
	public List getUserList() {
		return userDao.fetchUserList();
	}
	@Transactional
	public void saveUser(User user) {
		userDao.saveUser(user);
	}
	@Transactional
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	@Transactional
	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}
	
	public User getUser(int id) {
		User user = null;
		user = userDao.fetchUser(id);
		return user;
	}
	
	public List filterByKeyword(String keyword) {
		return userDao.fetchUserListByKeyword(keyword);
	}
}
