<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- SLIDER -->
<section class="osahan-slider">
	<div id="osahanslider" class="carousel slide" data-ride="carousel">
		<!-- 슬라이더 갯수 지정 -->
		<ol class="carousel-indicators">
			<li data-target="#osahanslider" data-slide-to="0" class="active"></li>
			 <%--   <li data-target="#osahanslider" data-slide-to="1"></li> 
			 <li data-target="#osahanslider" data-slide-to="2"></li>  
			<li data-target="#osahanslider" data-slide-to="3"></li>  --%>  
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- 슬라이더 이미지  지정-->
			<div class="carousel-item active"
				style="background-image: url('<c:url value='/resources/img/slider/main1.png'/>')">
			</div>
			<%-- <div class="carousel-item "
				style="background-image: url('<c:url value='/resources/img/slider/Beach3.jpg'/>')">
			</div> --%>
			<%--  <div class="carousel-item "
				style="background-image: url('<c:url value='/resources/img/slider/Beach2.jpg'/>')">
			</div>
			<div class="carousel-item "
				style="background-image: url('<c:url value='/resources/img/slider/Beach3.jpg'/>')">
			</div>  --%>
		</div>
		<a class="carousel-control-prev" href="#osahanslider" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#osahanslider" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
</section>
<!-- END SLIDER -->
<!-- 특가 LIST -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="section-title text-center mb-5">
				<h4>진행중인 특가</h4>
			</div>
			<div class="col-lg-12 col-md-12" id="eventList">
				<%-- 크롤링 해온  list 뿌려주기 --%>
				<c:forEach items="${resultList}" var="resultList" varStatus="loop">
					<c:forEach items="${resultList}" var="resultData" varStatus="loop">
						<div class="col-lg-12 col-md-12">
							<div class="card card-list card-list-view">
								<%-- url --%>
								<a href="${resultData.url}" target="_blank">
									<div class="row no-gutters">
										<div class="col-lg-3 col-md-3">
											<%-- image --%>
											<img class="card-img-top" src="${resultData.img}"
												alt="${resultData.alt}">
										</div>
										<div class="col-lg-9 col-md-9">
											<div class="card-body">
												<%-- event title --%>
												<h5 class="card-title">${resultData.title}</h5>
												<%-- period of event --%>
												<h6 class="card-subtitle mb-2 text-muted">${resultData.period}</h6>
											</div>
											<div class="card-footer">
												<%-- 항공사명 --%>
												<span><strong>${resultData.flight} </strong></span>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</c:forEach>
				<%-- 이하 하드코딩 --%>
				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a
							href="https://kr.koreanair.com/korea/ko/detailDiscountTicket.html#step1">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="https://kr.koreanair.com/content/dam/koreanair/kr/New%20Marquee/1280x600/B787_1280x600.jpg"
										alt="">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">특가 항공권</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>
									</div>
									<div class="card-footer">
										<span><strong>대한항공 </strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a
							href="https://www.cathaypacific.com/cx/ko_KR.html?utm_medium=SEM-SEL-LOC&utm_campaign=CX&utm_source=GOOGLE&utm_content=BRAND-BOTH-ALS&utm_term=BRANDED-GENERIC-%EC%BA%90%EC%84%B8%EC%9D%B4%ED%8D%BC%EC%8B%9C%ED%94%BD%EC%98%88%EC%95%BD&dclid=CLGLjt_7rNwCFZ4cKgodHVoNyQ">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="<c:url value='/resources/img/special/cathaypacific.jpg' />"
										alt="cathaypacific">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">최신 특가 및 혜택</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>

									</div>
									<div class="card-footer">
										<span><strong>캐세이퍼시픽</strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a href="https://www.lufthansa.com/kr/ko/Top-Offers">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="https://www.lufthansa.com/mediapool/jpg/36/media_1526716136.jpg"
										alt="">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">이코노미 클래스 온라인 특가</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>

									</div>
									<div class="card-footer">
										<span><strong>루프트한자</strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a
							href="https://www.singaporeair.com/ko_KR/kr/special-offers/flight-from-Seoul/">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="https://www.singaporeair.com/saar5/images/navigation/plan-travel/destinations/nav-destination.jpg"
										alt="">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">할인행사</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>

									</div>
									<div class="card-footer">
										<span><strong>싱가폴항공</strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a href="https://www.jinair.com/promotion/index">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="<c:url value='/resources/img/special/jin.jpg' />"
										alt="JinAir image">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">지금 이순간 최저가를 한눈에!</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>
									</div>
									<div class="card-footer">
										<span><strong>진에어</strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a
							href="https://www.eastarjet.com/newstar/PGWTA00001?searchIndex=undefined">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="<c:url value='/resources/img/special/EASTARJET.png' />"
										alt="">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">EASTAR JET 이벤트</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>
									</div>
									<div class="card-footer">
										<span><strong>이스타</strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card card-list card-list-view">
						<a
							href="https://www.airbusan.com/content/common/flynjoy/flyNEvent/">
							<div class="row no-gutters">
								<div class="col-lg-3 col-md-3">
									<img class="card-img-top"
										src="<c:url value='/resources/img/special/busan.jpg' />"
										alt="">
								</div>
								<div class="col-lg-9 col-md-9">
									<div class="card-body">
										<h5 class="card-title">FLY & EVENT</h5>
										<h6 class="card-subtitle mb-2 text-muted"></h6>
									</div>
									<div class="card-footer">
										<span><strong>에어부산</strong></span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b5175cdcb0ffdc9"></script>
<!-- END 특가 LIST -->
