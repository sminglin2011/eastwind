package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class CustomerDeliveryContact implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String customerId;
	private String customerName;
	private String deliveryAttention;
	private String deliveryTelephone;
	private String deliverylMobile;
	private String deliveryEmail;
	private String deliveryAddress1;
	private String deliveryAddress2;
	private String deliveryAddress3;
	private String deliveryPostcode;
}
