package com.skysearch.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skysearch.myapp.dao.ShareDao;
import com.skysearch.myapp.util.CommonUtil;

@Service
public class AdminTiService {

	@Autowired
	private ShareDao dao;

	@Autowired
	private CommonUtil commonUtil;

	public Object getList(Object dataMap) {
		String sqlMapId = "ti.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getCiList(Object dataMap) {
		String sqlMapId = "ti.cilist";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getObject(Object dataMap) {
		String sqlMapId = "ti.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}
	
	public Object getCiObject(Object dataMap) {
		String sqlMapId = "ti.ciread";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getFileList(Object dataMap) {
		String sqlMapId = "file.read";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}
	
	public Object filedeleteObject(Object dataMap) {
		String sqlMapId = "file.delete";

		Object resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);
		
		sqlMapId = "ti.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);
		
		sqlMapId = "ti.ciread";

		resultObject = dao.getObject(sqlMapId, dataMap);

		sqlMapId = "file.read";
		
		 resultObject = dao.getList(sqlMapId, dataMap);
		
		
		return resultObject;
	}
	
	

	public Object saveObject(Map<Object, Object> paramMap) {

		String uniqueSequence = (String) paramMap.get("TRAVEL_SEQ");

		if ("".equals(uniqueSequence)) {
			uniqueSequence = commonUtil.getUniqueSequence();
			paramMap.put("TRAVEL_SEQ", uniqueSequence);
		}

		paramMap.put("REGISTER_SEQ", "UUID-1111-1111111");
		paramMap.put("MODIFIER_SEQ", "UUID-1111-1111111");

		if (((List<Object>) paramMap.get("attachFileList")).size() > 0) {

			String sqlMapId = "file.tiupload";
			Object resultObject = dao.saveObject(sqlMapId, paramMap);

		}
		String sqlMapId = "ti.merge";
		Object resultKey = dao.saveObject(sqlMapId, paramMap);

		sqlMapId = "ti.list";

		Object resultObject = dao.getList(sqlMapId, paramMap);

		return resultObject;

	}

	public Object deleteObject(Object dataMap) {
		String sqlMapId = "file.delete";

		Object resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);

		// delete
		 sqlMapId = "ti.delete";

		resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);

		// get Ti List
		sqlMapId = "ti.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	public Object saveCity(Map<Object, Object> paramMap) {

		String uniqueSequence = (String) paramMap.get("CITY_SEQ");

		if ("".equals(uniqueSequence)) {
			uniqueSequence = commonUtil.getUniqueSequence();
			paramMap.put("CITY_SEQ", uniqueSequence);
		}

		paramMap.put("REGISTER_SEQ", "UUID-1111-1111111");
		paramMap.put("MODIFIER_SEQ", "UUID-1111-1111111");

		System.out.println(((List<Object>) paramMap.get("attachFileList")).size());
		if (((List<Object>) paramMap.get("attachFileList")).size() > 0) {

			String sqlMapId = "file.ciupload";
			Object resultObject = dao.saveObject(sqlMapId, paramMap);

		}
		String sqlMapId = "ti.citymerge";
		Object resultKey = dao.saveObject(sqlMapId, paramMap);

		sqlMapId = "ti.cilist";

		Object resultObject = dao.getList(sqlMapId, paramMap);

		return resultObject;

	}

	public Object saveCountry(Map<Object, Object> paramMap) {

		String uniqueSequence = (String) paramMap.get("COUNTRY_SEQ");

		if ("".equals(uniqueSequence)) {
			uniqueSequence = commonUtil.getUniqueSequence();
			paramMap.put("COUNTRY_SEQ", uniqueSequence);
		}

		String sqlMapId = "ti.countrymerge";	
		Object resultKey = dao.saveObject(sqlMapId, paramMap);

		sqlMapId = "ti.read";

		Object resultObject = dao.getObject(sqlMapId, paramMap);
		return resultObject;

	}
}
