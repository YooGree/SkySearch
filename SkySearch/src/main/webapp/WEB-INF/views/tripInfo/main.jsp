<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- 메인 슬라이드 이미지 -->
<section class="osahan-slider">
	<div id="osahanslider" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#osahanslider" data-slide-to="0" class="active"></li>
			<li data-target="#osahanslider" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active"
				style="background-image: url('<c:url value='/resources/img/slider/tripmain1.jpg'/>')">
			</div>
			<div class="carousel-item"
				style="background-image: url('<c:url value='/resources/img/slider/tripmain2.jpg'/>')">
			</div>
		</div>
<!-- 		<a class="carousel-control-prev" href="#osahanslider" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#osahanslider" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a> -->
	</div>
	
	<!-- 로그인 한 멤버 아이디 정의 -->
	<c:set var="principalName" value="${pageContext.request.userPrincipal.name}" />
	
	<script>
		// 지역을 선택했을 때 국가 가져오기
		function CountrySelect(value) {
			$.ajax({
					type : "GET", // 값을 보낼 방식
					url : "<c:url value='/ws/countyList'/>", // 보낼 컨트롤러
					data : { // 서버에 보낼 데이터 (key, value형식)
						"LOCAL_NAME" : value
					},
					success : function(result) { // result -> 컨트롤러에서 날라온 resultMap의 값
						var list = result.addList; // 자바 스크립트 내에서 쓸 수 있는 변수로 변환
						var category = "<option value='' selected>국가명</option>";

						$.each(list, function(i) { // select박스의 option값에 순차적으로 넣기
							category += "<option value='"
								+ (list[i])['COUNTRY_SEQ'] + "'>"
								+ (list[i])['COUNTRY_NAME']
								+ "</option>";
						});
						$("#country").html(category);

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("오류발생");
						return false;
					}
				});
			}
		
		// 국가를 선택했을 때 도시 가져오기
		function CitySelect(value) {
			$.ajax({
					type : "GET", // 값을 보낼 방식
					url : "<c:url value='/ws/cityList'/>", // 보낼 컨트롤러
					data : { // 서버에 보낼 데이터 (key, value형식)
						"COUNTRY_SEQ" : value
					},
					success : function(result) { // result -> 컨트롤러에서 날라온 resultMap의 값
						var list = result.addList; // 자바 스크립트 내에서 쓸 수 있는 변수로 변환
						var category = "<option value='' selected>도시명</option>";

						$.each(list, function(i) { // select박스의 option값에 순차적으로 넣기
							category += "<option value='"
								+ (list[i])['CITY_SEQ'] + "'>"
								+ (list[i])['CITY_NAME']
								+ "</option>";
						});
						$("#city").html(category);

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("오류발생");
						return false;
					}
				});
			}
	</script>
	<!-- 도시 이름 눌렀을 때 마우스 호버를 위해 적용 -->
	<style>
	a:hover {
		background-color: #dcdcdc;
	}
	</style>

	<div class="slider-form">
		<div class="container">
			<h1 class="text-center text-white mb-5">여행 정보</h1>
			<!-- 여행지 검색바 -->
			<form action="<c:url value='/tripInfo/read'/>" method="GET">
				<div class="row no-gutters">
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="mdi mdi-airplane"></i>
							</div>
							<input type="hidden" name="EMAIL" value="${pageContext.request.userPrincipal.name}"/>
							<select class="form-control select2 no-radius" id="local" name="LOCAL_NAME" onchange="CountrySelect(this.value);">
								<option value="">여행지역</option>
								<option value="아시아">아시아</option>
								<option value="동남아시아">동남아시아</option>
								<option value="유럽">유럽</option>
								<option value="북아메리카">북아메리카</option>
								<option value="남아메리카">남아메리카</option>
								<option value="오세아니아">오세아니아</option>
								<option value="아프리카">아프리카</option>
							</select>
						</div>
					</div>

					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="mdi mdi-earth"></i>
							</div>
							<select class="form-control select2 no-radius" id="country" name="COUNTRY_SEQ" onchange="CitySelect(this.value);">
								<option value="">국가명</option>
							</select>
						</div>
					</div>

					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="mdi mdi-city"></i>
							</div>
							<select class="form-control select2 no-radius" id="city" name="CITY_SEQ">
								<option value="">도시명</option>
							</select>
						</div>
					</div>
					
				<div class="col-md-2">
					<button type="submit" class="btn btn-success btn-block no-radius font-weight-bold">SEARCH</button>
				</div>
		</div>
		</form>
	</div>
	</div>
