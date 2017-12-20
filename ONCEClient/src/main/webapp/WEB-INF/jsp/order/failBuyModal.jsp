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
	
	$('#exampleModal').modal('show');
	
});

</script>
</head>
<body style="background-color :#ddd;">
	<!-- modals -->
	<div class="modals-app app-pages app-section">
		<div class="container">
		<div id="exampleModal" class="modal" style="display: inline-table;"  >
		<div class="modal-content">
			<h4 class="modal-title" id="exampleModalLabel">구 매 불 가</h4>
			<hr style="margin-top: 5px; border-top: 1px solid #999;"/>
			<c:forEach var="failBuy" items="${failBuyList}" varStatus="loop">
				<p><span>${ failBuy.itemName }</span>
				</p>
				<c:forEach var="canCnt" items="${canBuyCnt}" varStatus="status">
				<c:if test="${ loop.index eq status.index }">
					<c:choose>
					<c:when test="${ canCnt eq 0 }">
						<p style="font-size: 12px;">현재 해당 상품은 저희 사이트에 재고가 없습니다.</p>
					</c:when>
					<c:otherwise>
						<p>재고: <span>${canCnt}</span></p>
					</c:otherwise>
				</c:choose>
				</c:if>
				</c:forEach>
			</c:forEach>
			<hr/>
			<p style="font-size: 12px;">죄송합니다.<br/>
			해당 상품(들)의 수량을 조정해주시기 바랍니다.</p>
			<div class="modal-footer" style="background-color: #fff; border-top: 1px solid #ccc;">
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="yes" onclick="history.go(-2)">확인</button>
			</div>
		</div>
		</div>
		</div>
	</div>	
	<!-- end modal -->
</body>
</html>