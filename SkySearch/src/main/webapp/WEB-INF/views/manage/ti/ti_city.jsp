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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script>
	function success() {
		alert('정보가 입력되었습니다.');
	}

	<%-- CountrySelectBox --%>
	var fn_setCountryFormTagSelectbox = function(url, id, params) {
		$
				.ajax({
					type : "POST",
					url : url,
					data : params,
					cache : false,
					success : function(data) {
						var formTag = "";

						formTag += "<select class='form-control' name='COUNTRY_SEQ' >";
						$
								.each(
										data,
										function(i, item) {
											<%-- 파라미터에 COUNTRY_NAME이 있다면 선택 --%>
											if ("${resultMap.COUNTRY_NAME}" == item.COUNTRY_NAME) {
												formTag += '<option selected="selected" value="'+item.COUNTRY_SEQ+'" >'
														+ item.COUNTRY_NAME;
											} else {
												formTag += '<option value="'+item.COUNTRY_SEQ+'" >'
														+ item.COUNTRY_NAME;
											}
										});

						formTag += '</select> ';
						$('#' + id).html(formTag);
					},
					error : function(xhr, status, exception) {
						alert("Failure \n (" + status + ")");
						return false;
					}
				});

	}
	<%-- LocalSelectBox --%>
	var fn_setLocalFormTagSelectbox = function(url, id, params) {
		$
				.ajax({
					type : "POST",
					url : url,
					data : params,
					cache : false,
					success : function(data) {
						var formTag = "";
						<%-- 파라미터에 넘어오는 값이 없는 경우 동적바인딩 실행 --%>
						if ("${resultMap.LOCAL_NAME}" == "") {
							formTag += "<select class='form-control' name='LOCAL_SEQ' onchange='CountrySelect(this.value);'>";
							$
									.each(
											data,
											function(i, item) {
												if (item.LOCAL_SEQ == "dummy_loc") {
													return true;
												}
												formTag += '<option value="'+item.LOCAL_NAME+'" >'
														+ item.LOCAL_NAME;

											});
						} else {
							formTag += "<select class='form-control' name='LOCAL_SEQ' >";
							$
									.each(
											data,
											function(i, item) {
												if ("${resultMap.LOCAL_NAME}" == item.LOCAL_NAME) {
													formTag += '<option selected="selected" value="'+item.LOCAL_SEQ+'" >'
															+ item.LOCAL_NAME;

												} else if (item.LOCAL_SEQ == "dummy_loc") {
													return true;
												} else {
													formTag += '<option value="'+item.LOCAL_SEQ+'" >'
															+ item.LOCAL_NAME;
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
	<%-- LocalSelectBox2 - MODAL --%>
	var fn_setLocalFormTagSelectbox2 = function(url, id, params) {
		$
				.ajax({
					type : "POST",
					url : url,
					data : params,
					cache : false,
					success : function(data) {
						var formTag = "";
						if ("${resultMap.LOCAL_NAME}" == "") {

							formTag += "<select class='form-control' name='LOCAL_SEQ' >";
							$
									.each(
											data,
											function(i, item) {
												if (item.LOCAL_SEQ == "dummy_loc") {
													return true;
												}
												formTag += '<option value="'+item.LOCAL_SEQ+'" >'
														+ item.LOCAL_NAME;

											});
						} else {
							formTag += "<select class='form-control' name='LOCAL_SEQ' >";
							$

									.each(
											data,
											function(i, item) {
												if ("${resultMap.LOCAL_NAME}" == item.LOCAL_NAME) {
													formTag += '<option selected="selected" value="'+item.LOCAL_SEQ+'" >'
															+ item.LOCAL_NAME;
												} else if (item.LOCAL_SEQ == "dummy_loc") {
													return true;
												} else {
													formTag += '<option value="'+item.LOCAL_SEQ+'" >'
															+ item.LOCAL_NAME;
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
	 <%-- 지역을 선택했을 때 국가 가져오기 --%>
	function CountrySelect(value) {
		$.ajax({
			type : "GET",  <%-- 값을 보낼 방식 --%>
			url : "<c:url value='/ws/countyList'/>", <%--  보낼 컨트롤러 --%>
			data : {  				<%-- 서버에 보낼 데이터 (key, value형식) --%>
				"LOCAL_NAME" : value
			},
			success : function(result) {  <%-- result -> 컨트롤러에서 날라온 resultMap의 값 --%>
				var list = result.addList;  <%-- 자바 스크립트 내에서 쓸 수 있는 변수로 변환 --%>

				var category = "<option value='' selected>국가명</option>";

				$.each(list, function(i) {  <%-- select박스의 option값에 순차적으로 넣기 --%>
					category += "<option value='" + (list[i])['COUNTRY_SEQ']
							+ "'>" + (list[i])['COUNTRY_NAME'] + "</option>";
				});
				$("#country").html(category);

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류발생");
				return false;
			}
		});
	}

	$(document).ready(
			function() {

				fn_setLocalFormTagSelectbox("<c:url value='/ws/localList' />",
						"localDIV");
				fn_setLocalFormTagSelectbox2("<c:url value='/ws/localList' />",
						"localDIV2");
				fn_setCountryFormTagSelectbox("<c:url value='/ws/coList' />",
						"countryDIV");

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
					<li><a href="<c:url value='/manage/ti/ti_cilist'/>">여행정보</a></li>
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
						<strong class="card-title">도시입력</strong> <input type="submit"
							class="btn btn-primary" value=정보목록
							onClick="location.href='<c:url value="/manage/ti/ti_cilist"/>'"
							style="float: right;"> <input type="submit"
							class="btn btn-primary" value=신규입력
							onClick="location.href='<c:url value="/manage/ti/ti_city"/>'"
							style="float: right;">
						<button type="button" id=countryAdd class="btn btn-secondary mb-1"
							data-toggle="modal" data-target="#mediumModal"
							style="float: right;" onclick="fn_setLocalFormTagSelectbox()">국가입력</button>

					</div>
					<div class="card-body">


						<%-- 도시입력 --%>
						<div class="col-sm-12">
							<form role="form" method="POST"
								action="<c:url value='/manage/ti/citymerge' />"
								enctype="multipart/form-data">
								<input type="hidden" name="forwardView"
									value="/manage/ti/ti_cilist" />
								<div class="card padding-card">
									<div class="card-body">
										<div align="left">
											<div class="card-body">
												<div class="form-group col-sm-6">
													<label> 지역 명 : </label>
													<div id=localDIV></div>
												</div>
												<input type="hidden" class="form-control" name="CITY_SEQ"
													value="${resultMap.CITY_SEQ}"> <input type="hidden"
													class="form-control" name="COUNTRY_NAME"
													value="${resultMap.COUNTRY_SEQ}">

												<%-- JSTL SelectBox 조건문 --%>
												<c:choose>
													<c:when test="${resultMap.LOCAL_NAME==null}">
														<div class="form-group col-sm-6">
															<label>국가 명 :</label> <select
																class="form-control select2 no-radius" id="country"
																name="COUNTRY_SEQ" onchange="CitySelect(this.value);">
																<option value="">국가명</option>
															</select>
														</div>
													</c:when>
													<c:otherwise>
														<div class="form-group col-sm-6">
															<label>국가 명 :</label>
															<div id=countryDIV name="COUNTRY_NAME"></div>
														</div>
													</c:otherwise>
												</c:choose>
												<%-- JSTL SelectBox 조건문 END --%>

												<div class="form-group col-sm-6">
													<label>도시 명 :</label> <input type="text"
														class="form-control" name="CITY_NAME"
														value="${resultMap.CITY_NAME}">
												</div>
												<div class="form-group col-sm-6">
													<label>영문 :</label> <input type="text" class="form-control"
														name="CITY_ENAME" value="${resultMap.CITY_ENAME}">
												</div>
												<div class="form-group col-sm-12">
													<label>도시 주소:</label> <input type="text"
														class="form-control" name="CITY_ADD"
														value="${resultMap.CITY_ADD}">
												</div>
												<div class="form-group col-sm-6">
													<label>위도:</label> <input type="text" class="form-control"
														name="CITY_LATITUDE" value="${resultMap.CITY_LATITUDE}">
												</div>
												<div class="form-group col-sm-6">
													<label>경도:</label> <input type="text" class="form-control"
														name="CITY_LONGITUDE" value="${resultMap.CITY_LONGITUDE}">
												</div>
												<div class="form-group col-sm-12">
													<div id="floating-panel">
														<input id="address" type="textbox"
															value="${resultMap.CITY_ADD}"> <input
															class="btn btn-success" type="button"
															onclick="window.open('http://www.iegate.net/maps/geogoogle.php')"
															value="검색">

													</div>

													<%-- Map disable --%>
													<c:set var="CITY_SEQ" value="${resultMap.CITY_SEQ}"></c:set>
													<c:choose>
														<c:when test="${CITY_SEQ == null}">
															<div class="col-6 col-md-6"></div>
														</c:when>
														<c:otherwise>
															<div id="map" style="height: 500px;"></div>

														</c:otherwise>
													</c:choose>
													<%-- Map disable END --%>
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
																			href="<c:url value='/manage/ti/file_cidelete?ATTACHFILE_SEQ=${resultData.ATTACHFILE_SEQ}
																&forwardView=/manage/ti/ti_city&CITY_SEQ=${resultMap.CITY_SEQ}'/>">${resultData.PHYSICALFILE_NAME}
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
									</div>
									<div align="right">
										<input type="submit" class="btn btn-success" value="입력"
											onclick="success()" />
									</div>
								</div>
							</form>
						</div>
						<%-- 도시입력 END --%>

					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<%-- Modal --%>
<div class="modal fade" id="mediumModal" tabindex="-1" role="dialog"
	aria-labelledby="mediumModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="mediumModalLabel">Medium Modal</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<%-- 국가입력 --%>
				<div class="col-sm-12">
					<form role="form" method="POST"
						action="<c:url value='/manage/ti/countrymerge' />">
						<input type="hidden" name="forwardView" value="/manage/ti/ti_cilist" />
						<div class="card padding-card">
							<div class="card-body">
								<div align="left">
									<div class="card-body">
										<div class="form-group col-sm-4">
											<label> 지역 명 : </label>
											<div id=localDIV2></div>
										</div>

										<input type="hidden" class="form-control" name="COUNTRY_SEQ"
											value="${resultMap.COUNTRY_SEQ}">

										<div class="form-group col-sm-4">
											<label>국가 명 :</label> <input type="text" class="form-control"
												name="COUNTRY_NAME" value="${resultMap.COUNTRY_NAME}">
										</div>
									</div>
								</div>
							</div>
							<div align="right">
								<input type="submit" onclick="enable()" class="btn btn-success"
									value="입력" onclick="success()" />
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
							</div>
						</div>
					</form>

				</div>
				<%-- 국가입력 END --%>
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

<%-- Gmaps --%>
<c:set var="lat" value="${resultMap.CITY_LATITUDE}" />
<%-- 위도값 받아오기 --%>
<c:set var="lng" value="${resultMap.CITY_LONGITUDE}" />
<%-- 경도값 받아오기 --%>
<script>
	function initMap() {
		var uluru = {
         		lat: ${lat},
         		lng: ${lng}
         	};
         	var map = new google.maps.Map(document.getElementById('map'), {
         		zoom: 7,
         		center: uluru

         	});
         	var contentString = '<div id="content">' +
         		'<div id="bodyContent">' +
         		'<div class="card card-list"><a href="#"> </a> </div>' +
         		'</div>' +
         		'</div>';
         
         	var infowindow = new google.maps.InfoWindow({
         		content: contentString,
         		maxWidth: 300
         	});
         	var image = '<c:url value='/resources/img/marker.png'/>';
         	var marker = new google.maps.Marker({
         		position: uluru,
         		map: map
         	});
		var geocoder = new google.maps.Geocoder();

		
	}

	function geocodeAddress(geocoder, resultsMap) {
		var address = document.getElementById('address').value;
		geocoder
				.geocode(
						{
							'address' : address
						},
						function(results, status) {
							if (status === google.maps.GeocoderStatus.OK) {
								resultsMap
										.setCenter(results[0].geometry.location);
								var marker = new google.maps.Marker({
									map : resultsMap,
									position : results[0].geometry.location
								});

								document.getElementById('location_code').innerHTML = results[0].geometry.location;
							} else {
								alert('Geocode was not successful for the following reason: '
										+ status);
							}
						});
	}
</script>


<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsOUkZbTEwLxeUN5Qfag6Vr5BjngCGMY&callback=initMap"></script>