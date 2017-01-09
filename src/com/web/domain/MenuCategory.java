package com.web.domain;

import lombok.Data;

@Data
public class MenuCategory {

	private int id;
	private String menuCategoryName;
	private boolean onlineShow; //0 false, 1 true
}
