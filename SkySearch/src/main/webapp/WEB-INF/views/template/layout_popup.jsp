<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    </div>
	    
	    <div class="modal-body">
			<tiles:insertAttribute name="layout.body" />
	    </div>
	</div>
	<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
