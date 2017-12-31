<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
<link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<style>
.normal {
	font-weight: 400
}

.bold {
	font-weight: 700
}

.bolder {
	font-weight: 800
}

.light {
	font-weight: 300
}

.slider-entry img{
	object-fit: contain;
}

input[type="button"], input[type="submit"], button {
	font-size: inherit;
	margin-left: 10px;
	margin-right: 10px;
	-webkit-border-radius: 28;
	-moz-border-radius: 28;
	border-radius: 28px;
	background-color:#fff;
	color: #999cff;
	padding: 5px 30px 5px 30px;
	border: solid #a8b2ff 2px;
}
</style>
<script type="text/javascript">
function login(){
	alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
}
</script>
</head>

<body>
	<header>
	<!-- navbar -->
		<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->
	</header>
	<section>
		<div class="table-app app-pages app-section">
			<div class="container">
				<div align="center">
					<div>
						<h3 class="bold">ONCE에 오신 것을 환영합니다!</h3>
						<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
						<h6>작성하신 이메일의 메일함을 확인해 주세요. </h6>
						<h6>본 사이트는 인증 후에 이용하실 수 있습니다.</h6>
					</div>
					
			      <div class="slider-slick">
			         <div class="slider-entry">
			            <img src="${pageContext.request.contextPath}/resources/img/step01.png">
			         </div> 
			         <div class="slider-entry">
			            <img src="${pageContext.request.contextPath}/resources/img/step02.png">
			         </div> 
			         <div class="slider-entry">
			            <img src="${pageContext.request.contextPath}/resources/img/step03.png">
			         </div> 
			         <div class="slider-entry">
			            <img src="${pageContext.request.contextPath}/resources/img/step04.png">
			         </div> 
			      </div>
			      
					<div align="center">
						<button onclick="location.href='${pageContext.request.contextPath}'">확인</button>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
	<!-- footer 끝 -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
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