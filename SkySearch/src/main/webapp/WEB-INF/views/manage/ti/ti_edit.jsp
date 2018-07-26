<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<%--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]--%>
<%--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]--%>
<%--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]--%>
<%--[if gt IE 8]><%--%>
<html class="no-js" lang="">
<%--<![endif]--%>

<script>
	
<%-- alarm --%>
	function success() {
		alert('정보가 입력되었습니다.');
	}
<%-- CitySelectBox --%>
	var fn_setCityFormTagSelectbox = function(url, id, params) {
		$
				.ajax({
					type : "POST",
					url : url,
					data : params,
					cache : false,
					success : function(data) {
						var formTag = "";
						
						if ("${resultMap.CITY_NAME}" == "") {
							formTag += "<select class='form-control' name='CITY_SEQ' >";
							$
									.each(
											data,
											function(i, item) {
												formTag += '<option value="'+item.CITY_SEQ+'" >'
														+ item.CITY_NAME;
											});
						} else {
							formTag += "<select class='form-control' name='CITY_SEQ'  >";

							$
									.each(
											data,
											function(i, item) {
												if ("${resultMap.CITY_NAME}" == item.CITY_NAME) {
													formTag += '<option selected="selected" value="'+item.CITY_SEQ+'">'
															+ item.CITY_NAME;
												} else {
													formTag += '<option  value="'+item.CITY_SEQ+'" >'
															+ item.CITY_NAME;
												}

											});

						}

						formTag += '</select> ';
						$('#' + id).html(formTag);
					},
					error : function(xhr, status, exception) {
						alert("Failure \n (" + status + ")");
						return false;
					}
				});

	}

	$(document).ready(function() {
		fn_setCityFormTagSelectbox("<c:url value='/ws/ciList' />", "cityDIV");

	});
</script>


<div class="breadcrumbs">
	<div class="col-sm-4">
		<div class="page-header float-left">
			<div class="page-title">
				<h1>여행정보</h1>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="page-header float-right">
			<div class="page-title">
				<ol class="breadcrumb text-right">
					<li><a href="<c:url value='/manage/main/index'/>">Dashboard</a></li>
					<li><a href="<c:url value='/manage/ti/ti_list'/>">여행정보</a></li>
					<li class="active">여행정보 입력</li>
				</ol>
			</div>
		</div>
	</div>
</div>

<div class="content mt-3">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">관광지입력</strong> <input type="submit"
							class="btn btn-primary" value=정보목록
							onClick="location.href='<c:url value="/manage/ti/ti_list"/>'"
							style="float: right;"> <input type="submit"
							class="btn btn-primary" value=도시입력
							onClick="location.href='<c:url value="/manage/ti/ti_city?CITY_SEQ=${resultMap.CITY_SEQ}"/>'"
							style="float: right;">
					</div>
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col-lg-12 col-md-12 mx-auto">
									<form role="form" method="POST"
										action="<c:url value='/manage/ti/merge' />"
										enctype="multipart/form-data">
										<input type="hidden" name="forwardView"
											value="/manage/ti/ti_list" />
										<div class="card padding-card">
											<div class="card-body">
												<h4 class="card-title mb-4">관광지 입력</h4>
												<p>관광지 정보를 입력하세요</p>
												<div class="form-group">
													<input type="hidden" class="form-control" name="TRAVEL_SEQ"
														value="${resultMap.TRAVEL_SEQ}" /> <input type="hidden"
														class="form-control" name="COUNTRY_SEQ"
														value="${resultMap.COUNTRY_SEQ}" />
												</div>
												<div class="form-group">
													<label>관광지명 :</label> <input type="text"
														class="form-control" name="LANDMARK_NAME"
														value="${resultMap.LANDMARK_NAME}">
												</div>
												<div class="form-group">
													<label>관광지 주소 :</label> <input type="text"
														class="form-control" name="LANDMARK_ADDR"
														value="${resultMap.LANDMARK_ADDR}">
												</div>

												<div class="form-group">
													<label>관광지 설명 :</label> <input type="text"
														class="form-control" name="LANDMARK_EXP"
														value="${resultMap.LANDMARK_EXP}">
												</div>
												<div class="form-group">
													<label>도시명 :</label>
													<div id=cityDIV name="CITY_NAME"></div>
												</div>

												<%-- 첨부파일 --%>
												<c:forEach items="${resultList}" var="resultData"
													varStatus="loop">
													<c:set var="ATTACHFILE_SEQ"
														value="${resultData.ATTACHFILE_SEQ}"></c:set>
												</c:forEach>
												<c:choose>
													<c:when test="${ATTACHFILE_SEQ == null}">
														<div class="col-6 col-md-6">

															<input type="file" name="ATTACHEDFILES" />
														</div>
													</c:when>
													<c:otherwise>
														<div class="form-group">

															<div class="card-body">
																<p class="text-muted m-b-15">파일목록 :</p>
																<c:forEach items="${resultList}" var="resultData"
																	varStatus="loop">
																	<ul class="list-unstyled">
																		<li><a
																			href="<c:url value='/manage/ti/file_delete?ATTACHFILE_SEQ=${resultData.ATTACHFILE_SEQ}
																&forwardView=/manage/ti/ti_edit&TRAVEL_SEQ=${resultMap.TRAVEL_SEQ}'/>">${resultData.PHYSICALFILE_NAME}
																		</a></li>
																	</ul>
																</c:forEach>
															</div>
														</div>

													</c:otherwise>
												</c:choose>
												<%-- 첨부파일 END --%>

											</div>
										</div>
										<div align="right">

											<input type="submit" class="btn btn-success" value="입력"
												onclick="success()" />

										</div>
									</form>
								</div>
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>
		<%-- /# row --%>

	</div>
</div>
</div>
</div>
</div>
<%-- .animated --%>
</div>


</div>
<%-- /#right-panel --%>

<%-- Right Panel --%>