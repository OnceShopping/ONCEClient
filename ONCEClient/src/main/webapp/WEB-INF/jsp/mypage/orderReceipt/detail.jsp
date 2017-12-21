<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주문 상세 페이지</title>
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
	.detailTable{
		border-color: #EBEBEB;
		border-radius: 5px !important;
	}
	td{
		font-size: 12px !important;
		padding: 3px !important;	
	}
	#nothing{
		font-size: 12px;
		color: #CCCCCC;
		text-align: center;
		padding-top: auto;
		padding-bottom: auto; 
		margin-top: 50px;
	}
	.semi{
		font-weight: bold;
	}
	
	.total{
		font-size: 12px !important;
		margin-top: 10px;
		text-align: right;
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//로그인하지 않고 이용 시
			if($('#customer').val()==""){
				alert('로그인 후 이용이 가능합니다. 로그인 페이지로 이동합니다.');
				location.href="${pageContext.request.contextPath}/login/loginForm";
			}		
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
		<div class="app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">주문/수령</h3>
					<img src="${ pageContext.request.contextPath }/resources/img/heartline.png" width="15%">
				</div>
				<div class="detailTable">
				<c:forEach var="detail" items="${detailList}">				
						<table style="width: 100%;">
							<tr>
								<td rowspan="5" colspan="2" style="width: 45%; height: 150px;">
								<img src="/image/${ detail.imgSaveName }" width="120px;" height="150px;" style="margin-left: auto; margin-right: auto; display: block;">
								</td>
								<td><span class="semi">상품 명: ${detail.itemName}</span></td>
							</tr>
							<tr>
								<td><span class="semi">SIZE : </span>${detail.size}</td>
							</tr>
							<tr>
								<td><span class="semi">색상  : </span>${detail.color}</td>
							</tr>
							<tr>
								<td><span class="semi">수량  : </span>${detail.count}</td>
							</tr>
							<tr>
								<td><span class="semi">가격  : </span>${detail.price} 원</td>
							</tr>
						</table>
						<br/>			
				</c:forEach>
				<div class="semi total">총 가격 : ${totalPrice} 원</div>
				</div>
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