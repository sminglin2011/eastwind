package com.web.domain;

import java.io.Serializable;

import lombok.Data;
@Data
public class Supplier implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	private String terms;
	private Integer accountCode;

}
