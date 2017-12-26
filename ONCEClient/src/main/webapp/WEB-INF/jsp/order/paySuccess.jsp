<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>Creative - Multipurpose Mobile Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="HandheldFriendly" content="True">
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.transitions.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	
  	<!-- checkout -->
	<div class="checkout app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>결 제 완 료 </h3>
			</div>
			<div class="order">
				<h5 class="title">${order.storeName}</h5>
				<br/>
				<c:forEach var="detail" items="${order.orderDetails}" varStatus="status">
					<div class="row" style="margin: 10px;">
						<h6>${detail.itemName}<br/><span style="font-size:12px; margin-left: 5px;">(${detail.count}개&nbsp;|&nbsp;${detail.color}&nbsp;|&nbsp;${detail.size})</span></h6>
						<div class="col s8">
						</div>
						<div id="price_${status.index}" class="col s4 text-right">
							<h6>${detail.price}원</h6>
						</div>
					</div>
					<hr/><br/>
				</c:forEach>
				<div class="order">
					<div class="col s8">
						<h5><span style="font-size: 15px;">총 결재금액</span></h5>
					</div>
					<div class="col s4 text-right">
						<h5><span>${order.totalPrice}원</span></h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" flush="false"></jsp:include>
	
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" flush="false"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>