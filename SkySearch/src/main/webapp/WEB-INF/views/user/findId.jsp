<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%--회원ID 마스킹 --%>
<script>
 $(document).ready(function() {
	  var len = "${resultMap.EMAIL}".split('@')[0].length-3 ;  //  AB***@gamil.com
	  var result = "${resultMap.EMAIL}".replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');  
        $('#idMasking').text(result);
     }); 
 
</script>
       <!-- 아이디 찾기 결과 -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4 mx-auto">
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">아이디 찾기 결과</h5>
                        <br>
                           <div class="form-group">
                              <p><label>Member ID : </label></p>
                              <h5 id="idMasking" ></h5>
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
      <!-- End 아이디 찾기 결과 -->
  