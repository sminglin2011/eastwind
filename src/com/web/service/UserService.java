package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.web.Dao.UserDao;
import com.web.domain.User;
import com.web.exception.ParameterException;

@Service
public class UserService {

	Logger log = Logger.getLogger(UserService.class);
	
	@Autowired
	private UserDao userDao;
	
	private Map<String, Object> map = new HashMap<>();
	
	public List loadUserList() throws Exception {
		return userDao.fetchUserList();
	}
	@Transactional
	public void saveUser(User user) throws Exception {
		userDao.saveUser(user);
	}
	@Transactional
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	@Transactional
	public void deleteUser(int id) throws Exception {
		userDao.deleteUser(id);
	}
	
	public User loadUser(int id) throws Exception {
		return userDao.fetchUser(id);
	}
	
	
	/***************************** Business function for controller ***********************************/
	
	public ModelMap goToUserMain(ModelMap model) throws Exception {
		List list = loadUserList();
		model.put("list", list);
		model.put("keyword", "");
		return model;
	}
	
	public ModelMap filterByKeyword(ModelMap model, String keyword) throws Exception {
		List list = userDao.fetchUserListByKeyword(keyword);
		model.put("list", list);
		model.put("keyword", "");
		return model;
	}
	
	public Map<String, Object> saveUser(ModelMap model, User user) throws Exception {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			if (user.getId() == 0) {
				saveUser(user);
			} else {
				updateUser(user);
			}
		} catch (DataAccessException e) {
			map.put("status", "n");
			map.put("msg", e.getMessage());
			throw e;
		}
		return map;
	}
	
	public Map<String, Object> deleteUser(ModelMap model, String id) throws Exception {
		map.put("status", "y");
		map.put("msg", "success");
		try {
			deleteUser(Integer.parseInt(id));
		} catch (DataAccessException e) {
			map.put("status", "n");
			map.put("msg", e.getMessage());
			throw e;
		} catch (ParameterException e) {
			map.put("status", "n");
			map.put("msg", e.getMessage());
			throw e;
		}
		return map;
	}
	
	public ModelMap loadUser(ModelMap model, String id) throws Exception {
		User user = null;
		try {
			user = loadUser(Integer.parseInt(id));
			model.put("user", user);
		} catch (Exception e) {
			throw e;
		}
		return model;
	}
}
