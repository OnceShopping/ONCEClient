<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	var changePage;
	$('#modal').modal('show');
	
});
</script>
</head>
<body>
	<div id="modal" class="modal">
		<div class="modal-content">
			<h5>알림</h5><br/>
			<hr>
			<h6>상품 수령 장소</h6>
			<select id="info" name="floor" class="form-control browser-default" onchange="optionChange(this)">
			<c:forEach var="info" items="${infoList}">
				<option value="${info.floor}">${info.floor}</option>
			</c:forEach>
			</select>
			<p>수령 장소 선택 시 고객님께서 선택한 안내 데스크에서 주문하신 상품을 수령하실 수 있습니다.</p>
			<hr>
			<h6>수령 비밀 번호</h6>
			<input type="text" value="${secretPassword}" disabled >
			<p>회원가입시 설정하신 수령 비밀번호입니다. 회원정보수정에서 수정 하실 수 있습니다.</p>
			<div class="modal-footer">
				<input type="button" class="modal-action modal-close button" onclick="paySubmit(${loop.index})" value="확인">
			</div>
		</div>
	</div>
</body>