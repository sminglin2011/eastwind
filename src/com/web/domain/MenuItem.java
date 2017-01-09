package com.web.domain;

import lombok.Data;

@Data
public class MenuItem {

	private int id;
	private int menuId;
	private String menuName;
	private int menuItemGroupId;
	private String menuItemGroupName;
	private int stockId;
	private String onlineName;
}
