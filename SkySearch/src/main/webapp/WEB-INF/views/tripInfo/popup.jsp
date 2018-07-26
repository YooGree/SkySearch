<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<form id="commentForm" name="commentForm" method="POST" action="<c:url value='/tripInfo/modComment'/>">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="row">
					<div class="col-lg-10 col-md-10">
						<select class="form-control custom-select" id="popstar">
							<c:if test="${resultMap.SS_STAR == 5}">
								<option value="5" selected="selected">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
							</c:if>
							<c:if test="${resultMap.SS_STAR == 4}">
								<option value="5">★★★★★</option>
								<option value="4" selected="selected">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
							</c:if>
							<c:if test="${resultMap.SS_STAR == 3}">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3" selected="selected">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
							</c:if>
							<c:if test="${resultMap.SS_STAR == 2}">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2" selected="selected">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
							</c:if>
							<c:if test="${resultMap.SS_STAR == 1}">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1" selected="selected">★☆☆☆☆</option>
							</c:if>
						</select>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-10 col-md-10">
						<textarea rows="3" cols="10" class="form-control" id="popcomment" onkeyup="countContents(this)">${resultMap.COMMENT_CON}</textarea>
					</div>
					<div class="col-lg-2 col-md-2">
						<div class="col-lg-1 col-md-1">
						<span><span id="modalComentCount">0</span>/500</span>
						</div>
						<button type="button" class="btn btn-success btn-block" value="${resultMap.COMMENT_SEQ}" onclick="ModComment(this.value);">등록</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		function countContents(element){
			document.getElementById("modalComentCount").innerHTML =element.value.length;
		}
	</script>

		<script>
		// 모달창에서 댓글 수정하기
		function ModComment(comseq) { 
 			var star = $('#popstar').val();
			var comment = $('#popcomment').val();
				            
			$.ajax({
				type : "GET", 
				url : "<c:url value='/ws/commentMod'/>", 
				data : { 
					"SS_STAR" : star,
					"COMMENT_CON" : comment,
					"COMMENT_SEQ" : comseq
				},
				success : function() { 
					alert('댓글이 수정되었습니다.');
					location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("오류발생");
					return false;
				}
			});
		}
		</script>
