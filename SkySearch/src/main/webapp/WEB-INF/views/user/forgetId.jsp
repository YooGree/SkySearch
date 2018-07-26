<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

    <!-- 아이디찾기 실패시 -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4 mx-auto">
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">Find Member ID</h5>
                        <form role="form" action="<c:url value='/user/idFind'/>" method="POST">
                           <div class="form-group">
                           <p><font color="red">아이디 찾기 실패! 다시 입력하세요</font></p>
                              <label>Name <span class="text-danger">*</span></label>
                              	<input type="text" name="name" class="form-control" placeholder="Enter your NAME">
                              <label>Phone Number <span class="text-danger">*</span></label>
                              	<input type="text" name="phone"class="form-control" placeholder="Enter your Phone Number">
                           </div>
                           <button type="submit" class="btn btn-success btn-block">아이디 찾기</button>
                           <br>
                         </form>
                     </div>
                 </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End 아이디찾기 실패시 -->
  