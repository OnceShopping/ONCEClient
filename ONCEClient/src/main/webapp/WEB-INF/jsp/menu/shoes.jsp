<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
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
<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.filterizr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom-portfolio.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

<style type="text/css">
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}
</style>
</head>
<body>

<header>
		<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section>
	<div class="portfolio portfolio-card column2 app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>신발</h3>
			</div>
			<ul class="portfolio-filter">
				<li data-filter="all" class="active">전체</li>
				<li data-filter="1">나이키</li>
				<li data-filter="2">아디다스</li>
				<li data-filter="3">반스</li>
			</ul>
			<div class="portfolio-item">
				<div class="row">
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/shoe4.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/shoe4.jpg" alt=""></a>
						<h5>나이키 신발1</h5>
						<p>75,400원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/shoe5.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/shoe5.jpg" alt=""></a>
						<h5>나이키 신발2</h5>
						<p>67,800원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/shoe6.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/shoe6.jpg" alt=""></a>
						<h5>아디다스 1</h5>
						<p>109,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/shoe7.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/shoe7.jpg" alt=""></a>
						<h5>아디다스 2</h5>
						<p>98,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/shoe8.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/shoe8.jpg" alt=""></a>
						<h5>반스 신발1</h5>
						<p>59,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/shoe9.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/shoe9.jpg" alt=""></a>
						<h5>반스 신발2</h5>
						<p>69,000원</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<footer>
		<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	</footer>
	
	<!-- 하단 navbar -->
	<div class="w3-bottom" style="background-color: #d0c5ff;">
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<c:choose>
				<c:when test="${ !empty loginVO }">
					<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-star"></i></a>
				</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-star"></i></a>
			</c:otherwise>
			</c:choose>
			<a href="${pageContext.request.contextPath}/main" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<c:choose>
				<c:when test="${ !empty loginVO }">
					<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>				
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>