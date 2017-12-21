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
		font-size: 12px !important;
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
		font-size: 12px;
		color: #CCCCCC;
		text-align: center;
		padding-top: auto;
		padding-bottom: auto; 
		margin-top: 50px;
	}
	.noImage{
		width:120px;
		height:150px;
		text-align:center; 
	 	margin-left: auto; 
	 	margin-right: auto; 
	 	display: block;
	 	border : 1px solid #EBEBEB;
	 	vertical-align: middle;
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			if($('#customer').val()==""){
				alert('로그인 후 이용이 가능합니다. 로그인 페이지로 이동합니다.');
				location.href="${pageContext.request.contextPath}/login/loginForm";
			}				
		});
	</script>
</head>
<body>

	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->

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
						<c:forEach var="order" items="${orderList}" varStatus="index">
							<div class="orderTable" onclick="location.href='${pageContext.request.contextPath}/order/'+${order.orderNo}">
								<table style="width: 100%;">
									<tr>
										<td colspan="2" style="background: #EEE9FE;"><div class="No">주문 번호 : ${order.orderNo}</div></td>
									</tr>
									<tr>
										<td rowspan="5" style="width: 40%;">
											<c:choose>
												<c:when test="${!empty order.imgSaveName}">
													<img src="/image/${order.imgSaveName}" width="120px;" height="150px;" style="margin-left: auto; margin-right: auto; display: block;">
												</c:when>
												<c:otherwise>
													<div class="noImage">${ order.storeName }</div>
												</c:otherwise>
											</c:choose>
										</td>
										<c:choose>
											<c:when test="${order.count ne 1}">
												<td style="width: 60%;">상품 제목 : ${order.orderDetails[0].itemName}외 ${order.count -1}</td>
											</c:when>
											<c:otherwise>
												<td style="width: 60%;">상품 제목 : ${order.orderDetails[0].itemName}</td>
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
										<c:choose>
											<c:when test="${order.status eq '결제완료'}">
												<td><div style="font-weight: bold;">${order.status}</div></td>
											</c:when>
											<c:when test="${order.status eq '상품승인완료'}">
												<td><div style="color: #4049FB; font-weight: bold;">상품준비중</div></td>
											</c:when>
											<c:when test="${order.status eq '상품전달완료'}">
												<td><div style="color: #17BB77; font-weight: bold;">상품이동중</div></td>
											</c:when>
											<c:when test="${order.status eq '상품준비완료'}">
												<td><div style="color: #FF4040; font-weight: bold;">상품도착</div></td>
											</c:when>
											<c:otherwise>
												<td><div style="font-weight: bold;">${order.status}</div></td>
											</c:otherwise>	
										</c:choose>								
									</tr>
								</table>
							</div>
							<br/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<input type="hidden" value="${customer.id}" id="customer">
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