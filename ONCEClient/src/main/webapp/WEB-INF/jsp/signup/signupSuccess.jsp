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

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<style>
#stepstep {
	border-radius: 20px;
	background-color: #DED9F6;
}
</style>
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
						<h3>가입이 완료되었습니다.</h3>
						<br>
						<h5>이메일에서 회원가입 인증을 </h5>
						<h5>하셔야 사용이 가능합니다.</h5>
						<br>
						<h4>ONCE 간단 이용 가이드</h4>
						<br>
					</div>
					
					<div style="margin:auto;">
					
					<div
						style="width: 100%; height: 100px; text-align: center; margin-left: 5px;">
						<div id="stepstep"
							style="width: 130px; height: 100px; float: left; display: table;">
							<h6 style="vertical-align: middle; display: table-cell;">step1.
								구매하고자 하는 상품을 검색 및 선택합니다.</h6>
						</div>
						<div
							style="width: 50px; height: 100px; line-height: 100px; float: left; display: table;">
							<img
								src="${ pageContext.request.contextPath }/resources/img/right.png"
								width="50px" height="35px" alt="외않나와"
								style="vertical-align: middle; text-align: center;">
						</div>
						<div id="stepstep"
							style="width: 130px; height: 100px; float: left; display: table;">
							<h6 style="vertical-align: middle; display: table-cell;">step2.
								선택한 상품의 구매 옵션을 정하고 결제합니다.</h6>
						</div>
					</div>
					<div
						style="width: 100%; height: 60px; text-align: center; margin-left: 5px; display: table;">
						<div
							style="width: 130px; height: 20px; float: left; display: inline-block;"></div>
						<div
							style="width: 50px; height: 20px; float: left; display: inline-block;"></div>
						<div
							style="width: 130px; height: 50px; float: left; display: inline-block;"
							align="center">
							<img
								src="${ pageContext.request.contextPath }/resources/img/down.png"
								width="35px" height="50px" alt="외않나와"
								style="vertical-align: middle;">
						</div>
					</div>
					<div style="width: 100%; height: 100px; margin-left: 5px;">
						<div id="stepstep"
							style="width: 130px; height: 100px; float: left; vertical-align: middle; display: table;">
							<h6 style="vertical-align: middle; display: table-cell;">step4.준비
								완료 알림을 받으면 수령 장소에서 상품을 수령합니다.</h6>
						</div>
						<div
							style="width: 50px; height: 100px; line-height: 100px; float: left; display: table;">
							<img
								src="${ pageContext.request.contextPath }/resources/img/left.png"
								width="50px" height="35px" alt="외않나와"
								style="vertical-align: middle;">
						</div>
						<div id="stepstep"
							style="width: 130px; height: 100px; float: left; vertical-align: middle; display: table;">
							<h6 style="vertical-align: middle; display: table-cell;">step3.
								결제와 동시에 상품을 수령할 장소를 선택합니다.</h6>
						</div>
					</div>
					
					</div>
					<!-- background: navy;  -->
					<br>
					<div align="center">
						<button class="button"
							onclick="location.href='${pageContext.request.contextPath}'">확인</button>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br>
	</section>
	<!-- footer 끝 -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->


</body>
</html>