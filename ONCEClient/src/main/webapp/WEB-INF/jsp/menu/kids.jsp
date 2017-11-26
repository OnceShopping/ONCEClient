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

</head>
<body>

<header>
		<div class="navbar">
			<div class="container">
				<div class="panel-control-left">
					<a href="#" data-activates="slide-out-left"
						class="sidenav-control-left"><i class="fa fa-bars"></i></a>
				</div>
				<div class="site-title">
					<a href="${pageContext.request.contextPath}" class="logo"><h1>ONCE</h1></a>
				</div>
				<div class="panel-control-right">
					<a href="contact.html"><i class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>

		<div class="panel-control-right">
			<ul id="slide-out-left" class="side-nav collapsible"
				data-collapsible="accordion">
				<li>
					<div class="photos">
						<img
							src="${pageContext.request.contextPath}/resources/img/photos.png"
							alt="">
						<h3>경준이</h3>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class=""></i>층별 매장보기<span><i class="fa fa-chevron-right"></i></span>
					</div>
					<div class="collapsible-body">
						<ul class="side-nav-panel">
							<li><a href="${pageContext.request.contextPath}/menu/1F">1F</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/2F">2F</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/3F">3F</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class=""></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
					</div>
					<div class="collapsible-body">
						<ul class="side-nav-panel">
							<li><a href="${pageContext.request.contextPath}/menu/men">남성의류</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/women">여성의류</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/kids">아동복</a></li>
							<li><a href="${pageContext.request.contextPath}/menu/shoes">신발</a></li>
						</ul>
					</div>
				</li>
				<li><a href="login.html"><i class="fa fa-sign-in"></i>로그인</a></li>
				<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
				</li>
			</ul>
		</div>
	</header>
	
	<section>
	<div class="portfolio portfolio-card column2 app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>아동복</h3>
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
						<a href="${pageContext.request.contextPath}/resources/img/kids1.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids1.jpg" alt=""></a>
						<h5>네이비 패딩</h5>
						<p>199,900원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/kids2.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids2.jpg" alt=""></a>
						<h5>헨리넥 셔츠</h5>
						<p>88,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/kids3.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids3.jpg" alt=""></a>
						<h5>케이블 니트</h5>
						<p>98,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/kids4.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids4.jpg" alt=""></a>
						<h5>카라티</h5>
						<p>78,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/kids5.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids5.jpg" alt=""></a>
						<h5>블랙 팬츠</h5>
						<p>78,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/kids6.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids6.jpg" alt=""></a>
						<h5>베이지 팬츠</h5>
						<p>78,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/kids7.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids7.jpg" alt=""></a>
						<h5>블링 스커트</h5>
						<p>98,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/kids8.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids8.jpg" alt=""></a>
						<h5>로우 데님</h5>
						<p>88,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/kids9.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids9.jpg" alt=""></a>
						<h5>클래식 벨트</h5>
						<p>38,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/kids10.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids10.jpg" alt=""></a>
						<h5>네이비 밴드</h5>
						<p>9,900원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/kids11.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids11.jpg" alt=""></a>
						<h5>네이비 비니</h5>
						<p>38,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/kids12.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/kids12.jpg" alt=""></a>
						<h5>토끼 인형</h5>
						<p>9,900원</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<footer>
		<div class="container">
			<h6>Find & follow us</h6>
			<ul class="icon-social">
				<li class="facebook"><a href=""><i class="fa fa-facebook"></i></a></li>
				<li class="twitter"><a href=""><i class="fa fa-twitter"></i></a></li>
				<li class="google"><a href=""><i class="fa fa-google"></i></a></li>
				<li class="instagram"><a href=""><i class="fa fa-instagram"></i></a></li>
				<li class="rss"><a href=""><i class="fa fa-rss"></i></a></li>
			</ul>
			<div class="tel-fax-mail">
				<ul>
					<li><span>Tel:</span> 900000002</li>
					<li><span>Fax:</span> 0400000098</li>
					<li><span>Email:</span> info@youremail.com</li>
				</ul>
			</div>
		</div>
		<div class="ft-bottom">
			<span>Copyright © 2017 All Rights Reserved </span>
		</div>
	</footer>	
</body>
</html>