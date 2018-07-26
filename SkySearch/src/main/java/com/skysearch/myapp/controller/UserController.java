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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skysearch.myapp.service.MemberService;

@Controller
public class UserController {
	private final static String MAPPING = "/user/";

	@Autowired
	private MemberService service;

	@RequestMapping(value = MAPPING + "{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action,
			ModelAndView modelandView) {

		String viewName = MAPPING + action;
		String forwardView = (String) paramMap.get("forwardView");

		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		List<Object> resultList = new ArrayList<Object>();

	//아이디,비밀번호찾기 페이지
		if ("forgetIdPw".equalsIgnoreCase(action)) {
	//비밀번호 찾기 실패시
		} else if ("forgetId".equalsIgnoreCase(action)) {
	//아이디 찾기 실패시
		} else if ("forgetPw".equalsIgnoreCase(action)) {
	//아이디 찾기
		}else if("idFind".equalsIgnoreCase(action)) {
	        resultMap = (Map<Object, Object>) service.FindId(paramMap);
	        forwardView=(String) resultMap.get("forwardView");
	 //비밀번호 찾기
		}else if("pwFind".equalsIgnoreCase(action)) {
	         resultMap = (Map<Object, Object>) service.FindPw(paramMap);
	         forwardView=(String) resultMap.get("forwardView");
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
