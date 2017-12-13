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
 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<style type="text/css">
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}

#buttons {
display:table;
margin-left: auto;
margin-right: auto;
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
		<!-- 상단 navbar -->
		<div class="navbar">
		<div class="container">
			<div class="panel-control-left">
				<a href="#" data-activates="slide-out-left"
					class="sidenav-control-left"><i class="fa fa-bars"></i></a>
			</div>
			<div class="site-title">
				<a href="${pageContext.request.contextPath}" class="logo"><h1>ONCE</h1></a>
			</div>
			<div class="panel-control-right">
				<a href="contact.html"><i class="fa fa-shopping-cart"></i></a>
			</div>
		</div>
	</div>
	<!-- 상단 navbar 끝 -->

	<!-- 좌측 메뉴패널 -->
	<div class="panel-control-right">
		<ul id="slide-out-left" class="side-nav collapsible"
			data-collapsible="accordion">
			<li>
				<div class="photos">
					<h3>cus1</h3>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-map-signs"></i>층별 매장 보기<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${pageContext.request.contextPath}/menu/1F">1F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/2F">2F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/3F">3F</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-th"></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li class="tileList">
							<table>
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/men" class="tileMenu"><i class="fa fa-male"></i><br/>남성
											의류</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/women" class="tileMenu"><i class="fa fa-female"></i><br/>여성 의류</a></td>
								</tr>
							</table>
						</li>
						<li>
							<div class="menuSpace"></div>
						</li>
						<li class="tileList">
							<table class="tileMenu">
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/kids" class="tileMenu"><i class="fa fa-child"></i><br/>유·아동복</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/general" class="tileMenu"><i class="fa fa-briefcase"></i><br/>패션 잡화</a></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="${pageContext.request.contextPath}/login/login"><i class="fa fa-sign-in"></i>로그인</a></li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
			</li>
		</ul>
	</div>
		<!-- 좌측 메뉴패널 끝 -->
	</header>
	
	<div class="contact app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>1:1 상담</h3>
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
				<div id="buttons"><input type="hidden" name="category1" value="${ category1 }">
				<a href="#modal"><button class="button">등록</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="button" onclick="history.go(-1)">취소</button>	    
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
		<div class="container">
			<h6>About us</h6>
			<div class="tel-fax-mail">
				<ul>
					<li><span>회사명:</span> (주)ONCE</li>
					<li><span>대표이사:</span> 장경준</li>
					<li><span>사업자등록번호:</span> 000-0000-00000<li>
				</ul>
			</div>
		</div>
		<div class="ft-bottom">
			<span>Copyright © 2017 All Rights Reserved </span>
		</div>
	</footer>
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>