package com.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    protected final Log logger = LogFactory.getLog(getClass());

    @RequestMapping(value="index.php")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        return new ModelAndView("main");
    }
}
