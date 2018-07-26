package com.skysearch.myapp.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedCaseInsensitiveMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
 * 크롤링 서비스
  * @author 이민정
  * @since 2018-07-11
 *
 */
@Service
public class CrawlService {

	/**
	 * 크롤링 메소드 호출
	 * @param dataMap
	 * @return List
	 */
	public Object getListMIT(Map<String, Object> dataMap) {
		List<Object> resultObject = new ArrayList<Object>();

		resultObject.add(getAsiana());
		resultObject.add(getJejuair());
		resultObject.add(getTway());

		return resultObject;
	}

	/**
	 * Asiana crawling
	 * @return list
	 */
	public List getAsiana() {
		List resultList = new ArrayList<>();

		try {
			Document doc;
			Map<String, Object> resultMap;

			//사이트와 연결
			doc = Jsoup.connect("https://flyasiana.com/C/KR/KO/event/index?menuId=CM201802220000728482").get();

			//li태그인 element 다 가져오기
			Elements questions = doc.select("li");
			
			//a태그인 element 가져오기
			Elements question = questions.select("a");

			for (Element e : question) {
				resultMap = new HashMap<String, Object>();

				//class명이 inner_box이면
				if (e.attr("class").contains("inner_box")) {
					//타이틀에 특가가 포함된 element이면
					if (e.text().contains("특가") || e.text().contains("프로모션")) {
						//url 만들기
						StringBuffer sb = new StringBuffer();
						sb.append("https://flyasiana.com/C/KR/KO/event");
						sb.append(e.getElementsByAttribute("href").attr("href").substring(1));

						//hashmap에 put(key,value)
						resultMap.put("img", e.getElementsByAttribute("src").attr("src"));
						resultMap.put("title", e.select("em").text());
						resultMap.put("period", e.select("span.date").text());
						resultMap.put("url", sb);
						resultMap.put("alt", e.getElementsByAttribute("alt").attr("alt"));
						resultMap.put("flight", "아시아나항공");

						resultList.add(resultMap);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return resultList;
	}

	/**
	 * Jeju air crawling
	 * @return list
	 */
	public List getJejuair() {
		List resultList = new ArrayList<>();

		try {
			Document doc;
			Map<String, Object> resultMap;

			//사이트와 연결
			doc = Jsoup.connect(
					"https://www.jejuair.net/jejuair/kr/com/jeju/ibe/news/event/event_list.do?page=1&event_id=&nSearch=&condition=content&search=")
					.get();

			//li태그인 element 추리기
			Elements questions = doc.select("li");
			//div인 element 추리기
			Elements question = questions.select("div");

			for (Element e : question) {
				//element class명이 item이면
				if (e.attr("class").contains("item")) {
					//element가 프로모션, 특가를 포함하면
					if (e.text().contains("프로모션") || e.text().contains("특가") ||e.text().contains("여행") ||e.text().contains("월") ) {

						resultMap = new HashMap<>();
						resultMap.put("title", e.select("span.subject").text());
						resultMap.put("period", e.select("span.date").text());
						resultMap.put("img", e.getElementsByAttribute("src").attr("src"));
						resultMap.put("alt", e.getElementsByAttribute("alt").attr("alt"));
						resultMap.put("flight", "제주항공");

						//url 조립
						StringTokenizer tok = new StringTokenizer(e.getElementsByAttribute("href").attr("href"),
								"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ(' ):,;");

						int[] array = new int[2];
						int a = 0;

						while (tok.hasMoreTokens()) {
							array[a] = Integer.parseInt(tok.nextToken());
							a++;

						}

						StringBuffer sb = new StringBuffer();
						sb.append("https://www.jejuair.net/jejuair/kr/com/jeju/ibe/news/event/event_detail.do?page=");
						sb.append(array[0]);
						sb.append("&event_id=");
						sb.append(array[1]);
						sb.append("&nSearch=%ED%8A%B9%EA%B0%80&condition=mix&search=%ED%8A%B9%EA%B0%80");
						resultMap.put("url", sb);

						resultList.add(resultMap);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return resultList;
	}



	/**
	 * tway crawling
	 * @return list
	 */
	public List getTway() {

		List resultList = new ArrayList<>();

		try {
			Document doc;
			Map<String, Object> resultMap;

			//사이트와 연결
			doc = Jsoup.connect("https://www.twayair.com/together/event/listEventsInProgress.do").get();

			//div 클래스명이 eventList인 element 가져오기
			Elements questions = doc.select("div.eventList");
			//a태그 element 가져오기
			Elements question = questions.select("a");

			for (Element e : question) {
				//프로모션 특가 예약인 키워드가 포함된 element이면
				if (e.text().contains("프로모션") || e.text().contains("특가") || e.text().contains("예약")
						|| e.text().contains("여행")) {
					resultMap = new HashMap<>();

					//resultMap에 put
					resultMap.put("title", e.select("h4").text());
					resultMap.put("period", e.select("p.mt5").text());
					resultMap.put("img", e.getElementsByAttribute("src").attr("src"));
					resultMap.put("alt", e.getElementsByAttribute("alt").attr("alt"));
					resultMap.put("flight", "티웨이");
					resultMap.put("url",
							"https://www.twayair.com/together/event/" + e.getElementsByAttribute("href").attr("href"));

					resultList.add(resultMap);
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return resultList;
	}


	
	

}
