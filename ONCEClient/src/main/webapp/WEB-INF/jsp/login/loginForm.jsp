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
	<link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</head>
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
         -webkit-border-radius: 28;
         -moz-border-radius: 28;
         border-radius: 28px;
         background-color:#fff;
         color: #999cff;
         padding: 5px 30px 5px 30px;
         border: solid #a8b2ff 2px;
      }
      
      input[type="text"]:focus:not([readonly]), input[type=text].valid, input[type=text]:focus.valid, input[type="password"]:focus:not([readonly]), input[type=password].valid,  input[type=password]:focus.valid {
      	border-bottom: 1px solid #d1b2ff;
      	box-shadow: 0 1px 0 0 #d1b2ff;
      }
      
      input[type="text"]:focus:not([readonly])+label, input[type="password"]:focus:not([readonly])+label {
      	color: #d1b2ff;
      }
      
      [type="checkbox"]+label:before, [type="checkbox"]:not(.filled-in)+label:after{
      	border: 2px solid #9E9E9E;
      }
      
      .login [type="checkbox"]:checked+label::before {
	    border-right: 2px solid #d1b2ff;
	    border-bottom: 2px solid #d1b2ff;
	}
	
	footer {
		padding-bottom: 70px;
	}
</style>
<script type="text/javascript">
function login(){
	alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
}
</script>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	
	<section>
	
	<!-- login-->
	<div class="login app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold"> 로그인 </h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
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
				<!-- <div class="chebox">
					<input type="checkbox" id="checkbox1" name="autoLogin"/>
  					<label for="checkbox1">자동 로그인</label>
				</div> -->
				<div style="margin: 0 auto;">
					<input type="submit" value="Login" class="button" style=" align-items: center;"/>
				</div>
			</form>
			<div class="create-account" >계정을 잊으셨나요?&nbsp;<a href="${ pageContext.request.contextPath }/signup/findId" style="font-weight: 800; color: #553184;">ID/PW 찾기</a></div>
			<div class="create-account">아직 회원이 아니신가요?&nbsp;<a href="${ pageContext.request.contextPath }/signup/terms" style="font-weight: 800; color: #553184;">회원가입</a></div>
		</div>
	</div>
	<!-- end login -->
	</section>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	
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