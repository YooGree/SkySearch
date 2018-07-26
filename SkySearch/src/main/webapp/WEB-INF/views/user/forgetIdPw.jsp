<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


    <!-- 아이디, 비밀번호 찾기 -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4 mx-auto">
                  <div class="card padding-card">
                  <!-- 아이디 찾기 -->
                  <%-- 입력된 회원의 이름과 휴대폰 번호와 일치하는 회원의 정보를 DB에서 찾아 비교하여 존재한다면 아이디 알려줌 --%>
                     <div class="card-body">
                        <h5 class="card-title mb-4">Find Member ID</h5>
                        <form role="form" action="<c:url value='/user/idFind'/>" method="POST">
                           <div class="form-group">
                           <p>회원님의 이름과 휴대폰 번호를 입력하세요</p>
                              <label>Name <span class="text-danger">*</span></label>
                              	<input type="text" name="name" class="form-control" placeholder="Enter your NAME">
                                <label>Phone Number <span class="text-danger">*</span></label>
                              	<input type="text" name="phone"class="form-control" placeholder="Enter your Phone Number">
                           </div>
                           <button type="submit" class="btn btn-success btn-block" >아이디 찾기</button>
                           <br>
                         </form>
                     </div>
                     <!-- 비밀번호찾기 -->
                     <%-- 입력된 회원의 아이디와 이름이 일치하는 회원의 정보를 DB에서 찾아 비교하여 
                                      존재한다면 회원의 비밀번호를 알려준다  --%>
                     <div class="card-body">
                        <h5 class="card-title mb-4">Find Password</h5>
                       <form role="form" action="<c:url value='/user/pwFind'/>" method="POST">
                           <div class="form-group">
                              <p>회원님의 아이디와 이름,<br>인증번호를 받을 이메일 주소를 입력하세요</p>
                              <label>Member ID<span class="text-danger">*</span></label>
                              	<input type="email" name="email" class="form-control" placeholder="Enter your Member ID">
                              <label>Name<span class="text-danger">*</span></label>
                              	<input type="text" name="name"class="form-control" placeholder="Enter your NAME">
                               <p> </p>  
                               <%--  <input type="button" class="btn btn-warning btn-block" value="인증번호 받기" onclick="idcheck()"> --%>
                           </div>
                           <div class="form-group">
  	               <%--         <input type="text" class="form-control" placeholder="인증번호 4자리를 입력하세요">
						   		<input type="button" class="btn btn-danger btn-block" value="카운트 3분!!"> --%>
                           		<button type="submit" class="btn btn-success btn-block" >비밀번호 찾기</button>
                          </div>
                      </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End 아이디, 비밀번호 찾기 -->
  