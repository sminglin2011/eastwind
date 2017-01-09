package com.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.TestService;

@Controller
public class TestController {
	
	Logger log = Logger.getLogger(TestController.class);
	
	@Autowired
	private TestService testSrvice;

	@ResponseBody
	@RequestMapping(value="/testList.htm")
	public String returnJsp(String name) {
//		JSONObject json = new JSONObject();
//		Map<String, String> map = new HashMap<>();
//		map.put("username", "user1");
//		List list = new ArrayList<>();
//		list.a
		List list = testSrvice.getList();
		//JSONArray jarray = new JSONArray();
		log.debug(list);
		//testSrvice.saveTest();
		return "index";
	}
}
