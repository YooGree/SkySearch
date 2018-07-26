<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link type="text/css" href="<c:url value='/resources/css/mainmc.css'/>" rel="stylesheet" />

<!-- 비밀번호 재확인 -->
<script>
 $(function(){
  $('#PASSWORD1').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#PASSWORD2').keyup(function(){
   if($('#PASSWORD1').val()!=$('#PASSWORD2').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("비밀번호 불일치");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("비밀번호 일치");
   }
  }); //#chpass.keyup
 });
</script>

      <!-- Inner Header -->
      <section class="section-padding bg-dark inner-header1">
         <div class="container">
            <div class="row">
               <div class="col-md-12 text-center">
                  <h1 class="mt-0 mb-3 text-white">My Page</h1>
                  <div class="breadcrumbs">
                     <p class="mb-0 text-white"><a class="text-white" href="#">My Page</a>  /  <span class="text-success">회원 탈퇴</span></p>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Inner Header -->
 
  <!-- mypage tab -->      
      <section class="tab-view">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <ul class="nav justify-content-center">
                     <c:set var="principalName" value="${pageContext.request.userPrincipal.name}" /> 
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/mypage/read?EMAIL=${principalName}'/>">내 정보</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/mypage/edit?EMAIL=${principalName}'/>">회원정보 수정</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link active text-success" href="<c:url value='/mypage/withdrawal?EMAIL=${principalName}'/>">회원 탈퇴</a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </section>
 <!-- END mypage tab -->     
             
      <!-- 회원탈퇴 -->
      <%-- DB에서 회원 시퀀스에 해당하는 회원의 정보를 delete(실제론 update, enable을 Y->N으로 바꿈 ) --%>

      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4 mx-auto">
               <fieldset>
                    <c:if test="${not empty param.fail}">
						<font color="red"> 회원탈퇴 실패! 다시 시도해보세요.<br/> Reason: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}<br/>
						</font><br/>
					</c:if>
                </fieldset> 
                 <form role="form" method="POST" action="<c:url value='/mypage/disable'/>">
                 <input type="hidden" name="forwardView" value="/mypage/withdrawalC" />
                 	<div class="card padding-card">
                    	<div class="card-body">
                        	<h4 class="card-title mb-4">회원 탈퇴</h4>
                        	<p>회원 아이디와 비밀번호를 입력하세요</p>
                           	<div class="form-group">
                            	<label>Member ID <span class="text-danger">*</span></label>
                            	<input id="EMAIL" type="email" name="email" class="form-control" placeholder="Enter your Member ID">
                            	<br>
                            	<label>Password <span class="text-danger">*</span></label>
                            	<input id="PASSWORD1" type="password" name="PASSWORD" class="form-control" placeholder="Enter your Password" >
                            	<br>
                            	<label>Password Confirm<span class="text-danger">*</span><font name="check" size="2" color="red"></font></label>
                            	<input id="PASSWORD2" type="password" name="password" class="form-control" placeholder="Enter your Password again">
                           	</div>
                           	<br>
                           	<div align="center">	
				            	<button type="submit" class="btn btn-success col-4">회원 탈퇴</button>
				                <button type="reset" class="btn btn-default col-4">RESET</button>
				            </div>
					 	</div> 
					</div>	
               </form> 
               </div>
            </div>
         </div>
      </section>
      <!-- End 회원탈퇴 -->
