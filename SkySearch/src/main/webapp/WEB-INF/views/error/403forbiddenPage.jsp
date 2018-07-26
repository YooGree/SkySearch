<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 403 Page -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-8 mx-auto text-center">
				 <h1> 403 Forbidden
				</h1> 
				<h1>You do not have permission to access on this server.</h1>
				<p class="land">요청하신 페이지 접근이 거부되었습니다</p>
				<div class="mt-5">
					<a href="<c:url value='/'/>" class="btn btn-success btn-sm"><i
						class="mdi mdi-home"></i> GO TO HOME PAGE</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End 403 Page -->
