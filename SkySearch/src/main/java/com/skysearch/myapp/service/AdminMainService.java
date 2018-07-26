package com.skysearch.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skysearch.myapp.dao.ShareDao;

@Service
public class AdminMainService {

	@Autowired
	private ShareDao dao;

	public Object getList(Object dataMap, String sqlMapId) {
		//String sqlMapId = "chart.memberY";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	public List<String> getListhh(Object dataMap, int sel) {
		String sqlMapId = "chart.memberT";

		List<String>resultObject = (List<String>)dao.getList(sqlMapId, dataMap);
		if(sel == 1) {
			sqlMapId = "chart.memberM";
		}else if(sel == 2) {
			sqlMapId = "chart.memberD";
		}else if(sel ==3) {
			sqlMapId = "chart.memberY";
		}
		resultObject.addAll((List<String>)dao.getList(sqlMapId, dataMap));
		
		
		
		
		return resultObject;
	}

	public Object getObject(Object dataMap) {
		String sqlMapId = "ti.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

}
