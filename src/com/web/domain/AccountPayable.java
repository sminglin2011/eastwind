package com.web.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class AccountPayable implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String apNumber;
	private Date date;
	private String payType;
	private String terms;
	private Supplier supplier;
	private GoodsReceived goodsReceived;
	
}
