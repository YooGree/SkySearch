package com.skysearch.myapp.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skysearch.myapp.dao.ShareDao;
import com.skysearch.myapp.util.CommonUtil;

@Service
public class MemberService {

	@Autowired
	private ShareDao dao;

	@Autowired
	private CommonUtil commonUtil;

	public Object getList(Object dataMap) {
		String sqlMapId = "member.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getObject(Object dataMap) {
		
		//회원리드 
		String sqlMapId = "member.read";
		

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		
		//관심 지역 가져옴
		sqlMapId = "member.intloc";

		((Map<String, Object>) resultObject).put("LOCAL_SEQ", dao.getObject(sqlMapId, dataMap));

		return resultObject;
	}

	public Object saveObject(Map<Object, Object> paramMap) {
		String uniqueSequence = new String();
		uniqueSequence = (String) paramMap.get("MEMBER_SEQ");
	//	String password=(String)paramMap.get("PASSWORD");

		if (uniqueSequence == null) {
			uniqueSequence = commonUtil.getUniqueSequence();
			paramMap.put("MEMBER_SEQ", uniqueSequence);
		}
		paramMap.put("REGISTER_SEQ", "UUID-1111-1111111");
		paramMap.put("MODIFIER_SEQ", "UUID-1111-1111111");
	//	paramMap.put("CRYPT_PASSWORD", commonUtil.PasswordEncoderGenerator(password));
		
		String sqlMapId = "member.merge";
		Object resultKey = dao.saveObject(sqlMapId, paramMap);

		
		
		//해당 회원의 관심지역 청소
		sqlMapId = "int_local.delete";
		dao.deleteObject(sqlMapId, paramMap);
		//해당회원의 관심지역 재입력
		sqlMapId = "int_local.insert";
		dao.saveObject(sqlMapId, paramMap);
		//가입할 땐 권한 부여를 위한 if 문
		if(paramMap.get("signup").equals("true")) {
			
			sqlMapId = "authorityRmember.insert";
			dao.saveObject(sqlMapId, paramMap);
		}
		//수정한 회원 읽어오기
		sqlMapId = "member.read";

		Object resultObject = dao.getObject(sqlMapId, paramMap);

		return resultObject;
	}

	
	//위 메서드와 동일함
	public Object saveObjectAdmin(Map<Object, Object> dataMap) {
		String uniqueSequence = (String) dataMap.get("MEMBER_SEQ");

		if ("".equals(uniqueSequence)) {
			uniqueSequence = commonUtil.getUniqueSequence();
			dataMap.put("MEMBER_SEQ", uniqueSequence);
		}
		dataMap.put("REGISTER_SEQ", "UUID-1111-1111111");
		dataMap.put("MODIFIER_SEQ", "UUID-1111-1111111");

		String sqlMapId = "member.merge";

		Object resultKey = dao.saveObject(sqlMapId, dataMap);

		sqlMapId = "int_local.delete";
		dao.deleteObject(sqlMapId, dataMap);

		sqlMapId = "int_local.insert";
		dao.saveObject(sqlMapId, dataMap);

		System.out.println((int) resultKey);
		sqlMapId = "member.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}

	//비활성화 이후 회원 정보 가져오기
	public Object deleteObject(Object dataMap) {
		String sqlMapId = "member.delete";

		Integer resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);

		// get Member read
		sqlMapId = "member.read";

		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	//비활성화 이후 회원 목록 가져오기
	public Object deleteObjectAdmin(Object dataMap) {
		String sqlMapId = "member.deleteAdmin";

		Integer resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);

		// get Member List
		sqlMapId = "member.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}
	//회원 탈퇴시, 아이디 비번 확인
	public Object Find(Object dataMap) {
		String sqlMapId = "member.find1";
		Object resultObject = dao.getObject(sqlMapId, dataMap);
	    return resultObject;
	}
	// 아이디 찾기
	public Object FindId(Map<String, Object> dataMap) {
		String sqlMapId = "member.find";
		Map<Object, Object> resultMap = (Map<Object, Object>) dao.getObject(sqlMapId, dataMap);
		
		if(resultMap==null) {
			Map<Object, Object> resultMaps = new HashMap<Object, Object>();
			resultMaps.put("forwardView", "/user/forgetId");
			return resultMaps;
		}
		
		 String NAME = (String)resultMap.get("NAME");
	     String PHONE = (String)resultMap.get("PHONE");
	        
		 String name=(String)dataMap.get("name");//입력한 이름과 폰번호
		 String phone=(String)dataMap.get("phone");	         
	         
	        if(NAME.equals(name)&&PHONE.equals(phone)) {//이름, 폰번호 일치여부 확인
	             resultMap.put("forwardView", "/user/findId");
	             resultMap.put("EMAIL",(String)resultMap.get("EMAIL"));
	        }else {
	        	resultMap.put("forwardView", "/user/forgetId"); 
	         }

		return resultMap;
	}
	//비밀번호 찾기
	public Object FindPw(Map<String, Object> dataMap) {
		String sqlMapId = "member.find";
		Map<Object, Object> resultMap = (Map<Object, Object>) dao.getObject(sqlMapId, dataMap);
		
		if(resultMap==null) {
			Map<Object, Object> resultMaps = new HashMap<Object, Object>();
			resultMaps.put("forwardView", "/user/forgetPw");
			return resultMaps;
		}
		
		 String NAME = (String)resultMap.get("NAME");
	     String EMAIL = (String)resultMap.get("EMAIL");
	        
		 String name=(String)dataMap.get("name");//입력한 이름과 아이디
		 String email=(String)dataMap.get("email");	         
	         
	        if(NAME.equals(name)&&EMAIL.equals(email)) {//아이디, 이름 일치여부 확인
	             resultMap.put("forwardView", "/user/findPw");
	             resultMap.put("PASSWORD",(String)resultMap.get("PASSWORD"));
	        }else {
	        	resultMap.put("forwardView", "/user/forgetPw"); 
	         }
		return resultMap;
	}
	
	public Object checkID(Object dataMap) {
		String sqlMapId = "member.idDoubleCheck";
		Map resultObject = (Map) dao.getObject(sqlMapId, dataMap);
		
    	return resultObject;
	}
	
	//contact us insert 메서드
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
