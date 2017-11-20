<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</head>

<body>

	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->
	
	<section>
	
	<div class="table-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>My Page</h3>
			</div>
			<table class="">
				<tbody>
				<tr>
						<td><i class="fa fa-star"></i>&nbsp;&nbsp;매장 즐겨찾기</td>
						<td><i class="fa fa-gear"></i>&nbsp;&nbsp;회원 정보수정</td>
					</tr>
					<tr>
						<td><a href="${pageContext.request.contextPath}/mypage/shoppingCart"><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;장바구니</a></td>
						<td><i class="fa fa-commenting"></i>&nbsp;&nbsp;My Q&A</td>
					</tr>
					<tr>
						<td><i class="fa fa-truck"></i>&nbsp;&nbsp;주문 수령</td>
						<td><a href="${pageContext.request.contextPath}/mypage/faq"><i class="fa fa-question-circle"></i>&nbsp;&nbsp;FAQ</a></td>
					</tr>
					<tr>
						<td><i class="fa fa-credit-card-alt"></i>&nbsp;&nbsp;구매 내역</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	
	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp"></jsp:include>
	<!-- end navbar -->
	


</body>
</html>