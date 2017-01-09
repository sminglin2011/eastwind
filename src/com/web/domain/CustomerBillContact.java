package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class CustomerBillContact implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String customerId;
	private String customerName;
	private String billAttention;
	private String billTelephone;
	private String billMobile;
	private String billFax;
	private String billEmail;
	private String billAddress1;
	private String billAddress2;
	private String billAddress3;
	private String billPostcode;
}
