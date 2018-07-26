package com.skysearch.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.skysearch.myapp.service.AdminMainService;
import com.skysearch.myapp.service.AdminTiService;
import com.skysearch.myapp.service.CityService;
import com.skysearch.myapp.service.LocalService;
import com.skysearch.myapp.service.MemberService;
import com.skysearch.myapp.service.TravelService;
import com.skysearch.myapp.util.CommonUtil;

@RestController
public class RestWSController {

	@Autowired
	private CommonUtil commonUtil;
	@Autowired
	private LocalService localService;
	@Autowired
	private CityService cityService;
	@Autowired
	private TravelService travelService;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private AdminMainService adminMainService;
	@Autowired
	private AdminTiService AdminTiservice;
	
	
	@RequestMapping(value = "/ws/{action}", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {
		
		Object resultObject = new Object();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> resultList = new ArrayList<Object>();
		List<String> resultListC = new ArrayList<String>();
		
		if("localList".equalsIgnoreCase(action)) {//지역리스트 가져오기
			resultObject = (List<Object>) localService.getList(paramMap);
		} else if("memberList".equalsIgnoreCase(action)) {//마이페이지,회원정보 수정시 관심지역리스트 가져오기
			resultObject = (List<Object>) localService.getLocalList(paramMap);
		} else if("ciList".equalsIgnoreCase(action)) {
			resultObject = (List<Object>) cityService.getCiList(paramMap);
		} else if("coList".equalsIgnoreCase(action)) {
			resultObject = (List<Object>) cityService.getCoList(paramMap);
		} else if("checkLocal".equalsIgnoreCase(action)) {
			resultObject = (List<Object>) localService.getCheckLocal(paramMap);
		} else if("idcheck".equalsIgnoreCase(action)) {//아이디 중복체크
	         String id=(String) paramMap.get("EMAIL");
	         Object result = memberservice.checkID(paramMap);
	         return result;  
		} else if("fileList".equalsIgnoreCase(action)) {
			resultObject = (List< Object>) AdminTiservice.getFileList(paramMap);
		} else if("memberChartM".equalsIgnoreCase(action)) {
			resultListC =  adminMainService.getListhh(paramMap,1);
			return resultListC;
		}else if("memberChartD".equalsIgnoreCase(action)) {
			resultListC =  adminMainService.getListhh(paramMap,2);
			return resultListC;
		}else if("memberChartY".equalsIgnoreCase(action)) {
			resultListC =  adminMainService.getListhh(paramMap,3);
			return resultListC;
		}else if("memberChartV".equalsIgnoreCase(action)) {
			String sqlMapId = "chart.CityView";
			resultList =  (List<Object>) adminMainService.getList(paramMap,sqlMapId);
			return resultList;
		}else if("memberChartS".equalsIgnoreCase(action)) {
			String sqlMapId = "chart.CityStars";
			resultList =  (List<Object>) adminMainService.getList(paramMap,sqlMapId);
			return resultList;
		}
		
		
		return resultObject;
	  }

	// 국가 목록 가져오기
	@RequestMapping(value = "/ws/countyList", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public @ResponseBody Map<String, Object> Country(@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map> resultList = new ArrayList<>();
		
		resultList = (List<Map>) travelService.getSelectCountry(paramMap);
		resultMap.put("addList", resultList);

		return resultMap;
	}
	
	// 도시 목록 가져오기
	@RequestMapping(value = "/ws/cityList", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public @ResponseBody Map<String, Object> City(@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map> resultList = new ArrayList<>();
		
		resultList = (List<Map>) travelService.getSelectCity(paramMap);
		resultMap.put("addList", resultList);

		return resultMap;
	}
	
	// 댓글 입력하는 메서드
	@RequestMapping(value = "/ws/commentSet", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public void CommentSet(@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map> resultList = new ArrayList<>();
		
		paramMap.put("COMMENT_SEQ", commonUtil.getUniqueSequence());
		travelService.setComment(paramMap);
	}
	
	// 댓글 수정하는 메서드
	@RequestMapping(value = "/ws/commentMod", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public void CommentMod(@RequestParam Map<String, Object> paramMap) {
		
		travelService.modComment(paramMap);
	}
	
	// 댓글 삭제하는 메서드
	@RequestMapping(value = "/ws/commentDel", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public void CommentDel(@RequestParam Map<String, Object> paramMap) {
		
		travelService.delComment(paramMap);
	}
	
}

