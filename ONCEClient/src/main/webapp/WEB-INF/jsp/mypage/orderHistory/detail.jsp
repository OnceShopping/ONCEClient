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
	#PriceInfo p{
		margin-left:30px; 
		margin-right:30px;
		font-size: 12px;
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//로그인하지 않고 이용 시
			if($('#customer').val()==""){
				alert('로그인 후 이용이 가능합니다. 로그인 페이지로 이동합니다.');
				location.href="${pageContext.request.contextPath}/login/loginForm";
			}
			
			<c:forEach var="detail" items="${detailList}" varStatus="index">
			settingPrice($('#price_'+${index.count}), ${index.count});
			</c:forEach>
			<c:forEach var="order" items="${orderList}" varStatus="index">
				settingPrice($('#item_'+${index.count}), ${index.count});
				settingPrice($('#sale_'+${index.count}), ${index.count});
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
		
		function login(){
			alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
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
					<h3 class="bold">주문 상세 정보</h3>
				</div>
				<div class="detailTable">
				<c:forEach var="detail" items="${detailList}" varStatus="index">				
						<table style="width: 100%;">
							<tr>
								<td rowspan="5" colspan="2" style="width: 45%; height: 150px;">
								<img src="/image/${ detail.imgSaveName }" width="120px;" height="150px;" style="margin-left: auto; margin-right: auto; display: block;">
								</td>
								<td><br/><span class="semi">상품명 : ${detail.itemName}</span></td>
							</tr>
							<tr>
								<td><span class="semi">사이즈 : </span>${detail.size}</td>
							</tr>
							<tr>
								<td><span class="semi">색상  : </span>${detail.color}</td>
							</tr>
							<tr>
								<td><span class="semi">수량  : </span>${detail.count}</td>
							</tr>
							<tr>
								<td><span class="semi">가격  : </span><span id="price_${index.count }"><c:out value="${detail.price}"/></span> 원</td>
							</tr>
						</table>
						<br/>		
				</c:forEach>
				<div id="PriceInfo">
					<c:forEach var="order" items="${orderList}" varStatus="index">
						<p>
							총 상품 금액
							<span style="float: right;"><span id="item_${index.count}"><c:out value="${order.oriPrice}"/></span> 원</span>
						</p>
						<p>
							총 할인 금액
							<span style="float: right; color: red;">- <span id="sale_${index.count}"><c:out value="${order.salePrice}"/></span> 원</span>
						</p>			
						<hr/>
						<p class="semi total">총 가격 : <span id="total_${index.count}"><c:out value="${order.totalPrice}"/></span> 원</p>
						</div>
					</c:forEach>
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