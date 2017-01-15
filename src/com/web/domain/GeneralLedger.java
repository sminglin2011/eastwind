package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class GeneralLedger implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String accountType;
	private String ledgerType;
	private int ledgerCode;
	private int endCode;

}
