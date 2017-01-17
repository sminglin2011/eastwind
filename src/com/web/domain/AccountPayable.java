package com.web.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AccountPayable implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String apNumber;
	private String date;
	private String payType;
	private String terms;
	private int supplierId;
	private Supplier supplier;
	private String supplierName;
	private int goodsReceivedId;
	private GoodsReceived goodsReceived;
	private List<AccountPayableItem> items;
	
}
