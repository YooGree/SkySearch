package com.skysearch.myapp;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skysearch.myapp.component.MapParamCollector;
import com.skysearch.myapp.service.TravelService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private TravelService service;


	@RequestMapping(value = "/", method = {RequestMethod.GET})
	public ModelAndView home(@RequestParam Map<String, Object> paramMap, Locale locale, Model model, ModelAndView modelandView, Principal principal) {

		String viewName = "/home/index";
		if(principal==null) {/*서버 처음 접속시*/
		}else {/*로그인 이후 home화면*/
			paramMap.put("EMAIL", principal.getName());
		}
		
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);

        /* 추천여행지 리스트 메인 화면에 출력 */
		List<Object> resultUserCityList = new ArrayList<Object>();
		List<Object> resultNoUserCityList = new ArrayList<Object>();
		List<Object> resultAvgStarList = new ArrayList<Object>();
		resultUserCityList = (List<Object>) service.getUserCityList(paramMap); // 도시 리스트를 가져온다.(로그인시)
		resultNoUserCityList = (List<Object>) service.getNoUserCityList(paramMap); // 도시 리스트를 가져온다.(비로그인시)
		resultAvgStarList = (List<Object>) service.getAvgStarList(paramMap); // 평균 평점을 가져온다.
		
		modelandView.setViewName(viewName);
		modelandView.addObject("resultUserCityList", resultUserCityList);
		modelandView.addObject("resultAvgStarList", resultAvgStarList);
		modelandView.addObject("resultNoUserCityList", resultNoUserCityList);

		model.addAttribute("serverTime", formattedDate);
		return modelandView;
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String Login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/home/login";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public String SignUp(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/home/signup";
	}
	//--이하 에러페이지 매핑
	@RequestMapping(value = "/error404", method = { RequestMethod.GET, RequestMethod.POST })
	public String error404(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/error/not-found";
	}
	
	@RequestMapping(value = "/error500", method = { RequestMethod.GET, RequestMethod.POST })
	public String error500(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		return "/error/500errorPage";
	}
	
	@RequestMapping(value = "/forbidden403", method = { RequestMethod.GET, RequestMethod.POST })
	public String error403(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		return "/error/403forbiddenPage";
	}

}
