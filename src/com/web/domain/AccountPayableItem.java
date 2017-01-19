package com.web.domain;

import java.io.Serializable;

import com.web.util.DataFormat;

import lombok.Data;

@Data
public class AccountPayableItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String apNumber;
	private int supplierId;
	private Supplier supplier;
	private String supplierName;
	private int stockId;
	private StockItem stockItem;
	private String description;
	private String remarks;
	private double quantity;
	private String uom;
	private double unitPrice;
	private int goodsReceivedId;
	private GoodsReceived goodsReceived;
	private String gstType;
	private double gstRate;
	private int purchaseOrderId;
	private PurchaseOrder purchaseOrder;
	private int accountCode;
	
	public boolean isNull() {
		if(DataFormat.isNull(this.description)
				&& DataFormat.isNull(this.remarks)
				&& this.accountCode == 0
				&& this.quantity == 0
				&& this.unitPrice == 0
				&& DataFormat.isNull(this.uom)) {
			return true;
		}
		return false;
	}
}
