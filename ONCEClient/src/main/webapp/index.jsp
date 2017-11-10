<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">

<link rel="shortcut icon" href="resources/img/favicon.png">

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/materialize.min.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/slick-theme.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/owl.theme.css">
<link rel="stylesheet" href="resources/css/owl.transitions.css">
<link rel="stylesheet" href="resources/css/lightbox.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/materialize.min.js"></script>
<script src="resources/js/slick.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/lightbox.min.js"></script>
<script src="resources/js/jquery.filterizr.min.js"></script>
<script src="resources/js/custom-portfolio.js"></script>
<script src="resources/js/custom.js"></script>

</head>
<body>
	<header>
		<jsp:include page="WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	</header>

	<section>
		<!-- 상단 슬라이더 -->
		<div class="slider-slick app-pages">
			<div class="slider-entry">

				<img src="resources/img/pic1.png" alt="">
				<div class="overlay"></div>
				<div class="caption">
					<div class="container">
						<h2>유니클로</h2>
						<p>옷 겁나싸요</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
			<div class="slider-entry">
				<div class="overlay"></div>
				<img src="resources/img/pic2.png" alt="">
				<div class="caption">
					<div class="container">
						<h2>유니클로</h2>
						<p>코트가 이뻐요</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
			<div class="slider-entry">
				<div class="overlay"></div>
				<img src="resources/img/pic3.png" alt="">
				<div class="caption">
					<div class="container">
						<h2>유니클로</h2>
						<p>코트가 저렴해요</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
			<div class="slider-entry">
				<div class="overlay"></div>
				<img src="resources/img/pic4.png" alt="">
				<div class="caption">
					<div class="container">
						<h2>유니클로</h2>
						<p>히트택 따뜻해요</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 상단 슬라이더 끝 -->
		<!-- 인기상품 리스트 -->
		<div class="portfolio portfolio-card column3 app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3>인기상품</h3>
				</div>
				<ul class="portfolio-filter">
					<li data-filter="all" class="active">모두</li>
					<li data-filter="1">상의</li>
					<li data-filter="2">하의</li>
					<li data-filter="3">신발</li>
				</ul>
				<div class="portfolio-item">
					<div class="row">
						<div class="col s4 filtr-item" data-category="1">
							<a href="resources/img/up1.jpg" data-lightbox="image-1"><img
								src="resources/img/up1.jpg" alt=""></a>
							<h5>유니클로 니트</h5>
							<p>39,900원</p>
						</div>
						<div class="col s4 filtr-item" data-category="1">
							<a href="resources/img/up2.jpg" data-lightbox="image-1"><img
								src="resources/img/up2.jpg" alt=""></a>
							<h5>유니클로 코트</h5>
							<p>78,000원</p>
						</div>
						<div class="col s4 filtr-item" data-category="1">
							<a href="resources/img/up3.jpg" data-lightbox="image-1"><img
								src="resources/img/up3.jpg" alt=""></a>
							<h5>유니클로 셔츠</h5>
							<p>49,900원</p>
						</div>
					</div>
					<div class="row">
						<div class="col s4 filtr-item" data-category="2">
							<a href="resources/img/low1.jpg" data-lightbox="image-1"><img
								src="resources/img/low1.jpg" alt=""></a>
							<h5>빈폴 슬렉스</h5>
							<p>149,900원</p>
						</div>
						<div class="col s4 filtr-item" data-category="2">
							<a href="resources/img/low2.jpg" data-lightbox="image-1"><img
								src="resources/img/low2.jpg" alt=""></a>
							<h5>빈폴 청바지</h5>
							<p>178,000원</p>
						</div>
						<div class="col s4 filtr-item" data-category="2">
							<a href="resources/img/low3.jpg" data-lightbox="image-1"><img
								src="resources/img/low3.jpg" alt=""></a>
							<h5>빈폴 슬렉스2</h5>
							<p>188,000원</p>
						</div>
					</div>
					<div class="row">
						<div class="col s4 filtr-item" data-category="3">
							<a href="resources/img/shoe1.jpg" data-lightbox="image-1"><img
								src="resources/img/shoe1.jpg" alt=""></a>
							<h5>나이키</h5>
							<p>88,000원</p>
						</div>
						<div class="col s4 filtr-item" data-category="3">
							<a href="resources/img/shoe2.jpg" data-lightbox="image-1"><img
								src="resources/img/shoe2.jpg" alt=""></a>
							<h5>반스</h5>
							<p>75,000원</p>
						</div>
						<div class="col s4 filtr-item" data-category="3">
							<a href="resources/img/shoe3.jpg" data-lightbox="image-1"><img
								src="resources/img/shoe3.jpg" alt=""></a>
							<h5>컨버스</h5>
							<p>66,000원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 인기상품 리스트 끝 -->
		<!-- 인기매장 리스트 -->
		<div class="collapsible-app app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3>인기매장</h3>
				</div>
				<div class="entry">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header acc-collapsible">
								아디다스 <i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:2F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-2222-2222</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header acc-collapsible">
								빈폴 <i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:4F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-1234-1234</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header acc-collapsible">
								유니클로 <i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:1F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-1111-1234</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header acc-collapsible">
								뉴발란스 <i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:5F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-1234-5555</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
		<!-- 인기매장 리스트 끝 -->
	</section>

	<!-- footer -->
	<footer>
		<jsp:include page="WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-light-grey w3-border w3-xlarge">
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-search"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-star"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button w3-green"><i class="fa fa-home"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-truck"></i></a> 
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>