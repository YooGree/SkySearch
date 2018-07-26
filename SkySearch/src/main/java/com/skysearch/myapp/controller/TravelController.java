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

import com.skysearch.myapp.service.TravelService;


@Controller
public class TravelController {
	private final static String MAPPING = "/tripInfo/";
	
	@Autowired
	private TravelService service;
	
	@RequestMapping(value = MAPPING+"{action}", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action, ModelAndView modelandView) {

		String viewName = MAPPING + action ; 
		
		// 여행정보 메인화면
		if ("main".equalsIgnoreCase(action)) {
			
			List<Object> resultUserCityList = new ArrayList<Object>();
			List<Object> resultNoUserCityList = new ArrayList<Object>();
			List<Object> resultAvgStarList = new ArrayList<Object>();
			Map<String, Object> resultCityPaginationMap = new HashMap<String, Object>();
			
			resultUserCityList = (List<Object>) service.getUserCityList(paramMap); // 도시 리스트를 가져온다.(로그인시)
			resultNoUserCityList = (List<Object>) service.getNoUserCityList(paramMap); // 도시 리스트를 가져온다.(비로그인시)
			resultAvgStarList = (List<Object>) service.getAvgStarList(paramMap); // 평균 평점을 가져온다.
			resultCityPaginationMap = (Map<String, Object>) service.getCityListPagination(paramMap); // 전체 도시 리스트를 페이지네이션 한다.
			
			modelandView.setViewName(viewName);
			modelandView.addObject("resultUserCityList", resultUserCityList);
			modelandView.addObject("resultNoUserCityList", resultNoUserCityList);
			modelandView.addObject("resultAvgStarList", resultAvgStarList);
			modelandView.addObject("resultCityPaginationMap", resultCityPaginationMap);
		
		// 여행정보 리드화면
		} else if ("read".equalsIgnoreCase(action)) {
			
			Map<String, Object> resultCityMap = new HashMap<String, Object>();
			Map<String, Object> resultMemberMap = new HashMap<String, Object>();
			Map<String, Object> resultCommentPaginationMap = new HashMap<String, Object>();
			List<Object> resultLandmarkList = new ArrayList<Object>();
			
			resultCityMap = (Map<String, Object>) service.getCityInfo(paramMap); // 도시 상세 정보를 뿌려줄 정보를 가져온다.
			resultMemberMap = (Map<String, Object>) service.getMemberSeq(paramMap); // 멤버시퀀스를 가져온다.
			resultCommentPaginationMap = (Map<String, Object>) service.getCommentListPagination(paramMap); // 댓글을 모두 불러오는데 5개단위로 된 페이지로 불러온다.
			resultLandmarkList = (List<Object>) service.getLandmarkList(paramMap); // 관광지 리스트를 가져온다.
			
			modelandView.setViewName(viewName);
			modelandView.addObject("resultCityMap", resultCityMap);
			modelandView.addObject("resultMemberMap", resultMemberMap);
			modelandView.addObject("resultCommentPaginationMap", resultCommentPaginationMap);	
			modelandView.addObject("resultLandmarkList", resultLandmarkList);
			
		// 여행정보 댓글 수정 팝업	
		} else if ("popup".equalsIgnoreCase(action)) {
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
	
			resultMap = (Map<String, Object>) service.modCommentSet(paramMap); // 수정버튼을 클릭했을 때 기존 댓글을 모달창으로 가져온다.
			
			modelandView.addObject("resultMap", resultMap);
			modelandView.setViewName("tripInfo/popup");
			
		} 
		
		modelandView.addObject("paramMap", paramMap);
		
		return modelandView;
	}
}