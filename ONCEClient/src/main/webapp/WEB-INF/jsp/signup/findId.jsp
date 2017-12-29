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
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var requiredCheckEmail = false;
			// 다이얼로그 format 정의
			$("#dialog").dialog({
				autoOpen : false,
				modal : true,
				width : '300',
				height : '150'
			});
			
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
							$("#alert2").text('작성하신 email이 존재합니다.');
							requiredCheckEmail = true;
						}else{ // 해당 email이가 존재하지 않는 경우
							$("#alert2").text('작성하신 email이 존재하지 않습니다.');
							requiredCheckEmail = false;
						}
					}						
				});
			});
			
			$("#findBtn").click(function() {
				if($("#email").val() == "") {
					infoAlert("이메일을 입력하세요.");
					return false;
				}
			});
			
			$("#findBtn2").click(function() {
				if($("#email2").val() == "") {
					infoAlert("이메일을 입력하세요.");
					return false;
				} else if(requiredCheckEmail == false) {
					infoAlert("가입하신 이메일을 입력하세요.");
					return false;
				} else {
					$.ajax({
						url : "${pageContext.request.contextPath}/signup/findPw",
						type : "POST",
						data : {
							email : $("#email2").val()
						},
						success : function(result) {
							infoAlert("임시 비밀번호가 해당 이메일로 전송되었습니다.");
						},
					})
					
					return true;
				} 
			});
		})
		
		function infoAlert(str){
			$('#dialog').html("<div style='text-align:center; margin:auto;'><p>"+str+"</p></div>");
			$("#dialog").dialog("open");
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
	<!-- Modal --> 						
	<div id="dialog" title="ALERT DIALOG"></div>
	
	<div class="table-app app-pages app-section" style="margin-bottom: 0px; padding-bottom: 0px;">
		<div class="container">
			<div class="pages-title">
				<h3>아이디 찾기</h3>
			</div> 
			<form action="${pageContext.request.contextPath}/signup/findIdSuccess" method="post">
				<div>
					<div class="input-field">
						<input class="validate" type="text" id="email" name="email" style="margin-bottom: 0px" required>
						<label for="email"> Email  </label>
					</div>
					<p class="w3-center">
						<input type="submit" id="findBtn" class="button" value="find" style="width: 48%">
						<input type="button" onclick="history.go(-1);" class="button" value="Cancel" style="width: 48%">
					</p>
				</div>
			</form>
		</div>
	</div>
	
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	<div class="table-app app-pages app-section" style="margin-top: 30px;">
		<div class="container">
			<div class="pages-title">
				<h3>임시 비밀번호 발송</h3>
			</div>
		
			<div>
				<div class="input-field">
					<input class="validate" type="text" id="email2" name="email2" style="margin-bottom: 0px" required>
					<label for="email2"> Email  </label>
				</div>
				
				<!-- email체크  -->
					<font color="red" id="alert2" class="input-field" style="font-style:oblique; margin:0px; font-size:15px;"></font>
				
				<p class="validate">
					<input type="submit" id="findBtn2" class="button" value="find" style="width: 48%">
					<input type="button" onclick="history.go(-1);" class="button" value="Cancel" style="width: 48%">
				</p>
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