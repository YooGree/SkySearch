<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.0.min.js' />"></script>

<!-- 관심지역 다중 클릭 체크박스 -->
<%-- DB에서 지역list 정보를 가져옴  --%>
<script>
	var fn_setFormTagCheckbox = function(url, id, params) {
		$
				.ajax({
					type : "POST",
					url : url,
					data : params,
					cache : false,
					success : function(data) {

						var formTag = "";
						$
								.each(
										data,
										function(i, item) {
										if(item.LOCAL_SEQ=="dummy_loc"){
											return true;
										}
											formTag += "<label class='checkbox-inline'>";
											formTag += '<input type=checkbox name="LOCAL_SEQ" value="'+item.LOCAL_SEQ+'">'
													+ item.LOCAL_NAME;
											formTag += '</label> ';
										});
						$('#' + id).html(formTag);

					},
					error : function(xhr, status, exception) {
						alert("Failure \n (" + status + ")");
						return false;
					}
				});
	}

	$(document).ready(function() {
		fn_setFormTagCheckbox("<c:url value='/ws/localList' />", "localDIV");

	});
</script>

<!-- 아이디 중복 체크 -->
<script type="text/javascript">
	var count = 0;
	function idcheck() {
	 var text = $("#EMAIL").val();
	 var regexp = /[0-9a-zA-Z]/; // 숫자,영문

	 for (var i = 0; i < text.length; i++) {
	 if (text.charAt(i) != " " && regexp.test(text.charAt(i)) == false) {
	 alert("한글이나 특수문자는 입력불가능 합니다."); 
	 return false;
	 }
	 }
	 overlapCheck();
	 } 

	function idcheck() {
		var param = "EMAIL" + ":" + $("#EMAIL").val();
		if ($("#EMAIL").val() == '' || $("#EMAIL").val() == null) {
			alert("아이디를 입력하세요");
			return false;
		}
		$.ajax({

			url : "<c:url value='/ws/idcheck'/>",
			type : "POST",
			data : {
				'EMAIL' : $("#EMAIL").val()
			},
			//cache : false,
			//async : false,
			dataType : "text",

			success : function(data) {
				if (data == "") {
					count = 1;
					alert("사용 가능한 아이디입니다.");
					document.getElementById('EMAIL').disabled = true;
				} else {
					alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
					return false;
				}
			},

			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code : " + request.status + "\r\nmessage : "
							+ request.reponseText + "\r\nerror : " + error);
				}
			}
		});
	} 
</script>

<!-- 비밀번호 재확인 -->
<script>
 $(function(){
  $('#PASSWORD').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#RePASSWORD').keyup(function(){
   if($('#PASSWORD').val()!=$('#RePASSWORD').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("비밀번호 불일치");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("비밀번호 일치");
   }
  }); //#chpass.keyup
 });
</script> 


<!-- 유효성검사 -->
<script>
function validityCheck(){
	//비밀번호 형식 6~12자리의 영문 대소문자와 숫자로만 입력
	var getPW = RegExp(/^[a-zA-Z0-9]{6,12}$/);
/*  //아이디 형식 : 이메일 
	var getID = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); */
	//이름형식 
	var getName= RegExp(/^[가-힝]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/);
	//폰번호 형식
	var getPhone = RegExp(/^01[016789]-\d{3,4}-\d{4}$/);
	//관심분야 check
	var intLocCheck = false;
	
	//아이디를 입력하지 않았을 경우(공백)
	if($("#EMAIL").val() == ""){
       alert("아이디를 입력해주세요");
       $("#EMAIL").focus();
       return false;
	}
	//비밀번호를 입력하지 않았을 경우(공백)
	if($("#PASSWORD").val() == ""){
       alert("비밀번호를 입력해주세요");
       $("#PASSWORD").focus();
       return false;
	}
	if($("#RePASSWORD").val() == ""){
	       alert("비밀번호 확인을 해주세요");
	       $("#RePASSWORD").focus();
	       return false;
		}
	//비밀번호의 유효성검사
	if(!getPW.test($("#PASSWORD").val())) {
      alert("비밀번호를 형식에 맞게 입력해주세요");
      $("#PASSWORD").val("");
      $("#PASSWORD").focus();
      return false;
      }
	if(!getPW.test($("#RePASSWORD").val())) {
	      alert("비밀번호를 형식에 맞게 입력해주세요");
	      $("#RePASSWORD").val("");
	      $("#RePASSWORD").focus();
	      return false;
	      }

     //이름 : 공백 확인   
    if($("#NAME").val() == ""){
      alert("이름을 입력해주세요");
      $("#NAME").focus();
      return false;
    }
     //이름 : 유효성 검사
    if (!getName.test($("#NAME").val())) {
      alert("이름을 형식에 맞게 입력해주세요");
      $("#NAME").val("");
      $("#NAME").focus();
      return false;
    }
    
    //폰번호 : 공백 확인   
    if($("#PHONE").val() == ""){
      alert("휴대전화 번호를 입력해주세요");
      $("#PHONE").focus();
      return false;
    } 
    //폰번호 : 유효성 검사
    if (!getPhone.test($("#PHONE").val())) {
      alert("휴대전화 번호를 형식에 맞게 입력해주세요");
      $("#PHONE").val("");
      $("#PHONE").focus();
      return false;
    }
    if (!(document.getElementById('EMAIL').disabled)) {
        alert("아이디 중복 체크를 눌러주세요");
        return false;
      }
    //관심지역 체크박스
    var count = 0;
     for(var i=0;i<$('[name="LOCAL_SEQ"]').length;i++){ 
   	  if($('input:checkbox[name="LOCAL_SEQ"]').eq(i).is(":checked") == true) {
		    	count++;
			if(count>=2){
				intLocCheck=true;
        break;}
        }
    } 
    	if(!intLocCheck){
      alert("관심지역을 하나 이상 체크해 주세요");
      return false;
    }
   	document.getElementById('EMAIL').disabled = false;	
 
} 
</script>

