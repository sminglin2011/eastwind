package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class AccountPayable implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String apNumber;
	private int supplierId;
	private int stockId;
	private double quantity;
	private String uom;
	private double unitPrice;
	private int goodReceivedId;
	private String gstType;
	private double gstRate;

	
}
