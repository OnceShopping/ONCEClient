<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}
</style>
<script type="text/javascript">

	function logout(){
		sessionStorage.removeItem('loginVO');
		sessionStorage.removeItem('productList');
		sessionStorage.removeItem('listJSON');
	}	
</script>
</head>
<body>

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
			<c:choose>
				<c:when test="${ empty sessionScope.loginVO }">
				<a onclick="msg()" href="${pageContext.request.contextPath}/login/loginForm"><i class="fa fa-shopping-cart"></i></a>
				</c:when>
				<c:otherwise>
				<a href="${pageContext.request.contextPath}/mypage/shoppingCart"><i class="fa fa-shopping-cart"></i></a>
				</c:otherwise>
			</c:choose>
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
					<c:choose>
						<c:when test="${ empty sessionScope.loginVO }">
							<h3>ONCE</h3>
						</c:when>
						<c:otherwise>
							<h3>${loginVO.id} <span style="font-size:10pt;">님</span></h3>
						</c:otherwise>
					</c:choose>
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
									<td><a href="${pageContext.request.contextPath}/menu/men" class="tileMenu"><i class="fa fa-male"></i><br/>남성 의류</a></td>
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
									<td><a href="${pageContext.request.contextPath}/menu/kids" class="tileMenu"><i class="fa fa-child"></i><br/>아동 의류</a></td>
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
     	<c:choose>
			<c:when test="${ not empty sessionScope.loginVO }">
				<li><a href="${pageContext.request.contextPath}/logout" onclick="logout()"><i class="fa fa-sign-out"></i>로그아웃</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/login/loginForm"><i class="fa fa-sign-in"></i>로그인</a></li>
		        <li><div class="menuSpace"></div></li>
				<li><a href="${ pageContext.request.contextPath }/signup/terms"><i class="fa fa-user-plus"></i>회원가입</a></li>
			</c:otherwise>
		</c:choose>	
		</ul>
	</div>
	<!-- 좌측 메뉴패널 끝 -->
</body>
</html>
