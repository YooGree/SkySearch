<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<tiles:insertAttribute name="layout.adminheader" />
<title><tiles:getAsString name="layout.title" /></title>
</head>
<body>
     	
     	<tiles:insertAttribute name="layout.adminleft" />
     	<tiles:insertAttribute name="layout.admintop" />
		<tiles:insertAttribute name="layout.body" />
		<tiles:insertAttribute name="layout.adminfooter" />
		
</body>
</html>
