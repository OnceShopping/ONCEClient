<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	</style>

<script>
$( function() {
	$('#floor').change(function() {
		if($('#floor').val() == '1층' ) {
			$("option[id^='S1']").show();
			$("option[id^='S2']").hide();
			$("option[id^='S3']").hide();
		} else if($('#floor').val() == '2층' ) {
			$("option[id^='S1']").hide();
			$("option[id^='S2']").show();
			$("option[id^='S3']").hide();
		} else if($('#floor').val() == '3층' ) {
			$("option[id^='S1']").hide();
			$("option[id^='S2']").hide();
			$("option[id^='S3']").show();
		} else {
			$("option[id^='S']").show();
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
	
	<div class="contact app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold">1:1 상담</h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
			</div>
			<form:form commandName="boardQAVO" action="${pageContext.request.contextPath}/insertDeptQA">
			<div>
			<c:choose>
            <c:when test="${ category1 == '백화점' }">
			<select name="category3" class="browser-default">
			<option value="all">전체</option>
                        <option>고객편의시설</option>
                        <option>기본시설</option>
                        <option>영업시간</option>
                        <option>서비스</option>
                        <option>기타</option>
			</select>
			</c:when>
			<c:when test="${ category1 == '매장' }">
			<select class="browser-default" id="floor">
			<option>전체</option>
			<option>1층</option>
			<option>2층</option>
			<option>3층</option>
			</select>
			<select name="category2" class="browser-default" id="store">
			<c:forEach items="${ storeListQA }" var="store">
			<option id="${ store.storeNo }">${ store.storeName }</option>
			</c:forEach>
			</select>
			<select name="category3" class="browser-default">
			<option value="all">전체</option>
                        <option>입고문의</option>
                        <option>재고문의</option>
                        <option>기타</option>
			</select>
			</c:when>
			<c:otherwise>
			<select name="category3" class="browser-default">
			<option value="all">전체</option>
                        <option>수령문의</option>
                        <option>영업시간</option>
                        <option>기타</option>
			</select>
			</c:otherwise>
			</c:choose>
			</div>
				<div class="input-field">
					<input id="title" name="title" type="text" class="validate">
					<label for="title">제목</label>
				</div>
				<div class="input-field">
					<textarea cols="20" rows="10" name="content" id="content" class="validate"></textarea>
					<label for="your-message">내용</label>
				</div>
				<div id="buttons" style="text-align: center; margin-top: 30px;">
					<input type="hidden" name="category1" value="${ category1 }">
					<a href="#modal">
						<button>등록</button>
					</a>
						<button onclick="history.go(-1)">취소</button>	    
			    </div>
			    <div id="modal" class="modal">
				<div class="modal-content">
					<h4>알림</h4>
					<p>질문이 등록 되었습니다. 감사합니다</p>
					<div class="modal-footer">
						<input type="submit" class="modal-action modal-close" value="확인">
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
	
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