package com.web.domain;

import lombok.Data;

@Data
public class Menu {
	
	private int id;
	private int menuCategoryId;
	private String menuCategoryName;
	private String menuName;
	private double price;
	private int minPax;
	private int kitchenTime;
	private int deliveryTime;
	private int collectionTime;
	private int multipleDelivery; // 1 delivery 1 time, 2 delivery 2 time .....
	private boolean onlineShow;

}
