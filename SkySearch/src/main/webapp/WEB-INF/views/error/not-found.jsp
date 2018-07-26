<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 404 Page -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-8 mx-auto text-center">
				<h1>
					<img class="img-fluid"
						src="<c:url value='/resources/img/404.png'/>" alt="404">
				</h1>
				<h1>맙소사! 페이지가 보이지 않네요 :(</h1>
				<p class="land">안타깝게도 찾고 계신 페이지가 이동되었거나 삭제되었습니다. 화이팅요 </p>
				<div class="mt-5">
					<a href="<c:url value='/'/>" class="btn btn-success btn-lg"><i
						class="mdi mdi-home"></i> GO TO HOME PAGE</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End 404 Page -->





