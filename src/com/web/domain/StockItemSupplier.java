package com.web.domain;

import java.io.Serializable;

import lombok.Data;
@Data
public class StockItemSupplier implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int stockId;
	private String stockDescription;
	private int supplierId;
	private String supplierName;
	private double price;
	private String uom;
	private boolean isdefault;

}
