<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

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
 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	<c:forEach var="detail" items="${order.orderDetails}" varStatus="status">
		settingPrice($('#detailPrice_'+${status.index}).text(), ${status.index});
	</c:forEach>
	
	settingTotalPrice($('#totalPrice').text());
});

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


	//리스트에 존재하는 가격에 comma 설정 
	function settingPrice(obj, index){
		
		var price = comma(obj);
	
		$('#detailPrice_'+index).html(price);
	}
	
	function settingTotalPrice(obj){
		
		var totalPrice = comma(obj);
	
		$('#totalPrice').html(totalPrice);
	}

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	
  	<!-- checkout -->
	<div class="checkout app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>결 제 완 료 </h3>
			</div>
			<div class="order">
				<h5 class="title">${order.storeName}</h5>
				<br/>
				<c:forEach var="detail" items="${order.orderDetails}" varStatus="status">
					<div class="row" style="margin: 10px;">
						<h6>${detail.itemName}<br/><span style="font-size:12px; margin-left: 5px;">(${detail.count}개&nbsp;|&nbsp;${detail.color}&nbsp;|&nbsp;${detail.size})</span></h6>
						<div class="col s8">
						</div>
						<div id="price_${status.index}" class="col s4 text-right">
							<h6><span id="detailPrice_${status.index}">${detail.price}</span>원</h6>
						</div>
					</div>
					<hr/><br/>
				</c:forEach>
				<div class="order">
					<div class="col s8">
						<h5><span style="font-size: 15px;">총 결재금액</span></h5>
					</div>
					<div class="col s4 text-right">
						<h5><span id="totalPrice">${order.totalPrice}</span>원</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" flush="false"></jsp:include>
	
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" flush="false"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>