package com.web.domain;

import lombok.Data;

@Data
public class Customer {

	private int id;
	private String name;
	private String migrationId;
	
	private CustomerBillContact billContact;
	private CustomerDeliveryContact deliveryContact;
}
