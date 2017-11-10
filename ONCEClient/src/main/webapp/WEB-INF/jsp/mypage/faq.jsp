<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> 

</head>
<body>
	<header>

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
							<li><a href="">1F</a></li>
							<li><a href="">2F</a></li>
							<li><a href="">3F</a></li>
							<li><a href="">4F</a></li>
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
	</header>

	<section>
		
		 <div class="faq app-pages app-section">
         <div class="container">
            <div class="pages-title">
               <h3>FAQ</h3>
            </div>
            <div class="entry">
               <ul class="collapsible" data-collapsible="accordion">
               <h4>주문</h4>
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
                  <h4>수령</h4>
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
                  <h4>결제</h4>
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
                  <h4>환불</h4>
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
		<div class="container">
			<h6>Find & follow us</h6>
			<ul class="icon-social">
				<li class="facebook"><a href=""><i class="fa fa-facebook"></i></a></li>
				<li class="twitter"><a href=""><i class="fa fa-twitter"></i></a></li>
				<li class="google"><a href=""><i class="fa fa-google"></i></a></li>
				<li class="instagram"><a href=""><i class="fa fa-instagram"></i></a></li>
				<li class="rss"><a href=""><i class="fa fa-rss"></i></a></li>
			</ul>
			<div class="tel-fax-mail">
				<ul>
					<li><span>Tel:</span> 900000002</li>
					<li><span>Fax:</span> 0400000098</li>
					<li><span>Email:</span> info@youremail.com</li>
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
		<div class="w3-bar w3-light-grey w3-border w3-xlarge">
			<a href="#" style="width: 20%" class="w3-bar-item w3-button"><i
				class="fa fa-search"></i></a> <a href="#" style="width: 20%"
				class="w3-bar-item w3-button"><i class="fa fa-star"></i></a> <a
				href="${pageContext.request.contextPath}" style="width: 20%"
				class="w3-bar-item w3-button"><i class="fa fa-home"></i></a> <a
				href="#" style="width: 20%" class="w3-bar-item w3-button"><i
				class="fa fa-truck"></i></a> <a href="#" style="width: 20%"
				class="w3-bar-item w3-button w3-green"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>