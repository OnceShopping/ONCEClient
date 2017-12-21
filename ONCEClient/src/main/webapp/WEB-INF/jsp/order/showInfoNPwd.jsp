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
			<h6>상품 수령 장소</h6>
			<p style="font-weight: bold;">${floor}</p>
			<p style="font-size: 10px">&nbsp;<span style="font-weight: bold;">상품 준비 완료</span> 시, 해당 안내 데스크에서 주문하신 상품을 수령하실 수 있습니다.</p>
			<br/>
			<h6>수령 비밀 번호</h6>
			<p style="font-weight: bold;">${secretPassword}</p>
			<p style="font-size: 10px;">회원가입시 설정하신 <span style="font-weight: bold;">수령 비밀번호</span>입니다. 회원정보수정에서 수정 하실 수 있습니다.</p>
			<div class="modal-footer" style="background-color: #fff; border-top: 1px solid #ccc;">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='${pageContext.request.contextPath }/orderList/paySuccess'">확인</button>
			</div>
		</div>
	</div>
	</div>
	</div>	
	<!-- end modal -->
	
</body>
</html>