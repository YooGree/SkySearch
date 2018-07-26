<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 500 Page -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-8 mx-auto text-center">
				 <h1> ERROR 500 
				</h1> 
				<h1>Sorry, we had some technical problems during your last operation.</h1>
				<p class="land">서비스 사용에 불편을 끼쳐드려서 대단히 죄송합니다. 빠른시간내에 문제를 처리하겠습니다.</p>
				<div class="mt-5">
					<a href="<c:url value='/'/>" class="btn btn-success btn-sm"><i
						class="mdi mdi-home"></i> GO TO HOME PAGE</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End 500 Page -->
