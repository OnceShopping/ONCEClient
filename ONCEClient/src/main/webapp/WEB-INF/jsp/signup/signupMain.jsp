<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		
		button:hover {
			background-color: #fff;
		}
		
		#idCheck, #emailCheck {
			padding: 5px 15px 5px 15px;
			font-size: 10pt;
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
          
          var requiredCheck = false;
          var requiredCheckEmail = false;
          
           // 아이디 영문,숫자만
           $("#id").keyup(function(event){
              requiredCheck = false;
              
              if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                  if(inputVal.match(/[^a-z0-9]/gi)!= null) {
                	  alert("영문과 숫자만 입력 가능합니다.");
                     $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
                     
                 }  
              }
           });   
           
           // 이름 한글만
           $("#name").keyup(function(event){
              if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
              
                 if(inputVal.match(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi)!= null) {
                    alert("한글만 입력 가능합니다.");
                    $(this).val(inputVal.replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi,''));
                 }
              }
           });
           // 주문비밀번호 숫자만
           $("#orderPassword").keyup(function(event){
              if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
              
                 if(inputVal.match(/[^0-9]/gi)!= null) {
                	 alert("숫자만 입력 가능합니다.");
                    $(this).val(inputVal.replace(/[^0-9]/gi,''));
                 }
              }
           });
            
         // 내용 미입력시 알림창
         $("#nextBtn").click(function() {
            if ($("#id").val() == "") {
            	alert("아이디를 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#password").val() == "") {
            	alert("비밀번호를 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#passwordCheck").val() == "") {
            	alert("비밀번호확인을 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#password").val() != $("#passwordCheck").val()) {
            	alert("비밀번호와 비밀번호확인을 동일하게 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#name").val() == "") {
            	alert("이름을 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#tel").val() == "") {
            	alert("전화번호를 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#orderPassword").val() == "") {
            	alert("주문비밀번호를 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if(isNaN( $("#orderPassword").val()) ) {
            	alert("주문비밀번호는 숫자만 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if($("#email").val() == "") {
            	alert("이메일을 입력하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } else if(requiredCheck == false) {
            	alert("아이디 중복 확인을 하셔야 다음 단계로 진행 가능합니다.");
               return false;
            }  else if(requiredCheckEmail == false) {
            	alert("아이디 중복 확인을 하셔야 다음 단계로 진행 가능합니다.");
               return false;
            } 
         });
          
          // 아이디 중복 체크
         $("#idCheck").click(function(){
            var check = $('#id').val();
            
            if(check==""){
            	alert("아이디를 입력해 주세요.");
            } else { 
               $.ajax({
                  url : "${pageContext.request.contextPath}/signup/checkId",
                  data : {"id" : $('#id').val()},
                  cahce : false,
                  type : "get",
                  contentType : "application/json; charset=UTF-8",
                  success : function(data) {
                     
                     if(data=="true"){ // 해당 id가 존재하는 경우
                    	 alert('죄송합니다. 작성하신 아이디가 기존에 존재합니다 다시 작성해 주세요.');
                        requiredCheck = false;
                     }else{ // 해당 id가 존재하지 않는 경우
                    	 alert('작성하신 아이디는 사용 가능한 아이디입니다.');
                        requiredCheck = true;
                     }
                  }                  
               });
            }
         });
          
         // 이메일 중복 체크
         $("#emailCheck").click(function(){
            var check = $('#email').val();
            
            if(check==""){
            	alert("email을 입력해 주세요");
            } else {
               $.ajax({
                  url : "${pageContext.request.contextPath}/signup/checkEmail",
                  data : {"email" : $('#email').val()},
                  cache : false,
                  type : "get",
                  contentType : "application/json; charset=UTF-8",
                  success : function(data) {
                     
                     if(data=="true"){ // 해당 email이 존재하는 경우
                    	 alert('죄송합니다. 작성하신 이메일이 기존에 존재합니다 다시 작성해 주세요.');
                        requiredCheckEmail = false;
                     }else{ // 해당 email이 존재하지 않는 경우
                    	 alert('작성하신 이메일은 사용 가능한 아이디입니다.');
                        requiredCheckEmail = true;
                     }
                  }                  
               });
            }
         });

          // 전화번호 자동 하이픈 추가
          $(document).ready(function() {
            $("#tel").blur(function() {
               var textinput = $("#tel").val();
               textinput = textinput.replace(/[^0-9]/g, '');
               var tmp = ""
                
                if(textinput.length < 4) {
                  return $("#tel").val(tmp);
               } else if(textinput.length < 7) {
                  tmp += textinput.substr(0,3);
                  tmp += '-';
                  tmp += textinput.substr(3);
                  $("#tel").val(tmp);
               } else if(textinput.length < 11) {
                  tmp += textinput.substr(0,3);
                  tmp += '-';
                  tmp += textinput.substr(3,3);
                  tmp += '-';
                  tmp += textinput.substr(6);
                  $("#tel").val(tmp);
               } else {
                  tmp += textinput.substr(0,3);
                  tmp += '-';
                  tmp += textinput.substr(3,4);
                  tmp += '-';
                  tmp += textinput.substr(7);
                  $("#tel").val(tmp);
               } 
            });
         }); 
          
           // 전화번호 숫자만
           $("#tel").keyup(function(event){
              if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
              
                 if(inputVal.match(/[^0-9|^-]/gi)!= null) {
                	 alert("숫자만 입력 가능합니다.");
                    $(this).val(inputVal.replace(/[^0-9|^-]/gi,''));
                 }
              }
           });
       });     
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
			<div class="pages-title">
				<h3 class="bold">회원가입</h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%"> 
			</div>
			<form:form commandName="customerVO" method="post" >
				<div class="input-field" style="width: 70%; float: left;">
					<form:input id="id" path="id" type="text" maxlength="20" class="userinput"/>
					<label for="id">아이디</label>
				</div>
				<div style="width: 30%; float: left; margin-top: 25px;" align="center">
					<input type="button" value="중복 확인" id="idCheck" />
				</div>
				<div style="clear: both"></div>
				<div class="input-field">
					<form:input id="password" path="password" type="password" maxlength="13" class="validate"/>
					<label for="password">비밀번호</label>
				</div>
				<div class="input-field">
					<input id="passwordCheck" type="password" maxlength="13" class="validate"/>
					<label for="passwordCheck">비밀번호확인</label>
				</div>
				<div class="input-field">
					<form:input id="name" path="name" type="text" maxlength="5" class="validate"/>
					<label for="name">이름</label>
				</div>
				<div class="input-field">
					<form:input id="tel" path="telephone" type="tel" maxlength="13" class="validate"/>
					<label for="tel">전화번호</label>
				</div>
				<div class="input-field">
					<form:input id="orderPassword" path="orderPassword" type="password" maxlength="8" class="validate"/>
					<label for="orderPassword">주문비밀번호</label>
				</div>
				<!--  -->
				<div class="input-field" style="width: 70%; float: left;">
					<form:input id="email" path="email" type="email" maxlength="40" class="validate"/>
					<label for="email">이메일</label>
				</div>
				<div style="width: 30%; float: left; margin-top: 25px;" align="center">
					<input type="button" class="button" value="중복 확인" id="emailCheck" />
				</div>
				<div style="clear: both"></div>
			<div align="center" style="margin-top: 50px;">
			<input type="button" class="button" onclick="location.href='${pageContext.request.contextPath}/signup/terms'" value="이전">
			<input type="submit" class="button" id="nextBtn" value="다음">
			</div>
			</form:form>
			<div id="idmessage" style="display:none;"></div>
		</div>
	</div>
	
	<br>
	<br>
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