package com.skysearch.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skysearch.myapp.component.MapParamCollector;
import com.skysearch.myapp.service.ContactService;

@Controller
public class AdminContactController {
	private final static String MAPPING = "/manage/contact/";

	@Autowired
	private ContactService service;

	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap, @PathVariable String action,
			ModelAndView modelandView) {

		Map<Object, Object> paramMap = paramMethodMap.getMap();
		String viewName = MAPPING + action;
		String forwardView = (String) paramMap.get("forwardView");

		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		//리스트 불러오기
		if ("list".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getList(paramMap);
		} else if ("read".equalsIgnoreCase(action)) { //의문사항 리드
			resultMap = (Map<Object, Object>) service.getObject(paramMap);
		} else if ("edit".equalsIgnoreCase(action)) {//수정
			resultMap = (Map<Object, Object>) service.getObject(paramMap);
		}  else if ("disable".equalsIgnoreCase(action)) {// 비활성화 ( 답변 완료 )
			resultList = (List<Object>)service.deleteObject(paramMap);
			viewName="/manage/main/index";//뷰네임 지정
		} 
		if (forwardView != null) {
			viewName = forwardView;
		}

		modelandView.setViewName(viewName);

		modelandView.addObject("paramMap", paramMap);
		modelandView.addObject("resultMap", resultMap);
		modelandView.addObject("resultList", resultList);

		return modelandView;
	}
}
