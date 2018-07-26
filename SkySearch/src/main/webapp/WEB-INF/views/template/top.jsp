<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!-- Navbar -->
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand text-success logo" href="<c:url value='/'/>"
				style="font-size: 30px;"> <i class="mdi mdi-airplane-takeoff"
				style=""></i> <strong>SKY Search</strong></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0 margin-auto">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/'/>" id="navbarDropdownPortfolio"
						aria-haspopup="true" aria-expanded="false"> <strong>HOME</strong>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/specialEvent/main'/>"
						id="navbarDropdownPortfolio" aria-haspopup="true"
						aria-expanded="false"> <strong>항공권 특가</strong>
					</a></li>
					<li class="nav-item"><c:set var="principalName"
							value="${pageContext.request.userPrincipal.name}" /> <a
						class="nav-link"
						href="<c:url value='/tripInfo/main'/>?EMAIL=${principalName}&SORT_VALUE=CITY_VIEWS"
						id="navbarDropdownPortfolio" aria-haspopup="true"
						aria-expanded="false"> <strong>여행 정보</strong>
					</a></li>
					<li class="nav-item"><c:set var="memberID"
							value="${pageContext.request.userPrincipal.name}" /> <c:choose>
							<c:when test="${memberID == null}">
								<a class="nav-link" href="#" id="navbarDropdownPortfolio"
									aria-haspopup="true" aria-expanded="false"
									style="display: none">My page</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link"
									href="<c:url value='/mypage/read?EMAIL=${principalName}'/>"
									id="navbarDropdownPortfolio" aria-haspopup="true"
									aria-expanded="false"> <strong>My page</strong></a>
							</c:otherwise>
						</c:choose></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> About Us </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="<c:url value='/aboutUs/aboutus'/>">About
								Us</a> <a class="dropdown-item" href="<c:url value='/aboutUs/faq'/>">FAQ</a>
							<a class="dropdown-item" href="<c:url value='/aboutUs/contact'/>">Contact
								Us</a>
						</div></li>
						
					<li class="nav-item">
						<!-- system과 admin의 경우에만 관리자페이지탭 생성 --> <c:set var="pName"
							value="${pageContext.request.userPrincipal.name}" /> <c:choose>
							<c:when test="${pName =='system@skysearch.com'}">
								<a class="nav-link" href="<c:url value='/manage/main/index'/>"
									id="navbarDropdownPortfolio" aria-haspopup="true"
									aria-expanded="false" style="display: ''"> <strong>Manage
								</strong>
								</a>
							</c:when>
							<c:when test="${pName =='admin@skysearch.com'}">
								<a class="nav-link" href="<c:url value='/manage/main/index'/>"
									id="navbarDropdownPortfolio" aria-haspopup="true"
									aria-expanded="false" style="display: ''"> <strong>Manage
								</strong>
								</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="<c:url value='#'/>"
									id="navbarDropdownPortfolio" aria-haspopup="true"
									aria-expanded="false" style="display: none"> <strong>Manage
								</strong>
								</a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
				<%--로그인 전:signup, login버튼 -> 로그인 후:회원 ID, logout버튼으로 바뀜--%>
				<div class="my-2 my-lg-0">
					<ul class="list-inline main-nav-right">
						<li class="list-inline-item"><c:set var="principalName"
								value="${pageContext.request.userPrincipal.name}" /> <c:choose>
								<c:when test="${principalName == null}">
									<a class="btn btn-success btn-sm" href='/SkySearch/signup'><i
										class="mdi mdi-account-settings"></i>SignUp</a>
								</c:when>
								<c:otherwise>
									<a href="#"><i class="mdi mdi-account-settings"></i>${principalName}</a>
								</c:otherwise>
							</c:choose></li> &nbsp;
						<li class="list-inline-item"><c:set var="principalName"
								value="${pageContext.request.userPrincipal.name}" /> <a
							class="btn btn-success btn-sm"
							href=${principalName == null ? '/SkySearch/login' : '/SkySearch/j_spring_security_logout' }>
								<i class="mdi mdi-login"></i>${principalName == null ? 'Login' : 'Logout' }</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</header>
<!-- End Navbar -->