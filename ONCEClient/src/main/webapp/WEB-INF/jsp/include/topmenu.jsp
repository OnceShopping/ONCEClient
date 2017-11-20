<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	<% 
	String loginId = "";
	
	try{
		Cookie[] cookies = request.getCookies();
	
		if(cookies!=null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("autoLogin")){
					loginId = cookies[i].getValue();
					session.setAttribute("loginId", loginId);
				}
			}
		}
	}catch(Exception e){}
	%>
</script>
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
						<img src="resources/img/photos.png" alt="">
						<h3>경준이</h3>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class=""></i>층별 매장보기<span><i class="fa fa-chevron-right"></i></span>
					</div>
					<div class="collapsible-body">
						<ul class="side-nav-panel">
							<li><a href="${pageContext.request.contextPath}/menu/1F">1F</a></li>
							<li><a href="">2F</a></li>
							<li><a href="">3F</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class=""></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
					</div>
					<div class="collapsible-body">
						<ul class="side-nav-panel">
							<li><a href="">남성의류</a></li>
							<li><a href="">여성의류</a></li>
							<li><a href="">아동복</a></li>
							<li><a href="">신발</a></li>
						</ul>
					</div>
				</li>
				<c:choose>
					<c:when test="${ not empty loginId or not empty loginVO }">
						<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i>로그아웃</a></li>
					</c:when>
					<c:otherwise>		
						<li><a href="${pageContext.request.contextPath}/login/login"><i class="fa fa-sign-in"></i>로그인</a></li>
						<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a></li>
					</c:otherwise>
			</c:choose>
			</ul>
		</div>
		<!-- 좌측 메뉴패널 끝 -->
</header>
</body>
</html>