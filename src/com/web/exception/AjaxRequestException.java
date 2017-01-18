package com.web.exception;

public class AjaxRequestException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String code;
	
	public AjaxRequestException() {
		super();
	}
	
	public AjaxRequestException(String message) {
		super(message);
	}
	
	public AjaxRequestException(String message, String code) {
		super(message);
		this.code = code;
	}
	
	public AjaxRequestException(Throwable cause) {
		super(cause);
	}
	
	public AjaxRequestException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public AjaxRequestException(String message, Throwable cause, String code) {
		super(message, cause);
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
}
