<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link type="text/css" href="<c:url value='/resources/css/mainmc.css'/>"
	rel="stylesheet" />


<!-- 관심지역 다중 클릭 체크박스 -->
<script>
<%--관심지역 다중 클릭 체크 박스를 위한 부분--%>
	var fn_setFormTagCheckbox = function(url, id, params) {
		$
				.ajax({
					type : "POST",
					url : url,
					data : params,
					cache : false,
					success : function(data) {
						var formTag = "";
						var checkitem = "${resultMap.LOCAL_SEQ}";
						if ("${resultMap.LOCAL_SEQ}" == "") {
							$
									.each(
											data,
											function(i, item) {
												if(item.LOCAL_SEQ=="dummy_loc"){
													return true;
												}
												formTag += "<label class='checkbox-inline'>";
												formTag += '<input type=checkbox name="LOCAL_SEQ" value="'+item.LOCAL_SEQ+'">'
														+ item.LOCAL_NAME;
												formTag += '</label> ';
											});

						} else {
							$
									.each(
											data,											function(i, item) {
												<%-- 더미를 가져 왔을 때 넘어가기 위한 IF 문 --%>
												if(item.LOCAL_SEQ=="dummy_loc"){
													return true;<%--CONTINUE 와 동일한 기능을 수행--%> 
												}
												if(checkitem.indexOf(item.LOCAL_SEQ)!=-1){	
												formTag += "<label class='checkbox-inline'>";
												formTag += '<input type=checkbox checked="checked" name="LOCAL_SEQ" value="'+item.LOCAL_SEQ+'">'
														+ item.LOCAL_NAME;
												formTag += '</label> ';
											}else{
												formTag += "<label class='checkbox-inline'>";
												formTag += '<input type=checkbox name="LOCAL_SEQ" value="'+item.LOCAL_SEQ+'">'
														+ item.LOCAL_NAME;
												formTag += '</label> ';
											}
											});
							
						}
							$('#' + id).html(formTag);
					},
					error : function(xhr, status, exception) {
						alert("Failure \n (" + status + ")");
						return false;
					}
				});
	}

	$(document).ready(function() {
		fn_setFormTagCheckbox("<c:url value='/ws/localList' />", "localDIV");

	});
</script>


<!-- Inner Header -->

<!--  END mypage tab -->

<!-- 회원정보수정 -->
<!-- DB로부터 회원 시퀀스에 해당하는 회원 정보를 가져와서 수정(edit), 회원번호, 아이디, 이름 변경 불가-->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 mx-auto">
				<form role="form" method="POST"
					action="<c:url value='/manage/member/merge' />"> <%--컨트롤러로 가기위한 정보를 담아 감--%>
					<input type="hidden" name="forwardView" value="/manage/member/list" /> <%--앞으로 보여주는 페이지--%>
					<input type="hidden" name="MEMBER_SEQ" value="${resultMap.MEMBER_SEQ }" /> <%--멤버 시퀀스 정보를 보내기 위한 INPUT--%>
					<input type="hidden" name="signup" value="false" /> <%--가입은 매니저에서 안하기에--%>
						
					<div class="card padding-card">
						<div class="card-body">
							<h4 class="card-title mb-4">회원정보 수정</h4>
							<p>회원 정보를 입력하세요</p>
							<div class="form-group">
								<label>Member ID :</label>
								 <input type="EMAIL"	class="form-control" name="EMAIL" value="${resultMap.EMAIL}"
									>
							</div>
							<div class="form-group">
								<label>Name :</label> <input type="text" class="form-control"
									name="NAME" value="${resultMap.NAME}" >
							</div>
							<div class="form-group">
								<label>PASSWORD :</label> <input type="password"
									class="form-control" name="PASSWORD"
									value="${resultMap.PASSWORD}" >
							</div>
							<div class="form-group">
								<label>Phone :</label> <input type="text" class="form-control"
									name="PHONE" value="${resultMap.PHONE}">
							</div>
							<div class="form-group">
								<label> INTEREST LOCATION : </label>
								<p>관심 지역을 1곳 이상 선택하세요</p>
								<div id=localDIV>
								</div>
								<label class='checkbox-inline'>
								<input type=checkbox checked="checked" name="LOCAL_SEQ" style="opacity:0;" value="dummy_loc"> <%--관심지역을 할 떈 항상 복수를 사용하기 위해서 더미를 넣음--%>
								</label>
							</div>

							<br>
							<div align="center">
								<button type="submit" class="btn btn-success">EDIT</button>
								<button type="reset" class="btn btn-default">RESET</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- End 회원정보수정 -->