</section>
<!-- 메인 슬라이드 이미지 끝 -->

<!-- 여행정보 리스트(상위 6개) -->
<section class="section-padding">
	<div class="section-title text-center mb-5">
		<h2>추천 여행지</h2>
		<p>회원들이 선호하는 여행지는 어디일까요?</p>
	</div>
	<!--  로그인시 관심지역을 기준으로 조회수 많은순으로 6개를 나타낸다. -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="row">
					<c:if test="${principalName != null}">
					<c:forEach items="${resultUserCityList}" var="resultData" varStatus="loop">
					<div class="col-lg-4 col-md-4">
						<div class="card blog-card">
							<a href="<c:url value='/tripInfo/read'/>?CITY_SEQ=${resultData.CITY_SEQ}&EMAIL=${principalName}">
								<c:choose>
									<c:when test="${resultData.CITY_SEQ==resultData.SOURCE_UNIQUE_SEQ}">
										<img class="card-img-top" src="<c:url value='/resources/uploads/${resultData.PHYSICALFILE_NAME}'/>" alt="Card image cap" style="height:30%;">
									</c:when>
									<c:otherwise>
										<img class="card-img-top" src="<c:url value='/resources/uploads/noimage.jpg'/>" alt="Card image cap" style="height:30%;">
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<span class="badge badge-white">
									<b class="mdi mdi-trending-up">&nbsp;조회수 : ${resultData.CITY_VIEWS}</b>
									</span>
									<!-- 유저 평점을 뿌려주기 위한 forEach문 --> 
									<c:forEach items="${resultAvgStarList}" var="resultData2" varStatus="loop">
										<c:choose>
											<c:when test="${resultData.CITY_NAME == resultData2.CITY_NAME}">
												<span class="badge badge-white"> 
												<b class="mdi mdi-star">&nbsp;회원 평점 : ${resultData2.AVG_STAR}</b>
												</span>
											</c:when>
										</c:choose>
									</c:forEach>
									<h6>${resultData.CITY_NAME}</h6>
									<span class="mb-0">${resultData.CITY_ADD}</span>
								</div>
							 </a>
						</div>
					</div>
					</c:forEach>
					</c:if>
					<!-- 로그인 되지 않은 유저일 경우 조회수 많은 순으로 6개를 나타내준다. -->
					<c:if test="${principalName == null}">
					<c:forEach items="${resultNoUserCityList}" var="resultData" varStatus="loop">
					<div class="col-lg-4 col-md-4">
						<div class="card blog-card">
							<a href="<c:url value='/tripInfo/read'/>?CITY_SEQ=${resultData.CITY_SEQ}&EMAIL=${principalName}">
								<c:choose>
									<c:when test="${resultData.CITY_SEQ==resultData.SOURCE_UNIQUE_SEQ}">
										<img class="card-img-top" src="<c:url value='/resources/uploads/${resultData.PHYSICALFILE_NAME}'/>" alt="Card image cap" style="height:30%;">
									</c:when>
									<c:otherwise>
										<img class="card-img-top" src="<c:url value='/resources/uploads/noimage.jpg'/>" alt="Card image cap" style="height:30%;">
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<span class="badge badge-white">
									<b class="mdi mdi-trending-up">&nbsp;조회수 : ${resultData.CITY_VIEWS}</b>
									</span>
									<!-- 유저 평점을 뿌려주기 위한 forEach문 --> 
									<c:forEach items="${resultAvgStarList}" var="resultData2" varStatus="loop">
										<c:choose>
											<c:when test="${resultData.CITY_NAME == resultData2.CITY_NAME}">
												<span class="badge badge-white"> 
												<b class="mdi mdi-star">&nbsp;회원 평점 : ${resultData2.AVG_STAR}</b>
												</span>
											</c:when>
										</c:choose>
									</c:forEach>
									<h6>${resultData.CITY_NAME}</h6>
									<span class="mb-0">${resultData.CITY_ADD}</span>
								</div>
							 </a>
						</div>
					</div>
					</c:forEach>					
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>
<hr>
<!-- 이하 부분은 전체 여행지를 보여주는 부분입니다. -->
<section class="section-padding">
	<div class="section-title text-center mb-5">
		<h2>전체 여행지</h2>
		<p>각 도시의 관광지를 확인해보세요!</p>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
			
				<!-- 정렬 선택하는 부분입니다-->
				<div class="osahan_top_filter row">
					<div class="col-lg-12 col-md-12 sort-by-btn float-right">
						<div class="dropdown float-right">
							<button class="btn btn-success btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="mdi mdi-filter">정렬 방식</i>
							</button>
							<div class="dropdown-menu float-right" aria-labelledby="dropdownMenuButton">
							<c:set var="SORT_VIEW" value="CITY_VIEWS"/>
							<c:set var="SORT_STAR" value="SS_STAR"/>
							<c:set var="principalName" value="${pageContext.request.userPrincipal.name}" />
								<a class="dropdown-item" href="<c:url value='/tripInfo/main'/>?SORT_VALUE=${SORT_VIEW}&EMAIL=${principalName}"><i class="mdi mdi-chevron-right"></i>조회수순</a>
								<a class="dropdown-item" href="<c:url value='/tripInfo/main'/>?SORT_VALUE=${SORT_STAR}&EMAIL=${principalName}"><i class="mdi mdi-chevron-right"></i>별점순</a>
							</div>
						</div>
					</div>
				</div>
				<!-- END 정렬 선택하는 부분입니다-->
				
				<div class="row">
					<c:forEach items="${resultCityPaginationMap.resultList}" var="resultData" varStatus="loop">
					<div class="col-lg-4 col-md-4">
						<div class="card blog-card">
							<a href="<c:url value='/tripInfo/read'/>?CITY_SEQ=${resultData.CITY_SEQ}&EMAIL=${principalName}">
								<c:choose>
									<c:when test="${resultData.CITY_SEQ==resultData.SOURCE_UNIQUE_SEQ}">
										<img class="card-img-top" src="<c:url value='/resources/uploads/${resultData.PHYSICALFILE_NAME}'/>" alt="Card image cap" style="height:30%;">
									</c:when>
									<c:otherwise>
										<img class="card-img-top" src="<c:url value='/resources/uploads/noimage.jpg'/>" alt="Card image cap" style="height:30%;">
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<span class="badge badge-white">
									<b class="mdi mdi-trending-up">&nbsp;조회수 : ${resultData.CITY_VIEWS}</b>
									</span>
									<!-- 유저 평점을 뿌려주기 위한 forEach문 --> 
									<c:forEach items="${resultAvgStarList}" var="resultData2" varStatus="loop">
										<c:choose>
											<c:when test="${resultData.CITY_NAME == resultData2.CITY_NAME}">
												<span class="badge badge-white"> 
												<b class="mdi mdi-star">&nbsp;회원 평점 : ${resultData2.AVG_STAR}</b>
												</span>
											</c:when>
										</c:choose>
									</c:forEach>
									<h6>${resultData.CITY_NAME}</h6>
									<span class="mb-0">${resultData.CITY_ADD}</span>
								</div>
							 </a>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- END 이부분은 전체 여행지를 보여주는 부분입니다. -->
				<!-- 이부분은 페이징 부분입니다 -->
				<div class="row">
					<div class="col-lg-4 col-md-4"></div>
					<div class="col-lg-4 col-md-4">
						<c:set var="page" value="${resultCityPaginationMap.pagination}" />
						<nav class="mt-5">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="<c:url value="/tripInfo/main?curPage=${page.prevPage}&CITY_SEQ=${resultMap.CITY_SEQ}&EMAIL=${principalName}"/>"><i class="mdi mdi-chevron-left"></i></a></li>
								<c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
									<c:choose>
										<c:when test="${pageNum==page.curPage}">
											<li class="page-item active"><a class="page-link" href="<c:url value="/tripInfo/main?curPage=${pageNum}&CITY_SEQ=${resultMap.CITY_SEQ}&EMAIL=${principalName}" />">${pageNum}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="<c:url value="/tripInfo/main?curPage=${pageNum}&CITY_SEQ=${resultMap.CITY_SEQ}&EMAIL=${principalName}" />">${pageNum}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="<c:url value="/tripInfo/main?curPage=${page.nextPage}&CITY_SEQ=${resultMap.CITY_SEQ}&EMAIL=${principalName}"/>"><i class="mdi mdi-chevron-right"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!--END 페이징 -->
			</div>
		</div>
	</div>
</section>

<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b5175cdcb0ffdc9"></script>