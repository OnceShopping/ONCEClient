<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script type="text/javascript">
		var pwdCheck = 0;
		var pwdOrCheck = 0;
		
		 function checkPwd() {
		        var pass = $('#password').val();
		        var nonpass = $('#pwChk').val();
		        if(nonpass=="" && (pass != nonpass || pass == nonpass)){
		            $("#udtBtn").prop("disabled", true);
		            $("#udtBtn").css("background-color", "#aaaaaa");
		            $("#pwChk").css("background-color", "#FFCECE");
		        }
		        else if (pass == nonpass) {
		            $("#pwChk").css("background-color", "#CEFBC9");
		            pwdCheck = 1;
		            if(pwdCheck == 1) {
		                $("#udtBtn").prop("disabled", false);
		                $("#pwChk").css("background-color", "#CEFBC9");
		            }
		        } else if (pass != nonpass) {
		            pwdCheck = 0;
		            $("#udtBtn").prop("disabled", true);
		            $("#udtBtn").css("background-color", "#177bbb");
		            $("#pwChk").css("background-color", "#FFCECE");
		        } else if (pass == null || nonpass == null) {
		        	pwdCheck = 0;
		        	$("#udtBtn").prop("disabled", true);
		            $("#udtBtn").css("background-color", "#aaaaaa");
		            $("#pwChk").css("background-color", "#FFCECE");
		        }
		    }
	
		 function checkOdPwd() {
		        var pass = $('#orderPassword').val();
		        var nonpass = $('#pwOdChk').val();
		        if(nonpass=="" && (pass != nonpass || pass == nonpass)){
		            $("#udtBtn").prop("disabled", true);
		            $("#udtBtn").css("background-color", "#aaaaaa");
		            $("#pwOdChk").css("background-color", "#FFCECE");
		        }
		        else if (pass == nonpass) {
		            $("#pwOdChk").css("background-color", "#CEFBC9");
		            pwdOrCheck = 1;
		            if(pwdOrCheck == 1) {
		                $("#udtBtn").prop("disabled", false);
		                $("#pwOdChk").css("background-color", "#CEFBC9");
		            }
		        } else if (pass != nonpass) {
		        	pwdOrCheck = 0;
		            $("#udtBtn").prop("disabled", true);
		            $("#udtBtn").css("background-color", "#177bbb");
		            $("#pwOdChk").css("background-color", "#FFCECE");
		        } else if (pass == null || nonpass == null) {
		        	pwdOrCheck = 0;
		        	$("#udtBtn").prop("disabled", true);
		            $("#udtBtn").css("background-color", "#aaaaaa");
		            $("#pwOdChk").css("background-color", "#FFCECE");
		        }
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
					<h3>${customerVO.name} 님의 회원 정보</h3>
				</div>
				<form action="${pageContext.request.contextPath}/mypage/detail/${customerVO.id}" method="get">
					<input type="text" name="id" id="id" disabled="disabled" value="${customerVO.id}"/><br/>
					<input type="password" name="password" id="password" oninput="checkPwd()"/><br/>
					<input type="password" name="pwChk" id="pwChk" oninput="checkPwd()"/><br/>
					<input type="text" name="telephone" id="telephone" value="${customerVO.telephone}"/><br/>
					<input type="text" name="orderPassword" id="orderPassword" oninput="checkOdPwd()"/><br/>
					<input type="text" name="pwOdChk" id="pwOdChk" oninput="checkOdPwd()"/><br/>
					<input type="submit" id="udtBtn" value="수정"/><br/>
				</form>
				<a href="${pageContext.request.contextPath}/mypage/delete">회원 탈퇴</a>
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