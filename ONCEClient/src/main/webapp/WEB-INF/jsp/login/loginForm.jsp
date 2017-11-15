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
	
	<section>
	
	<!-- login-->
	<div class="login app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3> L o g i n </h3>
			</div>
			<form action="${ pageContext.request.contextPath }/login/login" method="post">
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
				<div class="create-account">아직 회원이 아니신가요?<a href="">회원가입</a></div>
			</form>
		</div>
	</div>
	<!-- end login -->
	
	</section>
	
</body>
</html>