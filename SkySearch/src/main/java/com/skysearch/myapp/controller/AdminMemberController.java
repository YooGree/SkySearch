/**
 * It's Designed For incubation Center
 * @author ohsanghun
 * @version     %I%, %G%
 * @since       1.0
 */
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
import com.skysearch.myapp.service.MemberService;

@Controller
public class AdminMemberController {
	private final static String MAPPING = "/manage/member/";

	@Autowired
	private MemberService service;

	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap, @PathVariable String action,
			ModelAndView modelandView) {
		
		
		Map<Object, Object> paramMap = paramMethodMap.getMap();
		String viewName = MAPPING + action;
		String forwardView = (String) paramMap.get("forwardView");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();

		if ("list".equalsIgnoreCase(action)) { // 회원 리스트 불러오기
			resultList = (List<Object>) service.getList(paramMap);
		}  else if ("edit".equalsIgnoreCase(action)) { //회원정보 가져오기
			resultMap = (Map<String, Object>) service.getObject(paramMap);
		} else if ("merge".equalsIgnoreCase(action)) {
			service.saveObjectAdmin(paramMap); //회원 수정
			resultList = (List<Object>) service.getList(paramMap);
		} else if ("disable".equalsIgnoreCase(action)) {
			service.deleteObjectAdmin(paramMap); //회원 비활성화
			resultList = (List<Object>) service.getList(paramMap);
			viewName = "/manage/member/list";
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