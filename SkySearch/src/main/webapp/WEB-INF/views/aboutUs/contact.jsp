<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

    <!-- Inner Header -->
      <section class="section-padding bg-dark inner-header">
         <div class="container">
            <div class="row">
               <div class="col-md-12 text-center">
                  <h1 class="mt-0 mb-3 text-white">Contact Us</h1>
                  <div class="breadcrumbs">
                     <p class="mb-0 text-white"><a class="text-white" href="#">About Us</a>  /  <span class="text-success">Contact</span></p>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Inner Header -->
      
      <!-- Contact Us -->
      <section class="section-padding" >
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4">
                  <h3 class="mt-1 mb-5">Get In Touch</h3>
                  <h6 class="text-dark"><i class="mdi mdi-home-map-marker"></i> Address :</h6>
                  <p>MultiCampus, 121, Teheran-ro, Gangnam-gu, Seoul, Republic of Korea</p>
                  <h6 class="text-dark"><i class="mdi mdi-phone"></i> Phone :</h6>
                  <p>Tel. 02-3429-5114</p>
                  <h6 class="text-dark"><i class="mdi mdi-deskphone"></i> Mobile :</h6>
                  <p>(+20) 010-2650-6850</p>
                  <h6 class="text-dark"><i class="mdi mdi-email"></i> Email :</h6>
                  <p>skysearch2018@gmail.com</p>
                  <h6 class="text-dark"><i class="mdi mdi-link"></i> Website :</h6>
                  <p>www.skysearch.com</p>
                  
                  <div class="footer-social"><span>Follow : </span>
                     <a href="https://ko-kr.facebook.com/"><i class="mdi mdi-facebook"></i></a>
                     <a href="https://twitter.com/?lang=ko"><i class="mdi mdi-twitter"></i></a>
                     <a href="https://www.instagram.com/?hl=ko"><i class="mdi mdi-instagram"></i></a>
                     <a href="https://www.google.com/"><i class="mdi mdi-google"></i></a>
                  </div>
               </div>
               <div class="col-lg-8 col-md-8">
                  <div class="card">
                     <div class="card-body">
                        <div id="map"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <hr>
      <!-- End Contact Us -->
      
      <!-- send 버튼 누르면 관리자에게 문의사항 전송됨 -->
       <!-- Contact Me -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-6 col-md-6 mx-auto">
				<form class="col-lg-12 col-md-12" method="post" action="<c:url value='/aboutUs/sendmsg'/>" name="sentMessage" id="contactForm" novalidate>
                   <input type="hidden" name="forwardView" value="/aboutUs/contact" /> <%--보이는 곳과 가는곳이 다름--%>
					<div class="card padding-card">
						<div class="card-body">
							<h4 class="card-title mb-4">Contact Us</h4>
							<p>문의 사항이 있다면 연락주세요</p>
							<div class="form-group">
								<label>Full Name <span class="text-danger">*</span></label>
								<input type="text" placeholder="Full Name" class="form-control" id="name" name="NAME" required data-validation-required-message="Please enter your name.">
							</div>
							<div class="form-group">
							 	<label>Phone Number <span class="text-danger">*</span></label>
                          	    <input type="tel" placeholder="Phone Number" class="form-control" id="phone" name="PHONE" required data-validation-required-message="Please enter your phone number.">
							</div>
							<div class="form-group">
								<label>Email Address <span class="text-danger">*</span></label>
                                <input type="email" placeholder="Email Address"  class="form-control" id="email" name="EMAIL" required data-validation-required-message="Please enter your email address.">
                     		</div>
							<div class="form-group">
						    	 <label>Message <span class="text-danger">*</span></label>
                    	         <textarea rows="5" cols="100" placeholder="Message"  class="form-control" id="message" name="CONTACT_TEXT" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
        					</div>
							<div align="center">
						      <button type="submit" class="btn btn-success col-5">Send Message</button>
						    </div>
						</div>
					</div>
				</form>
			</div>
           </div>
         </div>
      </section>
      <!-- End Contact Me -->

      <!-- Google Map Api -->
      <script>
         function initMap() {
         	var uluru = {
         		lat: 37.501613,
         		lng: 127.039660
         	
         	};
         	var map = new google.maps.Map(document.getElementById('map'), {
         		zoom: 15,
         		center: uluru
         		
         	});
         	var contentString = '<div id="content">' +
         		'<div class="pl-3 pr-3 pt-3 pb-3" id="bodyContent">' +
         		'<h6 class="text-dark"><i class="mdi mdi-home-map-marker"></i> Address :</h6><p>MultiCampus, 121, Teheran-ro, Gangnam-gu, Seoul, Republic of Korea</p><h6 class="text-dark"><i class="mdi mdi-phone"></i> Phone :</h6><p>Tel. 02-3429-5114</p><h6 class="text-dark"><i class="mdi mdi-deskphone"></i> Mobile :</h6><p>(+20) 010-2650-6850</p><h6 class="text-dark"><i class="mdi mdi-email"></i> Email :</h6><p>skysearch2018@gmail.com</p><h6 class="text-dark"><i class="mdi mdi-link"></i> Website :</h6><p>www.skysearch.com</p>' +
         		'</div>' +
         		'</div>';
           		
         		
         		
         		
         	var infowindow = new google.maps.InfoWindow({
         		content: contentString,
         		maxWidth: 300
         	});
         	var image = '<c:url value='/resources/img/marker.png'/>';
         	var marker = new google.maps.Marker({
         		position: uluru,
         		map: map,
         	});
         	marker.addListener('click', function() {
         		infowindow.open(map, marker);
         	});
         }
          
      </script>
      <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUsOUkZbTEwLxeUN5Qfag6Vr5BjngCGMY&callback=initMap"></script>
   </body>
</html>

