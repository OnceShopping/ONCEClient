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
				<h3>여성의류</h3>
			</div>
			<ul class="portfolio-filter">
				<li data-filter="all" class="active">전체</li>
				<li data-filter="1">상의</li>
				<li data-filter="2">하의</li>
				<li data-filter="3">ACC</li>
			</ul>
			<div class="portfolio-item">
				<div class="row">
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/women1.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women1.jpg" alt=""></a>
						<h5>롱 패딩</h5>
						<p>311,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/women2.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women2.jpg" alt=""></a>
						<h5>블라우스</h5>
						<p>298,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/women3.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women3.jpg" alt=""></a>
						<h5>원피스</h5>
						<p>439,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/women4.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women4.jpg" alt=""></a>
						<h5>코튼 셔츠</h5>
						<p>159,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/women5.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women5.jpg" alt=""></a>
						<h5>기모 팬츠</h5>
						<p>239,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/women6.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women6.jpg" alt=""></a>
						<h5>네이비 슬랙스</h5>
						<p>150,100원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/women7.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women7.jpg" alt=""></a>
						<h5>네이비 스키니</h5>
						<p>199,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/women8.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women8.jpg" alt=""></a>
						<h5>브라운 스커트</h5>
						<p>299,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/women9.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women9.jpg" alt=""></a>
						<h5>귀마개</h5>
						<p>55,080원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/women10.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women10.jpg" alt=""></a>
						<h5>핑크 키링</h5>
						<p>36,540원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/women11.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women11.jpg" alt=""></a>
						<h5>솔리드 벨트</h5>
						<p>87,480원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/women12.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/women12.jpg" alt=""></a>
						<h5>리본 넥워머</h5>
						<p>71,280원</p>
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
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>