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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skysearch.myapp.component.MapParamCollector;
import com.skysearch.myapp.service.AdminTiService;
import com.skysearch.myapp.service.MemberService;



@Controller
public class AdminTiController {
	private final static String MAPPING = "/manage/ti/";
	
	@Autowired
	private AdminTiService service;
	
	@RequestMapping(value = MAPPING+"{action}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView actionMethod(MapParamCollector paramMethodMap, @PathVariable String action,
			ModelAndView modelandView) {
		
		Map<Object,Object> paramMap = paramMethodMap.getMap();
		
		String viewName = MAPPING + action ;
		String forwardView = (String) paramMap.get("forwardView") ;

		Map<Object, Object> resultMap = new HashMap<Object, Object>() ;
		Map<Object, Object> resultMap2 = new HashMap<Object, Object>() ;
		List<Object> resultList = new ArrayList<Object>();

		// divided depending on action value
		if ("ti_list".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getList(paramMap);
		} else if ("ti_read".equalsIgnoreCase(action)) {
			resultMap = (Map<Object, Object>) service.getObject(paramMap);
		} else if ("ti_edit".equalsIgnoreCase(action)) {
			resultMap = (Map<Object, Object>) service.getObject(paramMap);
			resultList = (List< Object>) service.getFileList(paramMap);
		} else if ("ti_city".equalsIgnoreCase(action)) {
			resultMap = (Map<Object, Object>) service.getCiObject(paramMap);
			resultList = (List< Object>) service.getFileList(paramMap);
		} else if ("merge".equalsIgnoreCase(action)) {
			service.saveObject(paramMap);
			resultList = (List<Object>) service.getList(paramMap);
		}  else if ("citymerge".equalsIgnoreCase(action)) {
			service.saveCity(paramMap);
			resultList = (List<Object>) service.getCiList(paramMap);
		} else if ("countrymerge".equalsIgnoreCase(action)) {
			service.saveCountry(paramMap);
			resultList = (List<Object>) service.getCiList(paramMap);
		} else if ("delete".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.deleteObject(paramMap);
		} else if ("ti_cilist".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getCiList(paramMap);
		}else if ("file_delete".equalsIgnoreCase(action)) {
			resultMap = (Map<Object, Object>) service.getObject(paramMap);
			resultList = (List<Object>) service.filedeleteObject(paramMap);
		}else if ("file_cidelete".equalsIgnoreCase(action)) {
			resultMap = (Map<Object, Object>) service.getCiObject(paramMap);
			resultList = (List<Object>) service.filedeleteObject(paramMap);
		}else if ("sample".equalsIgnoreCase(action)) {
			
		}
			/*else if ("update".equalsIgnoreCase(action)) {
		}
			resultMap = (Map<String, Object>) service.getObject(paramMap);
			paramMap.put("action", action);
		} else if ("merge".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.saveObject(paramMap);
		} else if ("read".equalsIgnoreCase(action)) {
			resultMap = (Map<String, Object>) service.getObject(paramMap);
		} else if ("list".equalsIgnoreCase(action)) {
			resultList = (List<Object>) service.getList(paramMap);
		}  */
		
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