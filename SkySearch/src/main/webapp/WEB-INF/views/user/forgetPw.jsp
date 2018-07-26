<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

    <!-- 비밀번호 찾기 실패시 -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4 mx-auto">
                  <div class="card padding-card">
                     <!-- 비밀번호찾기 -->
                    <div class="card-body">
                        <h5 class="card-title mb-4">Find Password</h5>
                       <form role="form" action="<c:url value='/user/pwFind'/>" method="POST">
                           <div class="form-group">
                             <p><font color="red">비밀번호 찾기 실패! 다시 입력하세요</font></p>
                              <label>Member ID<span class="text-danger">*</span></label>
                              	<input type="email" name="email" class="form-control" placeholder="Enter your Member ID">
                              <label>Name<span class="text-danger">*</span></label>
                              	<input type="text" name="name"class="form-control" placeholder="Enter your NAME">
                              <p> </p>  
                                <!-- <input type="button" class="btn btn-warning btn-block" value="인증번호 받기" onclick="idcheck()"> -->
                           </div>
                           <div class="form-group">
  	                       		<!-- <input type="text" class="form-control" placeholder="인증번호 4자리를 입력하세요">
						   		<input type="button" class="btn btn-danger btn-block" value="카운트 3분!!"> -->
                                <button type="submit" class="btn btn-success btn-block">비밀번호 찾기</button>
                          </div>
                      </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End 비밀번호 찾기 실패시 -->
  