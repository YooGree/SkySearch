<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- 관심지역 다중 클릭 체크박스 -->
<%-- int_loc 테이블로부터 회원 seq에 해당하는 local_seq의 정보를 가져와서 체크박스에 체크됨(표시는 local_name으로)  --%>

<script>
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
												if(item.LOCAL_SEQ=="dummy_loc"){ <%-- 더미를 가져 왔을 때 넘어가기 위한 IF 문 --%>
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
											data,
											function(i, item) {
												if(item.LOCAL_SEQ=="dummy_loc"){
													return true;
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
<section class="section-padding bg-dark inner-header1">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1 class="mt-0 mb-3 text-white">My Page</h1>
				<div class="breadcrumbs">
					<p class="mb-0 text-white">
						<a class="text-white" href="#">My Page</a> / <span
							class="text-success">회원정보 수정</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Inner Header -->

<!--  mypage tab -->
<section class="tab-view">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="nav justify-content-center">
				<c:set var="principalName" value="${pageContext.request.userPrincipal.name}" /> 
                     <li class="nav-item">
                       <a class="nav-link" href="<c:url value='/mypage/read?EMAIL=${principalName}'/>">내 정보</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link active text-success" href="<c:url value='/mypage/edit?EMAIL=${principalName}'/>">회원정보 수정</a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link" href="<c:url value='/mypage/withdrawal?EMAIL=${principalName}'/>">회원 탈퇴</a>
                     </li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!--  END mypage tab -->

<!-- 회원정보수정 -->
<!-- DB로부터 회원 시퀀스에 해당하는 회원 정보를 가져와서 수정(edit), 회원번호, 아이디, 이름 변경 불가-->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 mx-auto">
				<form role="form" method="POST" action="<c:url value='/member/merge' />"> <%--컨트롤러로 가기위한 정보를 담아 감--%>
					<input type="hidden" name="forwardView" value="/mypage/read" /> <%--앞으로 보여주는 페이지--%>
					<input type="hidden" name="signup" value="false" /> <%--가입은 회원의 경우에는 해당안되게 하기--%>
					<input type="hidden" name="MEMBER_SEQ"	value="${resultMap.MEMBER_SEQ }" /><%--회원seq 보내주기위함--%>
					<div class="card padding-card">
						<div class="card-body">
							<h4 class="card-title mb-4">회원정보 수정</h4>
							<p>회원 정보를 입력하세요</p>
							<div class="form-group">
								<label>Member ID :</label> <input type="email"	class="form-control" name="EMAIL" value="${resultMap.EMAIL}" readonly>
							</div>
							<div class="form-group">
								<label>Name :</label> <input type="text" class="form-control"
									name="NAME" value="${resultMap.NAME}" readonly>
							</div>
							<div class="form-group">
								<label>PASSWORD :</label> <input type="password"
									class="form-control" name="PASSWORD"
									value="${resultMap.PASSWORD}">
							</div>
							<div class="form-group">
								<label>Phone :</label> <input type="text" class="form-control"
									name="PHONE" value="${resultMap.PHONE}">
							</div>
							<div class="form-group">
								<label> INTEREST LOCATION : </label>
								<p>관심 지역을 1곳 이상 선택하세요</p>
								<div id=localDIV></div>
								<input type=checkbox checked="checked" name="LOCAL_SEQ" style="opacity:0;" value="dummy_loc">
							</div>
							<br>
						       <div align="center">
								<button type="submit" class="btn btn-success col-3">EDIT</button>
								<button type="reset" class="btn btn-default col-3">Cancel</button>
						   </div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- End 회원정보수정 -->

