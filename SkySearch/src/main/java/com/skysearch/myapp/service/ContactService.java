package com.skysearch.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skysearch.myapp.dao.ShareDao;
import com.skysearch.myapp.util.CommonUtil;

@Service
public class ContactService {

	@Autowired
	private ShareDao dao;

	@Autowired
	private CommonUtil commonUtil;

	
	//CONTACTUS 리스트 불러오기
	public Object getList(Object dataMap) {
		String sqlMapId = "contact.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	
	//CONTACT US 한곳의 상세 내용
	public Object getObject(Object dataMap) {
		String sqlMapId = "contact.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	
	//답변완료
	public Object deleteObject(Object dataMap) {
		String sqlMapId = "contact.complete";

		Integer resultKey = (Integer) dao.updateObject(sqlMapId, dataMap);

		// get Member List
		sqlMapId = "contact.list";
		
		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	//contactus insert 메서드
	public void sendObject(Map<Object, Object> dataMap) {
		String uniqueSequence = (String) dataMap.get("CONTACTUS_SEQ");

		if (uniqueSequence==null) {
			uniqueSequence = commonUtil.getUniqueSequence();
			dataMap.put("CONTACTUS_SEQ", uniqueSequence);
		}
		String sqlMapId = "contact.insert";
		dataMap.put("REGISTER_SEQ", "UUID-1111-1111111");
		dataMap.put("MODIFIER_SEQ", "UUID-1111-1111111");
		dao.getObject(sqlMapId, dataMap);
	}

}
