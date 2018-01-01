<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Creative - Multipurpose Mobile Template</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 	<link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">   

	<style type="text/css">		
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
		
		input[type="button"]:hover, input[type="submit"]:hover, button:hover {
			background-color: #fff;
		}
		
		input[type="text"]:focus:not([readonly]), input[type=text].valid, input[type=text]:focus.valid,
		input[type="password"]:focus:not([readonly]), input[type=password].valid, input[type=password]:focus.valid,
		input[type="tel"]:focus:not([readonly]), input[type="tel"].valid, input[type="tel"]:focus.valid,
		input[type="email"]:focus:not([readonly]), input[type="email"].valid, input[type="email"]:focus.valid {
	      	border-bottom: 1px solid #d1b2ff;
	      	box-shadow: 0 1px 0 0 #d1b2ff;
      	}
      
		input[type="text"]:focus:not([readonly])+label,
		input[type="password"]:focus:not([readonly])+label,
		input[type="tel"]:focus:not([readonly])+label,
		input[type="email"]:focus:not([readonly])+label {
			color: #d1b2ff;
		}
	</style>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var requiredCheckEmail = false;
			
			// 이메일 중복 검사
			$("#email2").keyup(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/signup/checkEmail",
					data : {"email" : $('#email2').val()},
					cahce : false,
					type : "get",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if(data=="true"){ // 해당 email이 존재하는 경우
							alert('작성하신 email이 존재합니다.');
							requiredCheckEmail = true;
						}else{ // 해당 email이가 존재하지 않는 경우
							alert('작성하신 email이 존재하지 않습니다.');
							requiredCheckEmail = false;
						}
					}						
				});
			});
			
			$("#findBtn").click(function() {
				if($("#email").val() == "") {
					alert("이메일을 입력하세요.");
					return false;
				}
			});
			
			$("#findBtn2").click(function() {
				if($("#email2").val() == "") {
					alert("이메일을 입력하세요.");
					return false;
				} else if(requiredCheckEmail == false) {
					alert("가입하신 이메일을 입력하세요.");
					return false;
				} else {
					$.ajax({
						url : "${pageContext.request.contextPath}/signup/findPw",
						type : "POST",
						data : {
							email : $("#email2").val()
						},
						success : function(result) {
							alert("임시 비밀번호가 해당 이메일로 전송되었습니다.");
						},
					})
					
					return true;
				} 
			});
		})
		
	</script>
</head>

<body>
	<header>
	<!-- navbar -->
		<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section>
	<div class="table-app app-pages app-section" style="margin-bottom: 0px; padding-bottom: 0px;">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold">아이디 / 비밀번호 찾기</h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
			</div> 
			<div class="pages-title">
				<h4 class="normal">아이디 조회</h4>
			</div> 
			<form action="${pageContext.request.contextPath}/signup/findIdSuccess" method="post">
				<div style="padding-bottom: 70px;">
					<div class="input-field" style="width: 70%; float: left;">
						<input class="validate" type="text" id="email" name="email" style="margin-bottom: 0px" required>
						<label for="email"> Email  </label>
					</div>
					<p style="width: 30%; float: left; margin-top: 25px;">
						<input type="submit" id="findBtn" value="조회">
					</p>
				</div>
			</form>
		</div>
	</div>
	
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	<div class="table-app app-pages app-section" style="margin-top: 30px;">
		<div class="container">
			<div class="pages-title">
				<h4 class="normal">임시 비밀번호</h4>
			</div>
		
			<div>
				<div class="input-field" style="width: 70%; float: left;">
					<input class="validate" type="text" id="email2" name="email2" style="margin-bottom: 0px" required>
					<label for="email2"> Email  </label>
				</div>
				<p style="width: 30%; float: left; margin-top: 25px;">
					<input type="submit" id="findBtn2" value="발송">
				</p>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
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