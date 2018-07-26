package com.skysearch.myapp.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skysearch.myapp.component.MapParamCollector;
import com.skysearch.myapp.service.ContactService;

@Controller
public class AboutUsController{
	private final static String MAPPING= "/aboutUs/";
	
	@Autowired
	private ContactService service;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap, @PathVariable String action,
			ModelAndView modelandView) {

		Map<Object, Object> paramMap = paramMethodMap.getMap();

		String viewName = MAPPING + action;
		String forwardView = (String) paramMap.get("forwardView") ;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
        
		if ("aboutUs".equalsIgnoreCase(action)) {
			
		} else if ("contact".equalsIgnoreCase(action)) {
		} else if ("faq".equalsIgnoreCase(action)) {
			
		} else if("sendmsg".equalsIgnoreCase(action)) {
			service.sendObject(paramMap);	
		}
		
		if(forwardView != null){
			viewName = forwardView;
		}
		
		modelandView.setViewName(viewName);
		
		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);
		
		return modelandView;
	}



}
