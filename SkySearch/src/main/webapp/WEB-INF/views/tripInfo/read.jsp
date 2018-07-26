<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- 도시의 현재 날씨 api -->
<script>
   $(function() {
      var city = '${resultCityMap.CITY_ENAME}';
      var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=a91687f156153cd9318bcb65d0a2298e";
      
      $.ajax({
         url : apiURI,
         type : 'get',
         dataType : 'json',
         async : 'false',
         success: function(resp){
            //console.log(resp);
              
            var tag = "<p>현재 온도 : " + (Math.floor(resp.main.temp- 273.15)) + "℃</p>" +
                "<p>현재습도 : "+ (resp.main.humidity) + "％</p>" +
                "<p>날씨 : "+ (resp.weather[0].description) + "</p>" +
            /*  "<p>날씨 : "+ (resp.weather[0].main ) + "</p>" + */
                "<p>바람   : "+ resp.wind.speed + "m/s</p>" +
           /*  "<p>나라   : "+ resp.sys.country + "</p>" + 
                "<p>도시이름  : "+ resp.name + "</p>" +*/
                "<p>구름  : "+ (resp.clouds.all) +"％</p>";
                
                $('#temper').html(tag);
                
                var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png"
                $('#wicon').attr("src", imgURL)
      }
      })
   });
   
</script>

<!-- Property Single Slider header -->
<section class="osahan-slider">
   <div id="osahanslider" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
      	<c:choose>
      		<c:when test="${resultCityMap.CITY_SEQ==resultCityMap.SOURCE_UNIQUE_SEQ}">
      			<div class="carousel-item active" style="background-image: url('<c:url value='/resources/uploads/${resultCityMap.PHYSICALFILE_NAME}'/>')"></div>
      		</c:when>
      		<c:otherwise>
      			<div class="carousel-item active" style="background-image: url('<c:url value='/resources/uploads/mainnoimage.jpg'/>')"></div>
      		</c:otherwise>
      	</c:choose>
      </div>
   </div>

   <div class="property-single-title property-single-title-gallery">
       <div class="container">
           <div class="row">
                 <div class="col-lg-4 col-md-4">
                   <h1>${resultCityMap.CITY_NAME}</h1>
                   <h5>&nbsp;${resultCityMap.CITY_ENAME}</h5><!--  도시명  영문도시명 가져오기 -->
                     <h6><i class="mdi mdi-home">&nbsp;</i>${resultCityMap.CITY_ADD}</h6><!-- 국가명 > 도시명 가져오기 -->
                     <b class="mdi mdi-trending-up">&nbsp;조회수 : ${resultCityMap.CITY_VIEWS}</b>
               </div>
               
               <div class="col-lg-2 col-md-2">
                   <h5 class="mt-3" style="display:inline;">날씨</h5><!-- 현지 날씨정보 가져오기 -->
                   <img id="wicon" width="80" height="80">  
               </div>

             <!-- 도시의 현재 날씨  -->               
               <div class="col-lg-2 col-md-2" id="temper">
               </div>
                
             <!-- 현재의 환율정보 -->  
               <div class="col-lg-1 col-md-1">
                   <h5 class="mt-3">환율</h5>
                </div>
               <div class="col-lg-3 col-md-3">
    <!--Currency Converter widget by FreeCurrencyRates.com -->

   <div id='gcw_mainF1UzgR6P4' class='gcw_mainF1UzgR6P4'></div>
   <a id='gcw_siteF1UzgR6P4' href='https://freecurrencyrates.com/en/'></a>
   <script>
      function reloadF1UzgR6P4(){ 
         var sc = document.getElementById('scF1UzgR6P4');
          if (sc) sc.parentNode.removeChild(sc);
          sc = document.createElement('script');
          sc.type = 'text/javascript';
          sc.charset = 'UTF-8';
          sc.async = true;
          sc.id='scF1UzgR6P4';
          sc.src = 'https://freecurrencyrates.com/en/widget-vertical-editable?iso=USDEURJPYCNYXUL&df=1&p=F1UzgR6P4&v=fits&source=fcr&width=350&width_title=0&firstrowvalue=1&thm=A6C9E2,FCFDFD,4297D7,5C9CCC,FFFFFF,C5DBEC,FCFDFD,2E6E9E,000000&title=Currency%20Converter&tzo=-540';
          
          var div = document.getElementById('gcw_mainF1UzgR6P4');
          div.parentNode.insertBefore(sc, div);
          } 
      reloadF1UzgR6P4(); 
   </script>
   <!-- put custom styles here: .gcw_mainF1UzgR6P4{}, .gcw_headerF1UzgR6P4{}, .gcw_ratesF1UzgR6P4{}, .gcw_sourceF1UzgR6P4{} -->
   <!--End of Currency Converter widget by FreeCurrencyRates.com -->
           </div>
         </div>
      </div>
   </div>
</section>
<!-- End Property Single Slider header -->

