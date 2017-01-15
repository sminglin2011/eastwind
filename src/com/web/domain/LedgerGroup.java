package com.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class LedgerGroup implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String ledgerType;
	private String ledgerGroup;

}
