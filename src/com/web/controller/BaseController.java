package com.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.exception.AjaxRequestException;
import com.web.exception.BusinessException;
import com.web.exception.ParameterException;

public class BaseController  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	Logger log = Logger.getLogger(BaseController.class);

	@ExceptionHandler
	public String exp(HttpServletRequest request, HttpServletResponse res, Exception ex) throws IOException {
		log.debug("come here base controller!!!!!!!!!!!!!!!!!!!");
		request.setAttribute("exception", ex);
		if (ex instanceof BusinessException) {
			return "error-business";
		} else if(ex instanceof ParameterException) {
			return "error-parameter";
		}  else if(ex instanceof AjaxRequestException) {
			return "ajaxError";
		} else return "error";
	}
}
