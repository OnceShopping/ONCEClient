<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

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
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	
	<section>
	
	<!-- login-->
	<div class="login app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3> L o g i n </h3>
			</div>
			<form id="customer" action="${ pageContext.request.contextPath }/login/login" method="post">
				<div class="input-field">
					<input name="id" value="${customer.id }" type="text" class="validate">
					<label for="email"> I D </label>
				</div> 
				<div class="input-field">
					<input name="password" type="password" class="validate">
					<label for="password">password</label>
				</div>
				<div><a href="" class="forgot">Forgot Password?</a></div>
				<div class="chebox">
					<c:choose>
						<c:when test="${  not empty customer.id  }">
							<input type="checkbox" id="checkbox" name="saveId" checked="true"/>
						</c:when>
						<c:otherwise>
						
							<input type="checkbox" id="checkbox" name="saveId"/>
						</c:otherwise>
					</c:choose>
					
  					<label for="checkbox">아이디 저장</label>
				</div>
				 
				<div class="chebox">
					<input type="checkbox" id="checkbox1" name="autoLogin"/>
  					<label for="checkbox1">자동 로그인</label>
				</div>
				
				<input type="submit" value="Login" class="button"/>
				<div class="create-account">아직 회원이 아니신가요?&nbsp;<a href="${ pageContext.request.contextPath }/signup/terms" style="font-weight: 800;">회원가입</a></div>
			</form>
		</div>
	</div>
	<!-- end login -->
	</section>
	
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" flush="false"></jsp:include>
	
	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="#" style="width: 20%;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<c:choose>
			<c:when test="${ empty loginVO }">
				<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	
</body>
</html>