<!-- Sign Up form-->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-5 col-md-5 mx-auto">
                  <div class="card padding-card">
                     <div class="card-body">
                        <h3 class="card-title mb-4">SIGN UP</h3>
                        <p><span class="text-danger">*</span>는 필수 입력사항 입니다</p>
                        <form  method="POST" action="<c:url value='/member/merge'/>"  onsubmit="return validityCheck()">
                         <input type="hidden" name="forwardView" value="/home/login" /> 
                         <input type="hidden" name="signup" value="true" /> 
                           <div class="form-group">
                              <label>Member ID <span class="text-danger">*</span></label>
                             	 <input id="EMAIL" name="EMAIL" type="email" id="EMAIL" class="form-control" placeholder="Base form : mulcam@mulcam.com">
								 <p> </p>
								 <label><span><input type="button" class="btn btn-warning" value="아이디 중복 확인" onclick="idcheck()"></span></label> 
				           </div>
                           <div class="form-group">
                              <label>Password <span class="text-danger">*</span></label>
                              <input id="PASSWORD" name="PASSWORD" type="password" class="form-control" placeholder="6~12자리의 영문 대소문자와 숫자">
                           </div>
						   <div class="form-group">
                              <label>Password Reconfirm <span class="text-danger">*</span>  <font name="check" size="2" color="red"></font></label>
                              <input id="RePASSWORD" name="RePASSWORD" type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요">
                           </div> 
                           <div class="form-group">
                              <label>Full Name <span class="text-danger">*</span></label>
                              <input id="NAME" name="NAME" type="text" id="NAME" class="form-control" placeholder="Base form : 박보검">
                           </div>
                           <div class="form-group">
                              <label>Mobile Number <span class="text-danger">*</span></label>
                              <input id="PHONE" name="PHONE" type="text" id="PHONE" class="form-control" placeholder="010-1234-5678">
                           </div>
                           <!-- 관심지역 -->
                           <div class="form-group">
                        	<!-- <input type="hidden" name="LOCAL_SEQ" value="dummy_id"> -->
								<label> INTEREST LOCATION : <span class="text-danger">*</span>
								<p>관심 지역을 1곳 이상 선택하세요</p></label>
								<div id=localDIV></div>
							<input type=checkbox checked="checked" name="LOCAL_SEQ" style="opacity:0;" value="dummy_loc">	
							</div>
                          <div align="center">
	                           <button type="submit" id="btn" class="btn btn-success col-3">Sign Up</button>
                        </form>
	                           <button class="btn btn-default col-3" onclick="location.reload();">Reset</button>
                                                     </div>
                        <%-- <div class="mt-4 text-center login-with-social">
                           <button type="button" class="btn btn-facebook btn-block" onClick="location.href='https://ko-kr.facebook.com/'"><i class="mdi mdi-facebook"></i> Login With Facebook</button>
                           <button type="button" class="btn btn-twitter btn-block" onClick="location.href='https://twitter.com/?lang=ko/'"><i class="mdi mdi-twitter"></i> Login With Twitter</button>
                           <button type="button" class="btn btn-google btn-block" onClick="location.href='https://www.google.com/'"><i class="mdi mdi-google-plus"></i> Login With Google</button>
                        </div> --%>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Sign up form -->
      
   