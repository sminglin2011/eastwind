package com.web.domain;

import lombok.Data;

@Data
public class StockItem {

	private int id;
	private String description;
	private String description1;
	private String unitMs;
	private double avgUnitPrice;
	private int categoryId;
	
}
