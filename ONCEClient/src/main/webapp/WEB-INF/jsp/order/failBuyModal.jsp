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
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#modal').modal('show');
	
});
</script>
</head>
<body>
	<div id="modal" class="modal">
		<div class="modal-content">
			<h5>알림</h5><br/>
			<hr>
			<h6>구매 불가</h6>
			<c:forEach var="failBuy" items="${failBuyList}">
				<p>상품: <span>${ failBuy.itemName }</span></p>
				<c:forEach var="canCnt" items="${canBuyCnt }">
				</c:forEach>
				<c:choose>
					<c:when test="${ canCnt eq 0 }">
						<p>죄송합니다. 현재 해당 상품은 '품절'입니다.</p>
					</c:when>
					<c:otherwise>
						<p>재고: <span>${ canCnt }</span></p>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
			<p>죄송합니다. 확인 버튼을 누르신 후, 해당 상품(들)의 수량을 조정해주시기 바랍니다.</p>
			<div class="modal-footer">
				<input type="button" class="modal-action modal-close button" onclick="paySubmit(${loop.index})" value="확인">
			</div>
		</div>
	</div>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
</body>
</html>