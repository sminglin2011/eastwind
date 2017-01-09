package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.User;
import com.web.service.UserService;

@Controller
public class UserController {
	
	Logger log = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;

	/**
	 * user_main for test
	 * @return
	 */
	@RequestMapping(value="/user_main.htm")
	public ModelAndView user_main() {
		log.debug("user_main");
		List list = userService.getUserList();
		Map model = new HashMap<>();
		model.put("list", list);
		model.put("keyword", "");
		return new ModelAndView("user/user_main", "model", model);
	}
	
	@RequestMapping(value="userFilterKeyword.htm")
	public ModelAndView filterKeyword(String keyword) {
		List list = userService.filterByKeyword(keyword);
		Map model = new HashMap<>();
		model.put("list", list);
		model.put("keyword", keyword);
		return new ModelAndView("user/user_main_datatable", "model", model);
	}
	
	@RequestMapping(value="/userMain.htm")
	public ModelAndView userMain() {
		log.debug("user_main_datatable");
		List list = userService.getUserList();
		Map model = new HashMap<>();
		model.put("list", list);
		model.put("keyword", "");
		return new ModelAndView("user/user_main_datatable", "model", model);
	}
	
	@RequestMapping(value="/newUser.htm")
	public ModelAndView newUser() {
		
		return new ModelAndView("user/new_user", "list", "");
	}
	
	@ResponseBody
	@RequestMapping(value="/saveNewUser.htm")
	public String saveNewUser(User user) {
		log.debug("save user controller user = " + user);
		if (user.getId() == 0) {
			userService.saveUser(user);
		} else userService.updateUser(user);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteUser.htm")
	public String deleteUser(String id) {
		log.debug("delete user controller id=" + id);
		if ( id != null) {
			userService.deleteUser(Integer.parseInt(id));
		} else {
			log.error("将删除的用户ID为null");
		}
		return "";
	}
	
	@RequestMapping(value="/editUser.htm")
	public ModelAndView editUser(String id) {
		log.debug("user controller edit id="+id);
		User user = null;
		if ( id != null) {
			user = userService.getUser(Integer.parseInt(id));
		} else {
			log.error("将删除的用户ID为null");
		}
		log.debug("user controller " + user);
		return new ModelAndView("user/edit_user", "user", user);
	}
	
}
