<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link type="text/css"
	href="<c:url value='/resources/vendor/bootstrap/css/specialmj.css'/>"
	rel="stylesheet" />

<!-- SLIDER -->
<section class="osahan-slider">
<div id="osahanslider" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#osahanslider" data-slide-to="0" class="active"></li>
		<li data-target="#osahanslider" data-slide-to="1"></li>
		<li data-target="#osahanslider" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" role="listbox">
		<div class="carousel-item active"
			style="background-image: url('<c:url value='/resources/img/slider/sea2.jpg'/>')">
		</div>
		<div class="carousel-item"
			style="background-image: url('<c:url value='/resources/img/slider/sea3.jpg'/>')">
		</div>
		<div class="carousel-item"
			style="background-image: url('<c:url value='/resources/img/slider/sea4.jpg'/>')">
		</div>
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
			<div class="col-lg-12 col-md-12">
				<%
               int cnt = 0;
           		 %>
				<c:forEach items="${resultList}" var="resultList" varStatus="loop">
					<c:forEach items="${resultList}" var="resultData" varStatus="loop">
				<%
                     cnt++;
                  %>
				<%
                     if (cnt % 3 == 1) {
                  %>
						<div class="row">
				<%
                      }
                  %>

							<div class="col-lg-4 col-md-4">
								<div class="card card-list">
									<a href="${resultData.url}" target="_blank"> <img
										class="card-img-top" src="${resultData.img}"
										alt="${resultData.alt}">
										<div class="card-body">
											<h5 class="card-title">${resultData.title}</h5>
											<h6 class="card-subtitle mb-2 text-muted">${resultData.period}</h6>
										</div>
										<div class="card-footer">
											<span> <strong>${resultData.flight} </strong></span>
										</div>
									</a>
								</div>
							</div>
							<%
                  if(cnt %3 == 0){
                  %>
					</div>
				<%
                  }
                  %>

					</c:forEach>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<!-- END 특가 LIST -->
