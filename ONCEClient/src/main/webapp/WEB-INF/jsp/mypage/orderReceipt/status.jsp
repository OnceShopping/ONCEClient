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
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<style type="text/css">
	.orderTable{
		border-color: #EBEBEB;
		border-radius: 5px !important;
	}
	td{
		font-size: 10px !important;
		padding: 3px !important;	
	}
	.No{
		font-weight: bold;
	}
	.status{
		padding-top: 3px;
		padding-bottom: 3px;
		font-weight:bold; 
	}
	#nothing{
		font-size: 10px;
		color: #CCCCCC;
		text-align: center;
		padding-top: auto;
		padding-bottom: auto; 
		margin-top: 50px;
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//로그인하지 않고 이용 시
			if($('#id').value==null){
				alert('로그인 후 이용이 가능합니다. 로그인 페이지로 이동합니다.');
				//location.href="${pageContext.request.contextPath}/login/login";
			}
			
			var statusVal=$('.status').val();
			
			if(statusVal=="상품승인완료"){
				$(this).css("color","#AED4EF");
			}else if(statusVal=="상품승인완료"){
				$(this).css("color","#85B8ED");
			}else if(statusVal=="상품전달완료"){
				$(this).css("color","#138BE2");
			}else if(statusVal=="상품준비완료"){
				$(this).css("color","#EE246C");
			}else{
				$(this).css("color","#9085D0");
			}
			
				
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
						<img
							src="${pageContext.request.contextPath}/resources/img/photos.png"
							alt="">
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
				<li><a href="login.html"><i class="fa fa-sign-in"></i>로그인</a></li>
				<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
				</li>
			</ul>
		</div>
		<!-- 좌측 메뉴패널 끝 -->
	</header>

	<section>
		<div class="table-app app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">주문/수령</h3>
					<img src="${ pageContext.request.contextPath }/resources/img/heartline.png" width="15%">
				</div>
				<c:choose>
					<c:when test="${empty orderList}">
						<div id="nothing"> 현재 주문하신 상품이 존재하지 않습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="order" items="${orderList}">
							<div class="orderTable" onclick="location.href='${pageContext.request.contextPath}/order/'+${order.orderNo}">
								<table style="width: 100%;">
									<tr>
										<td colspan="2" style="background: #EEE9FE;"><div class="No">주문 번호 : ${order.orderNo}</div></td>
									</tr>
									<tr>
										<td rowspan="5" style="width: 60%;">
											<c:choose>
												<c:when test="${empty order.imgSaveName}">
													<img src="/image/${order.imgSaveName}" width="120px;" height="150px;" style="margin-left: auto; margin-right: auto; display: block;">
												</c:when>
												<c:otherwise>
													<div width="120px;" height="150px;" style="margin-left: auto; margin-right: auto; display: block;">${ order.storeName }</div>
												</c:otherwise>
											</c:choose>
										</td>
										<c:choose>
											<c:when test="${order.count ne 1}">
												<td style="width: 40%;">상품 제목 : ${order.orderDetails[0].itemName}외 ${order.count -1}</td>
											</c:when>
											<c:otherwise>
												<td style="width: 40%;">상품 제목 : ${order.orderDetails[0].itemName}</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<td>구매 수량 : ${order.count}</td>
									</tr>
									<tr>
										<td>구매 일자  : ${order.date}</td>
									</tr>
									<tr>
										<td>주문 금액  : ${order.totalPrice} 원</td>
									</tr>
									<tr>
										<td><div class="status">상태  : ${order.status}</div></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%-- <input type="hidden" value="${customer.id}" id="id"> --%>
		<input type="hidden" value="cus2" id="id">
	</section>
	
	
	<!-- footer -->
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-light-grey w3-border w3-xlarge">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item w3-button"><i class="fa fa-search"></i></a> 
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item w3-button"><i class="fa fa-star"></i></a> 
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item w3-button"><i class="fa fa-home"></i></a> 
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%;" class="w3-bar-item w3-button"><i class="fa fa-truck"></i></a> 
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>