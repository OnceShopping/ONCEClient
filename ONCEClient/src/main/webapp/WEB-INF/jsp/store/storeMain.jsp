<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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

<style type="text/css">
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}
.navbar {
	position: static;
}

.navfixed {
	position: fixed;
	top : 0px;
}
.fa-search {
	cursor:pointer;
}
</style>

<script>
$(document).ready(function() {
	var nav2Offset = $('#navbar2').offset();	//마우스 스크롤바 잡기
	
	$('#input-field').hide();	//처음 검색창을 숨김
	 
 	$('body').click(function(e) {
		if($(e.target).is('#storeSelect')) {
			$('.selectSubmit').submit();
		}
 		
 		if($(e.target).is('#storeSearch')) {	//돋보기 눌렀을때
			$('#input-field').show();
			$('#navbar2').hide();
			$('#navbar2Logo').hide();
			$('#navbar2Search').hide();
			$('#search').val("");
			$('#search').focus();
		} else if($(e.target).hasClass('exitSearch')) {	//x 눌렀을때
			$('#input-field').hide();
			$('#navbar2').show();
			$('#navbar2Logo').show();
			$('#navbar2Search').show();
		} 
		
	}); 
	
	$(window).scroll(function() {
	
		if($(document).scrollTop() > nav2Offset.top ) {	//매장 네비바 고정시키기
			$('#navbar2Main').addClass('navfixed');
		} else  {
			$('#navbar2Main').removeClass('navfixed');
		}
	
	
	});
	
	
	if($('#search').val("")) {
		$('#exitSearch').hide();
	} else {
		$('#exitSearch').show();
	}
	
	$('.selectSubmit').submit(function() {
		$('.selectSubmit').attr("action", "${pageContext.request.contextPath}/store/${ storeVO.storeName}/"+$('#search').val());
	});
});

