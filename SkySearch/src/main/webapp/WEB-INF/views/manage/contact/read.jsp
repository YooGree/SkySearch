<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link type="text/css" href="<c:url value='/resources/css/mainmc.css'/>"
	rel="stylesheet" />


<!-- 관심지역 다중 클릭 체크박스 -->


<!-- Inner Header -->

<!--  END mypage tab -->

<!-- 회원정보수정 -->
<!-- 회원리스트로부터 회원 시퀀스에 해당하는 회원 정보를 가져와서 (read)에서 수정(edit), 회원번호, 아이디, 이름, 비밀번호는 변경 안된다 -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 mx-auto">
				<form role="form" method="POST"
					action="<c:url value='/manage/main/index' />">
					<input type="hidden" name="CONTACTUS_SEQ" value={$resultMap.CONTACTUS_SEQ}>
					<div class="card padding-card">
						<div class="card-body">
							<h4 class="card-title mb-4">Contact Us</h4>
							<p>${resultMap.EMAIL} 님의 문의사항</p>
							<div class="form-group">
								<label>Member ID :</label> <input type="EMAIL"
									class="form-control" name="EMAIL" value="${resultMap.EMAIL}" readonly>
							</div>
							<div class="form-group">
								<label>Name :</label> <input type="text" class="form-control"
									name="NAME" value="${resultMap.NAME}" readonly>
							</div>
							<div class="form-group">
								<label>Phone :</label> <input type="text" class="form-control"
									name="PHONE" value="${resultMap.PHONE}" readonly>
							</div>
							<div class="controls">
								<label>Message <span class="text-danger">*</span></label>
								<textarea rows="5" cols="100" placeholder="Message"
									class="form-control" id="message" name="CONTACT_TEXT" required
									data-validation-required-message="Please enter your message"
									maxlength="999" style="resize: none" readonly>${resultMap.CONTACT_TEXT}</textarea>
							</div>

							<br>
							<div align="center">
								<button type="submit" class="btn btn-success">OKAY</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- End 회원정보수정 -->

