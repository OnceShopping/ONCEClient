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
	
	<c:forEach items="${ storeItem }" varStatus="status">
		settingPrice($('#price_'+${status.count}), ${status.count});
	</c:forEach>
	
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
		if($('#search').val().length < 2) {
			alert("두자 이상 입력하세요");
		} else {
		$('.selectSubmit').attr("action", "${pageContext.request.contextPath}/store/${ storeVO.storeName}/"+$('#search').val());
		}
	});
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
				<img alt="상표 이미지 ${ storeVO.storeName}" src="/image/${storeVO.imgSaveName }" style="width: 157.5px;">
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
						<input class="form-control" id="search" type="search" required style="position:relative; border-radius: 50px;  background: #c0c0c0; height: 30px;
						 padding-left:20px; box-shadow: none; border-bottom: none; width: 89%" placeholder="물품 검색">
						<input type="button" value="&#xf00d;" class="exitSearch" style="font-family: FontAwesome; position:relative; background: transparent; border: 0; box-shadow: none; 
						outline: none; padding: 0px; width: 30px; height: 30px; left:155px; top:-50px">
						<i class="fa fa-search fa-lg" aria-hidden="true" id="storeSelect" style="position: relative; top: -50px; left: 160px"></i>
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
		
		<!-- 인기상품 리스트 -->
		<div class="tabs-app app-pages app-section" id="mainProduct" style="margin-top: 0px">
			<div class="container">
				<div class="pages-title">
					<h6 class="bold" style="text-align: left; margin: 0px">신상품</h6>
					<h6 class="bold" style="text-align: left; margin: 0px">(${fn:length(storeItem) })</h6> 
				</div>
				<div class="row">
					<c:forEach items="${ storeItem }" varStatus="status" var="itemVO">
									<div class="col s6" style="padding: 13px">
										<div class="entry">
											<a href="${ pageContext.request.contextPath}/store/item/${itemVO.num}">
												<img src="/image/${itemVO.imgSaveName}" alt="">
											</a>
											<h6>
												<a href="${ pageContext.request.contextPath}/store/item/${itemVO.num}">${ itemVO.itemName }</a>
											</h6>
											<div class="price">
												<h5><span id="price_${status.count }"><c:out value="${ itemVO.price }"/></span> 원</h5>
											</div>
										</div>
									</div>
					</c:forEach>
				</div>	
			</div>
		</div>
			
	</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	
	<!-- 하단 navbar -->
		<div class="w3-bottom" style="background-color: #d0c5ff;">
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
      		<c:choose>
				<c:when test="${ not empty loginVO }">			
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login/login" style="width: 20% color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose> 		
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	
</body>
</html>