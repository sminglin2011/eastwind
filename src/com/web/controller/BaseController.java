package com.web.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ExceptionHandler;

import com.web.exception.BusinessException;
import com.web.exception.ParameterException;

public class BaseController  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ExceptionHandler
	public String exp(HttpServletRequest request, Exception ex) {
		request.setAttribute("exception", ex);
		if (ex instanceof BusinessException) {
			return "error-business";
		} else if(ex instanceof ParameterException) {
			return "error-parameter";
		} else return "error";
	}
}
