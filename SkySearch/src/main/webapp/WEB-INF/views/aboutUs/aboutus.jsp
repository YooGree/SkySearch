<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

    <!-- Inner Header -->
      <section class="section-padding bg-dark inner-header">
         <div class="container">
            <div class="row">
               <div class="col-md-12 text-center">
                  <h1 class="mt-0 mb-3 text-white">About Us</h1>
                  <div class="breadcrumbs">
                     <p class="mb-0 text-white"><a class="text-white" href="#">About Us</a>  /  <span class="text-success">About Us</span></p>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Inner Header -->
      
      <!-- About -->
      <section class="section-padding bg-white">
         <div class="container">
            <div class="row" style="margin-left:17%">
               <div class="pl-4 col-lg-5 col-md-5 pr-4" >
                <img class="rounded img-fluid" src="<c:url value='/resources/img/logo.png'/>" alt="Card image cap">
               </div>
               <div class="col-lg-6 col-md-6 pl-5 pr-5">
               <!--    <h2 class="mt-5 mb-5">SKY Search</h2> -->
                  <h5 class="mt-2">항공권 특가 상품</h5>
                  <p>가장 빠르게 항공권 특가 정보를 제공합니다</p>
                  <h5 class="mt-4">인기 여행지 정보 제공</h5>
                  <p>쉽고 빠르게,나만의 여행 계획을 세워보세요</p>
               </div>
               
            </div>
         </div>
      </section>
      <!-- End About -->
      
<!-- Developer/Maganer 소개 -->
	<section class="section-padding">
         <div class="section-title text-center mb-5">
            <h2>프로젝트 팀 소개</h2>
            <p>6인조.(이승주, 유태근, 김민채, 정한다슬, 이민정, 김경철)</p>
         </div>
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4">
                  <div class="card padding-card">
                     <div class="card-body agents-card text-center">
                        <img class="img-fluid mb-4" src="<c:url value='/resources/img/user/seungju.jpg'/>" alt=""/>
                        <p class="mb-4">프로젝트 매니저를 맡고 있는 이승주 입니다. <br>돈 받고 팝니다...</p>
                        <h6 class="mb-0 text-success">이승주</h6>
                        <small>Project Manager, 회원관리 총괄</small>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4">
                  <div class="card padding-card">
                     <div class="card-body agents-card text-center">
                        <img class="img-fluid mb-4" src="<c:url value='/resources/img/user/taegun.jpg'/>" alt=""/>
                        <p class="mb-4">팀에서 귀여움과 외모를 담당하는 유태근 입니다 XD 뿌잉뿌잉.</p>
                        <h6 class="mb-0 text-success">유태근</h6>
                        <small>Trip Info 총괄</small>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4">
                  <div class="card padding-card">
                     <div class="card-body agents-card text-center">
                        <img class="img-fluid mb-4" src="<c:url value='/resources/img/user/minchae.jpg'/>" alt=""/>
                        <p class="mb-4">팀에서 FM겸 메인뷰,<br>회원을 담당하는 김민채 입니다.</p>
                        <h6 class="mb-0 text-success">김민채</h6>
                        <small>Publisher, 메인뷰, 마이페이지 담당</small>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-4 col-md-4">
                  <div class="card padding-card">
                     <div class="card-body agents-card text-center">
                        <img class="img-fluid mb-4" src="<c:url value='/resources/img/user/daseul.jpg'/>" alt=""/>
                        <p class="mb-4">はじめまして 정 한다슬 です。 <br> よろしくお願いいたします。それでは。 </p>
                        <h6 class="mb-0 text-success">정한다슬</h6>
                        <small>Manager Trip Info 총괄</small>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4">
                  <div class="card padding-card">
                     <div class="card-body agents-card text-center">
                        <img class="img-fluid mb-4" src="<c:url value='/resources/img/user/minjeong.jpg'/>" alt=""/>
                        <p class="mb-4">다른사이트보다 빠른 특가를 제공하는 사이트!<br> 팀에서 막내를 담당하고 있습니다ㅎㅎ.</p>
                        <h6 class="mb-0 text-success">이민정</h6>
                        <small>항공권 특가 Web Crawling 담당</small>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4">
                  <div class="card padding-card">
                     <div class="card-body agents-card text-center">
                        <img class="img-fluid mb-4" src="<c:url value='/resources/img/user/kkc.jpg'/>" alt=""/>
                        <p class="mb-4">관리자 메인 페이지를 담당한 김경철 입니다.</p>
                        <h6 class="mb-0 text-success">김경철</h6>
                        <small>Manager Main, Chart 담당</small>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
<!-- End Developer/Maganer 소개  -->  
