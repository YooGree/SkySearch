<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


      <!-- 특가 썸네일   -->
      <section class="osahan-slider">
         <div id="osahanslider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#osahanslider" data-slide-to="0" class="active"></li>
               <li data-target="#osahanslider" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
               <div class="carousel-item active" style="background-image: url('<c:url value='/resources/img/special/thumb_2.png'/>')"><!-- 이부분은 썸네일의 파일명이 들어갈 부분입니다.  --></div>
            </div>
            <a class="carousel-control-prev" href="#osahanslider" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#osahanslider" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
         </div>
         <!-- END 특가 썸네일   -->
         <!-- 특가 설명 Header -->
         <div class="property-single-title property-single-title-gallery">
            <div class="container">
               <div class="row">
                  <div class="col-lg-8 col-md-8">
                     <h1>제주항공 찜 특가<!-- 이부분은 특가 게시판 제목입니다 --></h1>
                     <h6><i class="mdi mdi-map-marker-multiple"></i> 베트남 다낭<!-- 이부분은 국가명과 도시명입니다 --></h6>
                  </div>
                  <div class="col-lg-4 col-md-4 text-right">
                     <h6 class="mt-2">18.07.16 - 18.07.25<!-- 이부분은 특가정보 기간입니다(시작일 - 종료일)  --></h6>
                     <h2 class="text-success">140,000원 ~ <!-- 이부분은 특가정보 가격입니다 --></h2>
                  </div>
               </div>
               <hr>
                <div class="row">
                  <div class="col-lg-8 col-md-8">
                     <p class="mt-1 mb-0"><i class="mdi mdi-airplane"></i><strong>항공사 : 제주항공<!--이 부분은 특가정보의 항공사명입니다 --></strong></p>
                  </div>
                 
               </div> 
            </div>
         </div>
      </section>
      <!-- End 특가 설명 Header -->
       <!-- 특가 설명 area -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 col-md-12">
       			  <!-- 여행지 사진 slider -->
                  <div class="card">
                     <div class="card-body osahan-slider pl-0 pr-0 pt-0 pb-0">
                        <div id="osahansliderz" class="carousel slide" data-ride="carousel">
                           <ol class="carousel-indicators">
                              <li data-target="#osahansliderz" data-slide-to="0" class="active"></li>
                              <li data-target="#osahansliderz" data-slide-to="1"></li>
                           </ol>
                           <div class="carousel-inner" role="listbox">
                              <div class="carousel-item active rounded" style="background-image: url('<c:url value='/resources/img/special/vietname_danang_1.jpg'/>')"><!-- 이부분은 여행지(도시)의 사진입니다. 해당 특가의 여행지와 여행게시판의 여행지가 맞는 사진을 조인해서 가져옵니다.이하 동일 --></div>
                              <div class="carousel-item rounded" style="background-image: url('<c:url value='/resources/img/special/vietname_danang_2.jpg'/>')"></div>
                           </div>
                           <a class="carousel-control-prev" href="#osahansliderz" role="button" data-slide="prev">
                           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                           <span class="sr-only">Previous</span>
                           </a>
                           <a class="carousel-control-next" href="#osahansliderz" role="button" data-slide="next">
                           <span class="carousel-control-next-icon" aria-hidden="true"></span>
                           <span class="sr-only">Next</span>
                           </a>
                        </div>
                     </div>
                  </div>
                  <!-- END 여행지 사진 slider -->
                  <!-- 특가 설명 -->
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">예매 POINT </h5>
                        <p>1년에 단 2번 열리는 BIG프로모션! 제주항공 찜 특가 소식입니다.<br><br> -오픈시간 7월 3일(화) 오후 5시 지방출발 노선<br> 7월 4일(수) 오후 5시 김포출발 노선 <br>7월 5일(목) 오후 5시 인천출발 노선<br><br>
                        - sky search 추천 노선 김포,부산,대구 - 제주 편도 1만원대 <br>인천-홍콩,타이베이 편도 5만원대<br> 인천 - 방콕,다낭,나트랑 편도 7만원대<br><br> - 프리세일 오픈 제주항공 홈페이지 Gold, VIP회원은 7월 2일에 사전 구매 가능<br><br> *오픈까지 남은 일주일동안 친구와 함께 여행일정을 계획해보세요:)
                        <!-- 이 부분은 특가 게시판 내용입니다(특가 설명) --> </p>
                     </div>
                  </div>
                   <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">예매 TIP</h5>
                        <p>-기내 수하물:10kg<br> -발권수수료: 무료<br> - 당일취소:무료<br> -문의 전화: 1599-1500<!-- 이 부분은 항공사의 기타 정보입니다 --> </p>
                     </div>
                  </div>
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">예약 사이트로 이동</h5>
                        <div class="row">
                           <div class="col-lg-12 col-md-12">
                              <ul class="sidebar-card-list">
                                 <li>
                                 	<a href="https://www.jejuair.net/jejuair/kr/com/jeju/ibe/news/event/event_detail.do?page=1&event_id=3916&nSearch=&condition=title&search=" target="_blank"><!-- 특가의 해당 사이트로 이동하는 부분입니다.(href) -->
                                 		<i class="mdi mdi-checkbox-marked-outline text-success"></i> 
                                 		https://www.jejuair.net/jejuair/kr/com/jeju/ibe/news/event/event_detail.do?page=1&event_id=3916&nSearch=&condition=title&search=<!-- 특가의 해당 사이트로 이동하는 url이 보여지는 부분입니다 -->
                                 	</a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                   <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">여행 정보로 이동</h5>
                        <div class="row">
                           <div class="col-lg-12 col-md-12">
                              <ul class="sidebar-card-list">
                                 <li>
                                 	<a href="http://localhost:8080/SkySearch/tripInfo/main?#"><!-- 특가 해당 지역의 여행정보게시판으로 이동하는 부분입니다.(href) -->
                                 		<i class="mdi mdi-checkbox-marked-outline text-success"></i> 
                                 		http://localhost:8080/SkySearch/tripInfo/main?#<!-- 특가의 해당 지역의 여행정보 게시판으로 이동하는 url이 보여지는 부분입니다 -->
                                 	</a>
                                 </li>
                                
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                   <!-- 특가 설명 -->
                   <!-- 지도 -->
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">Location</h5>
                        <div id="map"></div>
                     </div>
                  </div>
                   <!-- END 지도 -->
            </div>
         </div>
      </section> 
      <!-- End 특가 설명 area -->	
      <!-- Similar 특가 -->
      <section class="section-padding  border-top">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 col-md-12 section-title text-left mb-4">
                  <h2> 비슷한 특가 상품</h2><!-- 해당 특가 상품과 지역의 상품 3개 랜덤으로 가져오기 -->
               </div>
               <div class="col-lg-4 col-md-4">
                 <div class="card card-list">
                    <a href="#">
                       <img class="card-img-top" src="<c:url value='/resources/img/list/2.png'/>" alt="Card image cap">
                       <div class="card-body">
                          <h5 class="card-title">제목</h5>
                          <h6 class="card-subtitle mb-2 text-muted"> <i class="mdi mdi-map-marker-multiple"></i>도시명, 국가 </h6>
                          <h2 class="text-success mb-0 mt-3"> 가격 ~ </h2>
                       </div>
                       <div class="card-footer">
                          <span><i class="mdi mdi-airplane"></i> 항공사 : <strong>항공사 명</strong></span>
                          <span><i class="mdi mdi-checkbox-marked-outline"></i> 특가 종료일 : <strong>날짜</strong></span>
                       </div>
                    </a>
                 </div>
	           </div>
                <div class="col-lg-4 col-md-4">
                 <div class="card card-list">
                    <a href="#">
                       <img class="card-img-top" src="<c:url value='/resources/img/list/2.png'/>" alt="Card image cap">
                       <div class="card-body">
                          <h5 class="card-title">제목</h5>
                          <h6 class="card-subtitle mb-2 text-muted"> <i class="mdi mdi-map-marker-multiple"></i>도시명, 국가 </h6>
                          <h2 class="text-success mb-0 mt-3"> 가격 ~ </h2>
                       </div>
                       <div class="card-footer">
                          <span><i class="mdi mdi-airplane"></i> 항공사 : <strong>항공사 명</strong></span>
                          <span><i class="mdi mdi-checkbox-marked-outline"></i> 특가 종료일 : <strong>날짜</strong></span>
                       </div>
                    </a>
                 </div>
	           </div>
               <div class="col-lg-4 col-md-4">
                 <div class="card card-list">
                    <a href="#">
                       <img class="card-img-top" src="<c:url value='/resources/img/list/2.png'/>" alt="Card image cap">
                       <div class="card-body">
                          <h5 class="card-title">제목</h5>
                          <h6 class="card-subtitle mb-2 text-muted"> <i class="mdi mdi-map-marker-multiple"></i>도시명, 국가 </h6>
                          <h2 class="text-success mb-0 mt-3"> 가격 ~ </h2>
                       </div>
                       <div class="card-footer">
                          <span><i class="mdi mdi-airplane"></i> 항공사 : <strong>항공사 명</strong></span>
                          <span><i class="mdi mdi-checkbox-marked-outline"></i> 특가 종료일 : <strong>날짜</strong></span>
                       </div>
                    </a>
                 </div>
	           </div>
            </div>
	            <nav class="mt-5">
                     <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                           <a class="page-link" href="#" tabindex="-1"><i class="mdi mdi-chevron-left"></i></a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                           <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>
                        </li>
                     </ul>
                  </nav>
         </div>
      </section>
      <!-- End Similar Properties -->
      <!--  아래 구글 지도 스트립트 부분 -->
       <script>
         function initMap() {
         	var uluru = {
         		lat: -25.363,
         		lng: 131.044
         	};
         	var map = new google.maps.Map(document.getElementById('map'), {
         		zoom: 3,
         		center: uluru,
         		styles: [{
         				elementType: 'geometry',
         				stylers: [{
         					color: '#64DDBA'
         				}]
         			},
         			{
         				elementType: 'labels.text.stroke',
         				stylers: [{
         					color: '#64DDBA'
         				}]
         			},
         			{
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#34495E'
         				}]
         			},
         			{
         				featureType: 'administrative.locality',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#8A8A8A'
         				}]
         			},
         			{
         				featureType: 'poi',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#8A8A8A'
         				}]
         			},
         			{
         				featureType: 'poi.park',
         				elementType: 'geometry',
         				stylers: [{
         					color: '#263c3f'
         				}]
         			},
         			{
         				featureType: 'poi.park',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#6b9a76'
         				}]
         			},
         			{
         				featureType: 'road',
         				elementType: 'geometry',
         				stylers: [{
         					color: '#ABABAB'
         				}]
         			},
         			{
         				featureType: 'road',
         				elementType: 'geometry.stroke',
         				stylers: [{
         					color: '#212a37'
         				}]
         			},
         			{
         				featureType: 'road',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#9ca5b3'
         				}]
         			},
         			{
         				featureType: 'road.highway',
         				elementType: 'geometry',
         				stylers: [{
         					color: '#34495E'
         				}]
         			},
         			{
         				featureType: 'road.highway',
         				elementType: 'geometry.stroke',
         				stylers: [{
         					color: '#1f2835'
         				}]
         			},
         			{
         				featureType: 'road.highway',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#f3d19c'
         				}]
         			},
         			{
         				featureType: 'transit',
         				elementType: 'geometry',
         				stylers: [{
         					color: '#2f3948'
         				}]
         			},
         			{
         				featureType: 'transit.station',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#8A8A8A'
         				}]
         			},
         			{
         				featureType: 'water',
         				elementType: 'geometry',
         				stylers: [{
         					color: '#F2F6FF'
         				}]
         			},
         			{
         				featureType: 'water',
         				elementType: 'labels.text.fill',
         				stylers: [{
         					color: '#BCBCBC'
         				}]
         			},
         			{
         				featureType: 'water',
         				elementType: 'labels.text.stroke',
         				stylers: [{
         					color: '#F2F6FF'
         				}]
         			}
         		]
         	});
         	var contentString = '<div id="content">' +
         		'<div id="bodyContent">' +
         		'<div class="card card-list"><a href="#"><span class="badge badge-success">For Sale</span><img class="card-img-top" src="img/list/2.png" alt="Card image cap"><div class="card-body"><h5 class="card-title">House in Kent Street</h5><h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i> 127 Kent Sreet, Sydny, NEW 2000</h6><h2 class="text-success mb-0 mt-3">$130,000 <small>/month</small></h2></div><div class="card-footer"><span><i class="mdi mdi-sofa"></i> Beds : <strong>3</strong></span><span><i class="mdi mdi-scale-bathroom"></i> Baths : <strong>2</strong></span><span><i class="mdi mdi-move-resize-variant"></i> Area : <strong>587 sq ft</strong></span></div></a> </div>' +
         		'</div>' +
         		'</div>';
         
         	var infowindow = new google.maps.InfoWindow({
         		content: contentString,
         		maxWidth: 300
         	});
         	var image = 'img/marker.png';
         	var marker = new google.maps.Marker({
         		position: uluru,
         		map: map,
         		icon: image
         	});
         	marker.addListener('click', function() {
         		infowindow.open(map, marker);
         	});
         }
          
      </script>
       <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsOUkZbTEwLxeUN5Qfag6Vr5BjngCGMY&callback=initMap"></script>
     
    