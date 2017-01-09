package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Customer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String migrationId;
	
	private CustomerBillContact billContact;
	private CustomerDeliveryContact deliveryContact;
}
