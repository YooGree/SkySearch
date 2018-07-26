package com.skysearch.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skysearch.myapp.dao.ShareDao;


@Service
public class CityService {

	@Autowired
	private ShareDao dao;
	
	public Object getCiList(Object dataMap) {
		String sqlMapId = "city.cilist";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
	
   public Object getCoList(Object dataMap) {
      String sqlMapId = "city.colist";

      Object resultObject = dao.getList(sqlMapId, dataMap);
      
      return resultObject;
   }
   
   public Object getLocalList(Object dataMap) {
      String sqlMapId = "city.cityList";

      Object resultObject = dao.getList(sqlMapId, dataMap);
      
      return resultObject;
   }
}
