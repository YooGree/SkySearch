<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

    <!-- 비밀번호찾기 결과 -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4 mx-auto">
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">비밀번호 검색 결과</h5>
                        <br>
                           <div class="form-group">
                              <p><label>Password : </label></p>
                              <h5>${resultMap.PASSWORD}</h5>
                              <br>
						   </div>
						   <div align="center">
						   	<a class="btn btn-success col-5" role="button" href="<c:url value='/login' />">Login</a>
						   	<a class="btn btn-default col-5" role="button" href="<c:url value='/' />">Home</a>
                           </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End 비밀번호찾기 결과 -->
  