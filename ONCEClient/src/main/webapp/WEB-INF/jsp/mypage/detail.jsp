<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
	
	<link rel="stylesheet"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	
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
		
		input[type="button"], input[type="submit"] {
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
			function login(){
				alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
			}
</script>
</head>
<body>
	<header>
		<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section>
		<div class="table-app app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">${customerVO.name} 님의 회원 정보</h3>
					<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
				</div>
				<form action="${pageContext.request.contextPath}/mypage/detail/${customerVO.id}" method="get">
					<div class="input-field">
						<input type="text" name="id" id="id" class="validate" disabled="disabled" value="${customerVO.id}"/>
						<label for="id">id</label>
					</div>
					<div class="input-field">
						<input type="password" name="password" id="password" class="validate" oninput="checkPwd()"/>
						<label for="password">password</label>
					</div>
					<div class="input-field">
						<input type="password" name="pwChk" id="pwChk" class="validate" oninput="checkPwd()"/>
						<label for="pwChk">password again</label>
					</div>
					<div class="input-field">
						<input type="text" name="telephone" id="telephone" class="validate" value="${customerVO.telephone}"/>
						<label for="telephone">telephone</label>
					</div>
					<div class="input-field">
						<input type="text" name="orderPassword" id="orderPassword" class="validate" oninput="checkOdPwd()"/>
						<label for="orderPassword">order password</label>
					</div>
					<div class="input-field">
						<input type="text" name="pwOdChk" id="pwOdChk" class="validate" oninput="checkOdPwd()"/>
						<label for="pwOdChk">order password again</label>
					</div>
					<div style="text-align: center; margin-top: 70px;">
						<input type="submit" id="udtBtn" class="button" value="수정"/>
						<input type="button" class="button" id="backBtn" value="취소" onclick="history.go(-2)"/>
					</div>
				</form>
				<br/><br/>
				<div style="text-align: right; margin-right: 5%;">
				<a href="${pageContext.request.contextPath}/mypage/delete">회원 탈퇴</a>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	</footer>
	<!-- footer 끝 -->
	
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
					<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #fff;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>				
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #fff;" class="w3-bar-item" onclick="login()"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>