package com.web.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class PurchaseOrder implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String poNumber;
	private Date date;
	private int preparedby;

}