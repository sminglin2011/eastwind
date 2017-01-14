package com.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.User;
import com.web.service.UserService;

@Controller
public class UserController {
	
	Logger log = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	//封装jsonView 格式{status:y, msg:''}
	private Map<String, Object> map = new HashMap<>();

	@RequestMapping(value="userFilterKeyword.htm")
	public ModelAndView filterKeyword(ModelMap model, String keyword) throws Exception {
		model = userService.filterByKeyword(model, keyword);
		return new ModelAndView("user/user_main_datatable");
	}
	
	@RequestMapping(value="/userMain.htm")
	public ModelAndView userMain(ModelMap model) throws Exception {
		log.debug("user_main_datatable");
		model = userService.goToUserMain(model);
		return new ModelAndView("user/user_main_datatable");
	}
	
	@RequestMapping(value="/newUser.htm")
	public ModelAndView newUser() {
		return new ModelAndView("user/new_user");
	}
	
	@ResponseBody
	@RequestMapping(value="/saveNewUser.htm")
	public Object saveNewUser(ModelMap model, @RequestBody User user, HttpServletResponse res) throws Exception {
		log.debug("save user controller user = " + user);
		map = userService.saveUser(model, user);
		return com.web.views.JsonView.Render(map, res);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteUser.htm")
	public Object deleteUser(ModelMap model, @RequestParam(value="param")String param
			, HttpServletResponse res) throws Exception {
		log.debug("delete user controller id=" + param);
		map = userService.deleteUser(model, param);
		return com.web.views.JsonView.Render(map, res);
	}
	
	@RequestMapping(value="/editUser.htm")
	public ModelAndView editUser(ModelMap model, String id) throws Exception {
		log.debug("user controller edit id="+id);
		model = userService.loadUser(model, id);
		return new ModelAndView("user/edit_user");
	}
	
}
