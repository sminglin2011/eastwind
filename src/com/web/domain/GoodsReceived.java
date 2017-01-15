package com.web.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class GoodsReceived implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String vendorInvoice;
	private String receivedDate;
	private String poNumber;
	private int stockId;
	private double receivedQty;
	private String receivedUom;
	private int supplierId;
	private String apNumber;
	
	//虚拟字段
	private double _purchaseQty;
	private double _laterReceivedQty;
	//页面参数
	private boolean postAccount;
	

}
