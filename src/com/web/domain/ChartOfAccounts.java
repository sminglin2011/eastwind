package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ChartOfAccounts implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String description;
	private int accountCode;
	private String ledgerType;
	private LedgerGroup ledgerGroup;
	private double opening;
	private String gstType;
	private double gstRate;

}