</script>

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
	<!-- 상단 navbar 끝 -->

	<!-- 좌측 메뉴패널 -->
	<div class="panel-control-right">
		<ul id="slide-out-left" class="side-nav collapsible"
			data-collapsible="accordion">
			<li>
				<div class="photos">
					<h3>cus1</h3>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-map-signs"></i>층별 매장 보기<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${pageContext.request.contextPath}/menu/1F">1F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/2F">2F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/3F">3F</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-th"></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li class="tileList">
							<table>
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/men" class="tileMenu"><i class="fa fa-male"></i><br/>남성
											의류</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/women" class="tileMenu"><i class="fa fa-female"></i><br/>여성 의류</a></td>
								</tr>
							</table>
						</li>
						<li>
							<div class="menuSpace"></div>
						</li>
						<li class="tileList">
							<table class="tileMenu">
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/kids" class="tileMenu"><i class="fa fa-child"></i><br/>유·아동복</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/general" class="tileMenu"><i class="fa fa-briefcase"></i><br/>패션 잡화</a></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="${pageContext.request.contextPath}/login/login"><i class="fa fa-sign-in"></i>로그인</a></li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
			</li>
		</ul>
	</div>
	
	</header>
	
	<section>
	 <div class="team-app app-pages app-section" style="margin-top: 0px">
			<div class="col s12" style="text-align: center; vertical-align: middle; margin-bottom: 30px" >
				<img alt="상표 이미지 ${ storeVO.storeName}" src="${pageContext.request.contextPath}/resources/img/gallery1.jpg" style="width: 150px; height: 150px; border-radius: 50%;">
			</div>
			<div class="navbar" id="navbar2Main" style="background: #ffffff; border-bottom: #ffffff; box-shadow: none">
				<div class="container">
					<div class="panel-control-left" id="navbar2">
						<a href="#" data-activates="slide-out-left-2"
							class="sidenav-control-left"><i class="fa fa-bars"></i></a>
					</div>
					<div class="site-title" id="navbar2Logo" >
						<a href="${pageContext.request.contextPath}/store/${ storeVO.storeName}" class="logo"><h1 style="color: #000000; -webkit-text-stroke: #000000;">${ storeVO.floor } ${ storeVO.storeName}</h1></a>
					</div>
					
					<div id="input-field">
						<form class="selectSubmit" action="">
						<input class="form-control" id="search" type="search" required style="position:relative;  background: #c0c0c0; height: 30px;  box-shadow: none; border-bottom: none; width: 89%">
						<input type="button" value="&#xf00d;" class="exitSearch" style="font-family: FontAwesome; position:relative; background: #c0c0c0; border: 0; box-shadow: none; 
						outline: none; padding: 0px; width: 30px; height: 30px; right:37px; top:-1px">
						<i class="fa fa-search fa-lg" aria-hidden="true" id="storeSelect" style="position: relative; top: -47px; left: 160px"></i>
						</form> 
					</div>
					
					<div class="panel-control-right" id="navbar2Search">
						<i class="fa fa-search " aria-hidden="true" id="storeSearch"></i>
					</div>
				</div>
			</div>
			
			<div class="panel-control-right">
		<ul id="slide-out-left-2" class="side-nav collapsible"
			data-collapsible="accordion">
			<li>
				<div class="photos">
					<h3>${ storeVO.storeName}</h3>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/new">NEW</a></li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					MEN<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/menClothes">의류</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/menShoes">신발</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/menAccessories">패션 잡화</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					WOMEN<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/womenClothes">의류</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/womenShoes">신발</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/womenAccessories">패션 잡화</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					BOYS<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/boysClothes">의류</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/boysShoes">신발</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/boysAccessories">패션 잡화</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					GIRLS<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/girlsClothes">의류</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/girlsShoes">신발</a></li>
						<li><a href="${ pageContext.request.contextPath }/store/${ storeVO.storeName }/girlsAccessories">패션 잡화</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
			<!-- 상단 슬라이더 -->
		<div class="slider-slick app-pages" style="margin: 0px">
			<div class="slider-entry">
				<img src="${ pageContext.request.contextPath }/resources/img/main2.png" alt="">
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
				<img src="${ pageContext.request.contextPath }/resources/img/main3.png" alt="">
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
				<img src="${ pageContext.request.contextPath }/resources/img/main1.png" alt="">
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
				<img src="${ pageContext.request.contextPath }/resources/img/main4.png" alt="">
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
		<div class="tabs-app app-pages app-section" id="mainProduct" style="margin-top: 0px">
			<div class="container">
				<div class="pages-title">
					<h6 class="bold" style="text-align: left; margin: 0px">신상품</h6>
					<h6 class="bold" style="text-align: left; margin: 0px">(${fn:length(storeItem) })</h6> 
				</div>
				<div id="tabs1">
					<c:forEach items="${ storeItem }" varStatus="status">
							<c:if test="${ status.index % 2 eq 0 }">
							<div class="row">
							<c:forEach items="${ storeItem }" var="itemVO" begin="${ status.index }" end="${ status.count + status.step }">
									<div class="col s6">
										<div class="entry">
											<img src="${pageContext.request.contextPath}/resources/img/store1.png" alt="">
											<h6>
												<a href="">${ itemVO.itemName }</a>
											</h6>
											<div class="price">
												<h5>${ itemVO.price }원</h5>
											</div>
										</div>
									</div>
							</c:forEach>
							</div>
							</c:if>
					</c:forEach>
				</div>	
			</div>
		</div>
			
	</div>
	</section>
	
	<footer>
		<div class="container">
			<h6>About us</h6>
			<div class="tel-fax-mail">
				<ul>
					<li><span>회사명:</span> (주)ONCE</li>
					<li><span>대표이사:</span> 장경준</li>
					<li><span>사업자등록번호:</span> 000-0000-00000<li>
				</ul>
			</div>
		</div>
		<div class="ft-bottom">
			<span>Copyright © 2017 All Rights Reserved </span>
		</div>
		
	</footer>
	
	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	
</body>
</html>