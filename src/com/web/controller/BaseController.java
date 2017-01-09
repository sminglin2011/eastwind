package com.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ExceptionHandler;

import com.web.exception.BusinessException;
import com.web.exception.ParameterException;

public class BaseController {

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
