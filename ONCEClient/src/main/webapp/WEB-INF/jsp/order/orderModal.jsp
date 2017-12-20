<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.transitions.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#orderModal').modal('show');
	
});

function showOrerPwd(){
	
	var floor =$('#floor').val();
	
	$.ajax({
		url : "${ pageContext.request.contextPath }/orderList/showOrderPwd",
		type : "get",
		data : {
			'floor' : floor
		},
		success : function(data) {
			$('#orderModal').html("");
			$('#orderModal').html(data);
			$('#orderModal').modal('show');
		}
	});	
}

</script>
</head>
<body style="background-color :#ddd;">
		
	<!-- modals -->
	<div class="modals-app app-pages app-section">
		<div class="container">
		<div class="modal" style="display: inline-table;"  id="orderModal" >
		<div class="modal-content">
			<h4 class="modal-title" id="exampleModalLabel">결 제 완 료</h4>
			<hr style="margin-top: 5px; border-top: 1px solid #999;"/>
			<h5>상품 수령 장소</h5>
			<select id="floor" name="floor" class="form-control browser-default">
			<c:forEach var="info" items="${infoList}">
				<option value="${info.floor}">${info.floor}</option>
			</c:forEach>
			</select>
			<br/>
			<p style="font-size: 10px">&nbsp;<span style="font-weight: bold;">상품 준비 완료</span> 시, 고객님께서 선택한 안내 데스크에서 주문하신 상품을 수령하실 수 있습니다.</p>
			<div class="modal-footer" style="background-color: #fff; border-top: 1px solid #ccc;">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="showOrerPwd()">다 음</button>
			</div>
		</div>
	</div>
	</div>
	</div>	
	<!-- end modal -->
</body>
</html>