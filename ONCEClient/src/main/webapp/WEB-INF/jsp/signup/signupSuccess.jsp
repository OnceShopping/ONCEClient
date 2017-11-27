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
	<style>
		#stepstep{
		
			background-color:navy;
		}
	</style>
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
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<section>
	<div class="service-app app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3>회원가입</h3>
				</div>
				<div align="center">
					<h4>가입이 완료되었습니다.</h4>
					<h5>ONCE 간단 이용 가이드</h5>
					<div style="float:left; width:35%" align="center">
					<div id="stepstep" style="width:100px;  height:50px">step1</div>
					<div style="width:50px;  height:50px">빈칸</div>
					<div id="stepstep" style="width:100px;  height:50px">step4</div>
					</div>
					<div style="float:left; width:20%" align="center">
					<div style="width:100px;  height:50px">화살표</div>
					<div style="width:50px;  height:50px">빈칸</div>
					<div style="width:100px; height:50px">화살표</div>
					</div>
					<div style="float:left; width:35%" align="center">
					<div id="stepstep" style="width:100px; height:50px">step2</div>
					<div style="width:50px; height:50px">화살표</div>
					<div id="stepstep" style="width:100px; height:50px;"></div>
					</div>
					<!-- background: navy;  -->
					<br>
				<button class="button" onclick="location.href='${pageContext.request.contextPath}'">확인</button>
			</div>
		</div>	
	</div>
	
	<br>
	<br>
	<br>
	</section>
	<!-- footer 끝 -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-light-grey w3-border w3-xlarge">
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-search"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-star"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-home"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button w3-green"><i class="fa fa-truck"></i></a> 
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	


</body>
</html>