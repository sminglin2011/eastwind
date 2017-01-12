package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class PurchaseRequest implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int stockId;
	private double requestQty;
	private String requestUom;
	private int requestBy;

}