<!-- Property Single Slider -->
<section class="section-padding">
	<div class="section-title text-center mb-5">
		<h2>${resultCityMap.CITY_NAME}의 추천 관광지</h2>
		<!-- 도시명 바뀜 -->
	</div>
	<!-- 메인 뷰 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="row">
					<c:forEach items="${resultLandmarkList}" var="resultData" varStatus="loop">
						<div class="col-lg-4 col-md-4">
							<div class="card blog-card">
								<c:choose>
									<c:when test="${resultData.TRAVEL_SEQ==resultData.SOURCE_UNIQUE_SEQ}">
										<img class="card-img-top" src="<c:url value = '/resources/uploads/${resultData.PHYSICALFILE_NAME}'/>" alt="Card image cap" style="height:30%;">	
									</c:when>
									<c:otherwise>
										<img class="card-img-top" src="<c:url value = '/resources/uploads/noimage.jpg'/>" alt="Card image cap" style="height:30%;">
									</c:otherwise>
								</c:choose>
								<div class="card-body">
									<h6>${resultData.LANDMARK_NAME}</h6>
									<!-- 관광지명  -->
									<h7>
									<i class="mdi mdi-map-marker-multiple">&nbsp;</i>${resultData.LANDMARK_ADDR}</h7>
									<!-- 관광지명 주소 -->
									<p class="mb-0">${resultData.LANDMARK_EXP}</p>
									<!-- 관광지에 대한 설명 -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<hr>
		<!-- 회원들이 쓴 글이 나타나는 공간 -->
		<!-- for문, pagenation을 이용(5개단위), 회원들이 올린 글이 실시간으로 리로드 되어야 함 -->
		<div class="section-title text-center mb-5">
			<h2>${resultCityMap.CITY_NAME} 커뮤니티</h2>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="card padding-card reviews-card">
					<div class="card-body">
						<!-- 댓글 리스트 : 최신이 위로 뜨게 함 -->
						<c:set var="principalName" value="${pageContext.request.userPrincipal.name}" /> 
						<c:forEach items="${resultCommentPaginationMap.resultList}" var="resultData" varStatus="loop">
							<div class="media mb-4" id="commentList">
								<div class="media-body">
									<h5 class="mt-0">
									${resultData.MEMBER_NAME}
												<c:if test="${resultData.MEMBER_EMAIL==principalName}"> 
												<span><small>${resultData.REGISTRY_DATE}&nbsp;&nbsp;
												<button type="button" class="btn btn-default btn-sm" value="${resultData.COMMENT_SEQ}" onclick="ModComment1(this.value);">수정</button>&nbsp;
												<button type="button" class="btn btn-default btn-sm" value="${resultData.COMMENT_SEQ}" onclick="DelComment(this.value);">삭제</button>
												</small></span>
												</c:if>
										<c:choose>
											<c:when test="${resultData.SS_STAR == 1}">
												<span class="star-rating float-right"> <i
													class="mdi mdi-star text-warning"></i> <small
													class="text-success">1/5</small>
												</span>
											</c:when>
											<c:when test="${resultData.SS_STAR == 2}">
												<span class="star-rating float-right"> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <small
													class="text-success">2/5</small>
												</span>
											</c:when>
											<c:when test="${resultData.SS_STAR == 3}">
												<span class="star-rating float-right"> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <small
													class="text-success">3/5</small>
												</span>
											</c:when>
											<c:when test="${resultData.SS_STAR == 4}">
												<span class="star-rating float-right"> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <small
													class="text-success">4/5</small>
												</span>
											</c:when>
											<c:when test="${resultData.SS_STAR == 5}">
												<span class="star-rating float-right"> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <i
													class="mdi mdi-star text-warning"></i> <small
													class="text-success">5/5</small>
												</span>
											</c:when>
											<c:otherwise>
												<!-- 별점이 0개 일때 아무것도 표시되지 않는다. -->
											</c:otherwise>
										</c:choose>
									</h5>
									<!-- 댓글 내용을 가져오는 부분 -->
									<p>${resultData.COMMENT_CON}</p>
								</div>
							</div>
						</c:forEach>
						<!-- END 댓글 -->
						
						<!-- 페이징 -->
						<c:set var="page" value="${resultCommentPaginationMap.pagination}" />
						<nav class="mt-5">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="<c:url value="/tripInfo/read?curPage=${page.prevPage}&CITY_SEQ=${resultCityMap.CITY_SEQ}&EMAIL=${principalName}"/>"><i class="mdi mdi-chevron-left"></i></a></li>
								<c:forEach var="pageNum" begin="${page.blockStart}" end="${page.blockEnd}">
									<c:choose>
										<c:when test="${pageNum==page.curPage}">
											<li class="page-item active"><a class="page-link" href="<c:url value="/tripInfo/read?curPage=${pageNum}&CITY_SEQ=${resultCityMap.CITY_SEQ}&EMAIL=${principalName}" />">${pageNum}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="<c:url value="/tripInfo/read?curPage=${pageNum}&CITY_SEQ=${resultCityMap.CITY_SEQ}&EMAIL=${principalName}" />">${pageNum}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="<c:url value="/tripInfo/read?curPage=${page.nextPage}&CITY_SEQ=${resultCityMap.CITY_SEQ}&EMAIL=${principalName}"/>"><i class="mdi mdi-chevron-right"></i></a></li>
							</ul>
						</nav>
						<!-- END 페이징 -->

						<script>
						// 댓글 동적으로 데이터베이스에 넣기
						function SetComment(cityseq) { // 도시시퀀스를 파라미터로 가져오고
 				         	var star = $('#star').val(); // 셀렉트박스의 평점 저장
				            var comment = $('#comment').val(); // 텍스트에어리어의 내용 저장
				            var memseq = $('#memseq').val(); // 멤버시퀀스 저장
				            
							$.ajax({
									type : "GET", // 값을 보낼 방식
									url : "<c:url value='/ws/commentSet'/>", // 보낼 컨트롤러
									data : { // 서버에 보낼 데이터 (key, value형식)
										"SS_STAR" : star,
										"COMMENT_CON" : comment,
										"CITY_SEQ" : cityseq,
										"MEMBER_SEQ" : memseq
									},
									success : function() { 
										alert('댓글이 입력되었습니다.');
										location.reload();
									},
									error : function(jqXHR, textStatus, errorThrown) {
										alert("로그인 후 이용해주세요.");
										return false;
									}
								});
							}
						
						// 수정버튼 클릭시 모달창 띄워주기	
						function ModComment1(value) {
							var params = {
									COMMENT_SEQ : value
							};
							var url = "<c:url value='/tripInfo/popup'/>";
							common.layerPopupParam(url,".modal", params);
							
						} 
						
						// 댓글 삭제하기
						function DelComment(commentseq) {
							var con = confirm("정말로 삭제하시겠습니까?");
							if(con == true) {
								$.ajax({
									type : "GET",
									url : "<c:url value='/ws/commentDel'/>",
									data : {
										"COMMENT_SEQ" : commentseq
									},
									
									success : function() {
										location.reload();
									},
									error : function(jqXHR, textStatus, errorThrown) {
										alert("오류발생");
										return false;
									}
								});									
							} else {
								return false;
							}
						}
						</script>

						<hr>	
							<form id="commentForm" name="commentForm" method="GET">
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="row">
											<div class="col-lg-2 col-md-2">
												<select class="form-control custom-select" id="star">
													<option value="5">★★★★★</option>
													<option value="4">★★★★☆</option>
													<option value="3">★★★☆☆</option>
													<option value="2">★★☆☆☆</option>
													<option value="1">★☆☆☆☆</option>
												</select>
											</div>
												<input type="hidden" id="memseq" value="${resultMemberMap.MEMBER_SEQ}"/>
											<div class="col-lg-9 col-md-9">
												<textarea rows="3" cols="50" class="form-control" name="contents" placeholder="댓글을 입력하세요. 불괘감을 주는 욕설과 악플은 삭제될 수 있습니다." id="comment" onkeyup="countContents(this)"></textarea>
											</div>
											<div class="col-lg-1 col-md-1">
												<span><span id="comentCount">0</span>/500</span>
												<button type="button" class="btn btn-success btn-block" onclick="SetComment(this.value)" value="${resultCityMap.CITY_SEQ}" style="height:55px;">등록</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						<hr>
					</div>
				</div>
				<!-- 회원들이 쓴 글이 나타나는 공간 끝 -->
			</div>
			<!-- 댓글 수정을 위한 모달창 -->
			<div class="modal fade" class="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"></div>

			<script>
			function countContents(element){
				document.getElementById("comentCount").innerHTML =element.value.length;
			}
			</script>

			<!-- 구글지도  -->
			<div class="col-lg-12 col-md-12">
				<div class="card padding-card">
					<div class="card-body">
						<div id="map"></div>
					</div>
				</div>
			</div>
			<!-- 구글 지도 끝 -->
		</div>
	</div>
	<!-- 메인 뷰 끝 -->
</section>
<!-- End Property Single Slider -->

<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b5175cdcb0ffdc9"></script>

<!-- Bootstrap core JavaScript -->
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- Contact form JavaScript -->
<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
<script src="<c:url value='/resources/js/jqBootstrapValidation.js'/>"></script>
<script src="<c:url value='/resources/js/contact_me.js'/>"></script>
<!-- select2 Js -->
<script src="<c:url value='/resources/vendor/select2/js/select2.min.js'/>"></script>
<!-- Custom -->
<script src="<c:url value='/resources/js/custom.js'/>"></script>
<c:set var="lat">${resultCityMap.CITY_LATITUDE}</c:set><!-- 위도값 받아오기 -->
<c:set var="lng">${resultCityMap.CITY_LONGITUDE}</c:set><!-- 경도값 받아오기 -->
<!-- Google Map Api -->
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
         	/* marker.addListener('click', function() {
         		infowindow.open(map, marker);
         	}); */
         }
      </script>
      
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsOUkZbTEwLxeUN5Qfag6Vr5BjngCGMY&callback=initMap"></script>