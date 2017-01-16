package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class AccountPayableItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String apNumber;
	private Supplier supplier;
	private StockItem stockItem;
	private double quantity;
	private String uom;
	private double unitPrice;
	private GoodsReceived goodsReceived;
	private String gstType;
	private double gstRate;
	private PurchaseOrder purchaseOrder;
	
	
}
