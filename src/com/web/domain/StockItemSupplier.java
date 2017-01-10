package com.web.domain;

import java.io.Serializable;

import lombok.Data;
@Data
public class StockItemSupplier implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer stockId;
	private String stockDescription;
	private Integer supplierId;
	private String supplierName;
	private double price;
	private boolean isdefault;

}
