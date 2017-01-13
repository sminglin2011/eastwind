package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class PurchaseOrderItems implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String _poNumber;
	private int stockId;
	private String itemDescription;
	private int prId;
	private double purchaseQty;
	private String purchaseUom;
	private double requestQty;
	private String requestUom;
	private int supplierId;
	private double price;

}
