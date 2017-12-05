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
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	
	
	<script type="text/javascript">
	 $(document).ready(function() {
		// 다이얼로그 format 정의
			$("#dialog").dialog({
				autoOpen : false,
				modal : true,
				width : '300',
				height : '150'
			});
		 
	 });
	
	
	function infoAlert(str){
		$('#dialog').html("<div style='text-align:center; margin:auto;'><p>"+str+"</p></div>");
		$("#dialog").dialog("open");
	}
	
	</script>
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
	<!-- Modal --> 						
	<div id="dialog" title="ALERT DIALOG"></div>
	
	<div class="service-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>ID 찾기</h3>
			</div>
			<div align="center">
				<h5>가입시 사용한 전화번호를 입력하세요</h5>
			</div>
			<div class="input-field" style="width: 70%; float: left;">
				<input id="tel" type="tel" maxlength="20" class="userinput" style="margin: 0px"/>
				<label for="tel">아이디</label>
			</div>
			<div style="width: 30%; float: left; margin-top: 35px;" align="center">
				<button class="button" id="findId" onclick="location.href='${pageContext.request.contextPath}'" style="width: 100%">확인</button>	
			</div>
			<div style="clear: both"></div>
			<br>
			<div class="pages-title">
				<h3>PW 재설정</h3>
			</div>
			<div class="input-field" style="width: 70%; float: left;" style="margin: 0px">
				<input id="tel" type="tel" maxlength="20" class="userinput"/>
				<label for="tel">아이디</label>
			</div>
			<div style="width: 30%; float: left; margin-top: 25px;" align="center">
				<button class="button" id="findId" onclick="location.href='${pageContext.request.contextPath}'" style="width: 100%; height: 100px">확인</button>	
			</div>
			<div class="input-field" style="width: 70%; float: left;" style="margin: 0px">
				<input id="tel" type="tel" maxlength="20" class="userinput"/>
				<label for="tel">비밀번호</label>
			</div>
			<div style="clear: both"></div>
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