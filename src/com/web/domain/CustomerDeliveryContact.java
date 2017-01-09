package com.web.domain;

import lombok.Data;

@Data
public class CustomerDeliveryContact {

	private int id;
	private int customerId;
	private String customerName;
	private String deliveryAttention;
	private String deliveryTelephone;
	private String deliverylMobile;
	private String deliveryEmail;
	private String deliveryAddress1;
	private String deliveryAddress2;
	private String deliveryAddress3;
	private int deliveryPostcode;
}
