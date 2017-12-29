<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주문 / 수령</title>
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
		border: 1px solid #EBEBEB;
		border-radius: 5px !important;
	}
	td{
		font-size: 12px !important;
		padding: 3px !important;	
	}
	.No{
		font-weight: bold;
		padding: 5px;
	}
	.status{		
		font-weight:bold; 
		font-size: 13px;
		text-align:right;
		margin-right:10px;
		text-shadow: #bdbdbd 2px 2px 2px;
		float:right;
		padding-bottom: 5px; 
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
			
			<c:forEach var="order" items="${orderList}" varStatus="index">
			settingPrice($('#total_'+${index.count}), ${index.count});
			</c:forEach>
			
		});
		

		function settingPrice(obj, count){
			
			var val = obj.text();
			var price = comma(val);
			
			$(obj).html(price);
		}

		
		//comma를 설정하는 로직
		function comma(obj){
			
			var num = obj.toString(); 
			var array=[];
			var replay = parseInt((num.length)%3);
			var routine = parseInt((num.length+2)/3);
					
			if(replay==1){
				for(var i=0; i<routine; i++){
					var sample;				
					
					if(i==0)
						sample = num.substr(0,1);
					else if(i==1)
						sample = num.substr(1,3);
					else
						sample = num.substr(((i-1)*3)+1, 3);
					
					array.push(sample);
				}
			}		
			else if(replay==2){
				for(var i=0; i<routine; i++){
					var sample;				
					
					if(i==0)
						sample = num.substr(0,2);
					else if(i==1)
						sample = num.substr(2,3);
					else
						sample = num.substr(((i-1)*3)+2, 3);
					
					array.push(sample);
				}
			}
			else{
				for(var i=0; i<routine; i++){
					var sample;				
					
					if(i==0)
						sample = num.substr(0,3);
					else
						sample = num.substr((i*3), 3);
					
					array.push(sample);
				}
			}	
			return array.join(",");
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
		<div class="app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">주문 / 수령</h3>
				</div>
				<div>
				<c:choose>
					<c:when test="${empty orderList}">
						<div id="nothing"> 현재 주문하신 상품이 존재하지 않습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="order" items="${orderList}" varStatus="index">
							<div class="orderTable" onclick="location.href='${pageContext.request.contextPath}/order/'+${order.orderNo}">
								<table style="width: 100%;">
									<tr>
										<td colspan="2" style="background: #EEE9FE;">
											<div class="No">
												<span style='text-align:left;'>주문 번호 : ${order.orderNo}</span>
											</div>
										</td>
									</tr>
									<tr>
										<td rowspan="5" style="width: 40%;">
											<c:choose>
												<c:when test="${!empty order.imgSaveName}">
													<img src="/image/${order.imgSaveName}" width="120px;" height="120px;" style="margin-left: auto; margin-right: auto; display: block;">
												</c:when>
												<c:otherwise>
													<div class="noImage">${ order.storeName } 매장 로고를 준비중입니다.</div>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<p>
												<c:choose>
													<c:when test="${order.count ne 1}">
														<span style="width: 60%; font-weight:bold; font-size:14px;">${ order.storeName }</span><br/><span style="font-size:12px;">(${order.orderDetails[0].itemName} 외 ${order.count -1})</span>
													</c:when>
													<c:otherwise>
														<span style="width: 60%; font-weight:bold; font-size:14px;">${order.storeName}</span>
													</c:otherwise>
												</c:choose>
											</p>
										</td>
									</tr>
									<tr>
										<td>구매 수량 : ${order.count}</td>
									</tr>
									<tr>
										<td>구매 일자  : ${order.date}</td>
									</tr>
									<tr>
										<td>주문 금액  : <span id="total_${index.count}"><c:out value="${order.totalPrice}"/></span> 원</td>
									</tr>
									<tr>
										<c:choose>
											<c:when test="${order.status eq '결제완료'}">
												<td><span class="status" >${order.status}</span></td>
											</c:when>
											<c:when test="${order.status eq '상품승인완료'}">
												<td><span class="status" style="color: #4049FB;">상품준비중</span></td>
											</c:when>
											<c:when test="${order.status eq '상품전달완료'}">
												<td><span class="status" style="color: #17BB77;">상품이동중</span></td>
											</c:when>
											<c:when test="${order.status eq '상품준비완료'}">
												<td><span class="status" style="color: #FF4040;">상품도착</span></td>
											</c:when>
											<c:otherwise>
												<td><span class="status">${order.status}</span></td>
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
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%;" class="w3-bar-item w3-button"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>