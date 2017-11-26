<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">

<link rel="shortcut icon" href="resources/img/favicon.png">

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/materialize.min.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/slick-theme.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/owl.theme.css">
<link rel="stylesheet" href="resources/css/owl.transitions.css">
<link rel="stylesheet" href="resources/css/lightbox.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

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

#tabs1, #tabs2, #tabs3, #tabs4 {
	text-align: center;
}


.row .col .s6 .entry img {
	width: 80% !important;
	margin-left: auto !important;
	margin-right: auto !important;
}

#mainProduct, #mainShops {
	margin-top: 0px;
}

</style>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/materialize.min.js"></script>
<script src="resources/js/slick.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/custom.js"></script>
</head>
<body>
	<header>
		<jsp:include page="WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	</header>
	<section>
		<!-- 상단 슬라이더 -->
		<div class="slider-slick app-pages">
			<div class="slider-entry">
				<img src="resources/img/main2.png" alt="">
				<div class="overlay"></div>
				<div class="caption">
					<div class="container">
						<h2 class="bold">내부 공사 안내</h2>
						<p class="light">일시: 8/28 ~ 10/14 위치: 2F-A</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
			<div class="slider-entry">
				<div class="overlay"></div>
				<img src="resources/img/main3.png" alt="">
				<div class="caption">
					<div class="container">
						<h2 class="bold">겨울 맞이 감사제</h2>
						<p class="light">11/17 ~ 11/27</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
			<div class="slider-entry">
				<div class="overlay"></div>
				<img src="resources/img/main1.png" alt="">
				<div class="caption">
					<div class="container">
						<h2 class="bold">크리스마스 깜짝 이벤트</h2>
						<p class="light">특별한 당신에게</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
			<div class="slider-entry">
				<div class="overlay"></div>
				<img src="resources/img/main4.png" alt="">
				<div class="caption">
					<div class="container">
						<h2 class="bold">신년 맞이 콘서트</h2>
						<p class="light">일시:1월 1일 장소:1층 메인홀</p>
						<button class="button">더 보기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 상단 슬라이더 끝 -->
		<!-- 인기상품 리스트 -->
		<div class="tabs-app app-pages app-section" id="mainProduct">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">인기상품</h3>
					<img src="${ pageContext.request.contextPath }/resources/img/heartline.png" width="15%">
				</div>
				<div class="row">
					<div class="col s12">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1">남성</a></li>
							<li class="tab col s3"><a href="#tabs2">여성</a></li>
							<li class="tab col s3"><a href="#tabs3">아동</a></li>
							<li class="tab col s3"><a href="#tabs4">잡화</a></li>
						</ul>
						<div id="tabs1">
							<br />
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store1.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store2.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store3.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store4.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
						</div>
						<div id="tabs2">
							<br />
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store5.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store1.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store2.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store3.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
						</div>
						<div id="tabs3">
							<br />
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store4.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store5.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store1.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store2.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
						</div>
						<div id="tabs4">
							<br />
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store3.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store4.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store5.png" alt="">
										<h6>
											<a href="">item1</a>
										</h6>
										<div class="price">
											<h5>19,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
								<div class="col s6">
									<div class="entry">
										<img src="resources/img/store1.png" alt="">
										<h6>
											<a href="">item2</a>
										</h6>
										<div class="price">
											<h5>29,900원</h5>
										</div>
										<button class="button">ADD TO CART</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		<!-- 인기매장 리스트 -->
		<div class="collapsible-app app-pages app-section" id="mainShops">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">인기매장</h3>
					<img src="${ pageContext.request.contextPath }/resources/img/heartline.png" width="15%">
					<p class="light" style="text-align: right;">판매량순</p>
				</div>
				<div class="entry">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header acc-collapsible">
								1 아디다스  <img src="resources/img/up.gif" width="4%"  style="margin-bottom: 0.5%"><i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:2F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-2222-2222</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header acc-collapsible">
								2 빈폴  <img src="resources/img/down.gif" width="4%"  style="margin-bottom: 0.5%"><i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:4F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-1234-1234</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header acc-collapsible">
								3 유니클로 <i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:1F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-1111-1234</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header acc-collapsible">
								4 뉴발란스  <img src="resources/img/new.gif" width="7%"  style="margin-bottom: 1%"><i class="fa fa-caret-down"></i>
							</div>
							<div class="collapsible-body">
								<p>위치:5F &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:02-1234-5555</p>
							</div>
						</li>
					</ul>
				</div>
			</div>

		</div>
		<!-- 인기매장 리스트 끝 -->
	</section>

	<!-- footer -->
	<footer>
		<jsp:include page="WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="#" style="width: 20%;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>