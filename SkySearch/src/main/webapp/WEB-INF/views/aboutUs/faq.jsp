<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
  
      <!-- Inner Header -->
      <section class="section-padding bg-dark inner-header">
         <div class="container">
            <div class="row">
               <div class="col-md-12 text-center">
                  <h1 class="mt-0 mb-3 text-white">FAQ</h1>
                  <div class="breadcrumbs">
                     <p class="mb-0 text-white"><a class="text-white" href="#">About Us</a>  /  <span class="text-success">FAQ</span></p>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Inner Header -->
      <!-- FAQ -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 col-md-8 mx-auto">
                  <div class="card padding-card">
                     <div class="card-body">
                        <div id="accordion" role="tablist" aria-multiselectable="true">
                           <div class="faq-card mb-3">
                              <div class="faq-card-header mb-2" role="tab" id="headingOne">
                                 <h5 class="mb-0">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="mdi mdi-arrow-right-bold-box"></i>   비밀번호를 잊어버렸습니다. 어떻게 찾을 수 있나요? 
                                    </a>
                                 </h5>
                              </div>
                              <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                                 <p>- 로그인 화면에서 'Forget your ID or Password?'를 클릭하세요. 가입시 기입한 회원 ID, 이름을 입력하면 비밀번호를 알려드립니다.
                                 </p>
                              </div>
                           </div>
                           <p> </p>
                           <div class="faq-card mb-3">
                              <div class="faq-card-header mb-2" role="tab" id="headingTwo">
                                 <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="mdi mdi-arrow-right-bold-box"></i> 회원을 탈퇴하려면 어떻게 하나요? 
                                    </a>
                                 </h5>
                              </div>
                              <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                                 <p>- 로그인 후, 마이페이지의 '회원 탈퇴'에서 탈퇴를 신청하시면 됩니다. <br>- 탈퇴 시에는 귀하의 정보와 댓글 내용이 삭제되며 사이트 이용에 제한이 있습니다. 신중히 고려하시기 바랍니다.
                                 </p>
                              </div>
                           </div>
                           <p> </p>
                           <div class="faq-card mb-3">
                              <div class="faq-card-header mb-2" role="tab" id="headingThree">
                                 <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="mdi mdi-arrow-right-bold-box"></i> 회원 정보를 어떻게 수정하나요? 
                                    </a>
                                 </h5>
                              </div>
                              <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                                 <p>- 로그인 후, 마이페이지에서 회원 정보를 수정하실 수 있습니다. '회원정보 수정'에서 비밀번호 변경, 휴대전화 번호, 관심 지역을  수정하실 수 있습니다. 
                                                      <br>- 회원 아이디 변경을 원하실 경우에는 skysearch2018@gmail.com 로 문의해 주시기 바랍니다.  
                                 </p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End FAQ -->

