package com.skysearch.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skysearch.myapp.dao.ShareDao;


@Service
public class LocalService {

	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "local.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	public Object getCheckLocal(Object dataMap) {
		String sqlMapId = "local.check";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	public Object getLocalList(Object dataMap) {
		String sqlMapId = "local.localList";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
}
