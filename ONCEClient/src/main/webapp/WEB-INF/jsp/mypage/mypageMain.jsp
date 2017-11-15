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
<header>
		<!-- 상단 navbar -->
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
		<!-- 상단 navbar 끝 -->

		<!-- 좌측 메뉴패널 -->
		<div class="panel-control-right">
			<ul id="slide-out-left" class="side-nav collapsible"
				data-collapsible="accordion">
				<li>
					<div class="photos">
						<img src="${pageContext.request.contextPath}/resources/img/photos.png" alt="">
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
							<li><a href="">2F</a></li>
							<li><a href="">3F</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class=""></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
					</div>
					<div class="collapsible-body">
						<ul class="side-nav-panel">
							<li><a href="">남성의류</a></li>
							<li><a href="">여성의류</a></li>
							<li><a href="">아동복</a></li>
							<li><a href="">신발</a></li>
						</ul>
					</div>
				</li>
				<li><a href="login.html"><i class="fa fa-sign-in"></i>로그인</a></li>
				<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
				</li>
			</ul>
		</div>
		<!-- 좌측 메뉴패널 끝 -->
	</header>
	
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
						<td><a href="${pageContext.request.contextPath}/mypage/check"><i class="fa fa-gear"></i>&nbsp;&nbsp;회원 정보수정</a></td>
					</tr>
					<tr>
						<td><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;장바구니</td>
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
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-light-grey w3-border w3-xlarge">
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-search"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-star"></i></a> 
			<a href="${pageContext.request.contextPath}" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-home"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-truck"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button w3-green"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	


</body>
</html>