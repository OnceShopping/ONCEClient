<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
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
</style>
</head>
<body>
	<header>
<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->
	</header>

	<section>
		
		 <div class="faq app-pages app-section">
         <div class="container">
            <div class="pages-title">
               <h3 class="bold">FAQ</h3>
               <img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
            </div>
            <div class="entry normal">
               <ul class="collapsible" data-collapsible="accordion">
               <h5>주문</h5>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (주문)매장에 상품이 있는데 앱에서 주문이 안되요. <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>재고가 5개 이하일 경우 다른 고객과 마찰이 생길 우려가 있어 앱 주문이 불가합니다. 매장에 직접
                           문의하시기 바랍니다.</p>
                     </div>
                  </li>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (주문)다른 브랜드의 상품을 한번에 주문할 수 없나요? <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>여러 브랜드의 상품을 한번에 주문/결제할 경우 환불 시 모든 브랜드의 결제가 취소되기 때문에
                           불가합니다. 개별 브랜드마다 따로 결제하시기 바랍니다.</p>
                     </div>
                  </li>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (주문)매장 외 다른 곳에서도 주문이 가능한가요? <i class="fa fa-plus"></i>
                     </div>
                      <div class="collapsible-body">
                        <p>네, 매장 영업시간 내라면 언제든 주문 가능합니다. 단 최대한 빠르게 상품을 수령하시는것을 권장합니다.</p>
                     </div>
                  </li>
                  <h5>수령</h5>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (수령)언제 상품 수령이 가능한가요? <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>당일 주문한 상품은 당일 수령을 원칙으로 하고 있습니다. 매장 영업시간 내라면 준비되는 즉시 언제든
                           수령 가능하며 다른 상품과 착오가 생길수 있기 때문에 가급적 빠르게 수령하시는것을 권장합니다.</p>
                     </div>
                  </li>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (수령)당일 상품을 수령하지 못했습니다.어떻게 해야하나요? <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>당일 상품을 수령하지 못했더라도 지정하신 수령 장소에 방문하시면 수령 가능합니다. 단 당일에 수령하지
                           못해 생기는 손해와 그 책임은 고객에게 있습니다.</p>
                     </div>
                  </li>
                  <h5>결제</h5>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (결제)결제는 어떻게 하나요? <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>결제는 본인명의 체크/신용카드로 가능합니다.</p>
                     </div>
                  </li>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (결제)다른 결제수단은 없나요? <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>현재는 본인명의 카드결제만 가능합니다. 빠른 시일 내에 다른 서비스로 찾아 뵙겠습니다.</p>
                     </div>
                  </li>
                  <h5>환불</h5>
                  <li>
                     <div class="collapsible-header faq-collapsible">
                        (환불)환불은 어떻게 하나요? <i class="fa fa-plus"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>구매 내역을 지참하셔서 구매하신 지점을 직접 방문하시면 가능합니다. 환불 완료까지는 은행 영업일 기준
                           2~5일정도 소요되며 카드사 사정에 따라 달라질 수 있습니다.</p>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
		<!-- end faq -->
	</section>

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