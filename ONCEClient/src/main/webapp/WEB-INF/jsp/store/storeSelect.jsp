<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
.fa-search {
	cursor:pointer;
}
</style>

<script>
$(document).ready(function() {
	var nav2Offset = $('#navbar2').offset();
	
	$('#input-field').hide();
 	
	if('${order}' != "") {	//select박스 선택하면 그 값 유지해서 보이게 하기
		$('select[name=order]').val('${order}');
	}
	
	
});	 
</script>

</head>

<body>
<header>
		<div class="navbar" id="navbar2Main"
			style="background: #ffffff; border-bottom: #ffffff; box-shadow: none">
			<div class="container">
				<div class="panel-control-left" id="navbar2">
					<a href="#" data-activates="slide-out-left-2"
						class="sidenav-control-left"><i class="fa fa-bars"></i></a>
				</div>
				<div class="site-title" id="navbar2Logo">
					<a
						href="${pageContext.request.contextPath}/store/${ storeVO.storeName}"
						class="logo"><h1
							style="color: #000000; -webkit-text-stroke: #000000;">${ storeVO.floor }
							${ storeVO.storeName}</h1></a>
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
					<i class="fa fa-search" aria-hidden="true" id="storeSearch"></i>
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
						MEN<span><i class="fa fa-chevron-right"></i></span>
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
						WOMEN<span><i class="fa fa-chevron-right"></i></span>
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
						BOYS<span><i class="fa fa-chevron-right"></i></span>
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
						GIRLS<span><i class="fa fa-chevron-right"></i></span>
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

	</header>
	
	<section>
	 <div class="team-app app-pages app-section" style="margin-top: 0px">
	
		
		<!-- 인기상품 리스트 -->
		<div class="tabs-app app-pages app-section" id="mainProduct" style="margin-top: 0px">
			<div class="container">
				<div class="row">
					<div class="col s12">
						<c:choose>
						<c:when test="${ category2 eq '의류' and (category1 eq '남성' or category1 eq '남아')}">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1" id="tab1">전체</a></li>	<c:set var="tab1" value="전체"/>
							<li class="tab col s3"><a href="#tabs2" id="tab2">상의</a></li>	<c:set var="tab2" value="상의"/>	
							<li class="tab col s3"><a href="#tabs3" id="tab3">하의</a></li>	<c:set var="tab3" value="하의"/>
							<li class="tab col s3"><a href="#tabs4" id="tab4">아우터</a></li>	<c:set var="tab4" value="아우터"/>
						</ul>
						</c:when>
						<c:when test="${ category2 eq '의류' and (category1 eq '여성' or category1 eq '여아')}">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1" id="tab1">전체</a></li>	<c:set var="tab1" value="전체"/>
							<li class="tab col s3"><a href="#tabs2" id="tab2">상의</a></li>	<c:set var="tab2" value="상의"/> 
							<li class="tab col s3"><a href="#tabs3" id="tab3">하의</a></li>	<c:set var="tab3" value="하의"/>
							<li class="tab col s3"><a href="#tabs4" id="tab4">아우터</a></li>	<c:set var="tab4" value="아우터"/>
							<li class="tab col s3"><a href="#tabs5" id="tab5">원피스</a></li>	<c:set var="tab5" value="원피스"/>
						</ul>
						</c:when>
						<c:when test="${ category2 eq '신발' and (category1 eq '남성' or category1 eq '남아')}">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1" id="tab1">전체</a></li>		<c:set var="tab1" value="전체"/>
							<li class="tab col s3"><a href="#tabs1" id="tab2">스니커즈</a></li>	<c:set var="tab2" value="스니커즈"/>
							<li class="tab col s3"><a href="#tabs2" id="tab3">워커</a></li>		<c:set var="tab3" value="워커"/>
							<li class="tab col s3"><a href="#tabs3" id="tab4">로퍼</a></li>		<c:set var="tab4" value="로퍼"/>
							<li class="tab col s3"><a href="#tabs4" id="tab5">러닝</a></li>		<c:set var="tab5" value="러닝"/>
						</ul>	
						</c:when>
						<c:when test="${ category2 eq '신발' and (category1 eq '여성' or category1 eq '여아')}">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1" id="tab1">전체</a></li>		<c:set var="tab1" value="전체"/>
							<li class="tab col s3"><a href="#tabs2" id="tab2">스니커즈</a></li>	<c:set var="tab2" value="스니커즈"/>
							<li class="tab col s3"><a href="#tabs3" id="tab3">힐</a></li>		<c:set var="tab3" value="힐"/>
							<li class="tab col s3"><a href="#tabs4" id="tab4">로퍼</a></li>		<c:set var="tab4" value="로퍼"/>
							<li class="tab col s3"><a href="#tabs5" id="tab5">부츠</a></li>		<c:set var="tab5" value="부츠"/>
						</ul>
						</c:when>
						<c:when test="${ category2 eq '잡화' and (category1 eq '남성' or category1 eq '남아')}">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1" id="tab1">전체</a></li>	<c:set var="tab1" value="전체"/>
							<li class="tab col s3"><a href="#tabs2" id="tab2">가방</a></li>	<c:set var="tab2" value="가방"/>
							<li class="tab col s3"><a href="#tabs3" id="tab3">지갑</a></li>	<c:set var="tab3" value="지갑"/>
							<li class="tab col s3"><a href="#tabs4" id="tab4">양말</a></li>	<c:set var="tab4" value="양말"/>
							<li class="tab col s3"><a href="#tabs5" id="tab5">시계</a></li>	<c:set var="tab5" value="시계"/>
						</ul>
						</c:when>
						<c:when test="${ category2 eq 'Accessories' and (category1 eq '여성' or category1 eq '여아')}">
						<ul class="tabs">
							<li class="tab col s3"><a href="#tabs1" id="tab1">전체</a></li>	<c:set var="tab1" value="전체"/>
							<li class="tab col s3"><a href="#tabs2" id="tab2">가방</a></li>	<c:set var="tab2" value="가방"/>
							<li class="tab col s3"><a href="#tabs3" id="tab3">지갑</a></li>	<c:set var="tab3" value="지갑"/>
							<li class="tab col s3"><a href="#tabs4" id="tab4">양말</a></li>	<c:set var="tab4" value="양말"/>
							<li class="tab col s3"><a href="#tabs5" id="tab5">쥬얼리</a></li>	<c:set var="tab5" value="쥬얼리"/>
						</ul>
						</c:when>
						</c:choose>
						<c:set var="sum1" value="0"/><c:set var="sum2" value="0"/><c:set var="sum3" value="0"/><c:set var="sum4" value="0"/><c:set var="sum5" value="0"/>	
						<!-- 인기상품 리스트 -->
						<div class="tabs-app app-pages app-section" id="mainProduct" style="margin-top: 0px; padding-top: 10px">
						<div class="container">
						<c:if test="${ category2 ne 'new' }">
						<div class="row">
							<select name="order" class="form-control browser-default" style="width:35%; float: right;">
								<option>신상품순</option>
								<option>낮은가격순</option>
								<option>높은가격순</option>
							</select>
						</div>
						</c:if>
						<div id="tabs1">
						<c:forEach items="${ storeItem }" varStatus="status" var="item">
									<div class="col s6" style="padding: 13px">
										<div class="entry">
											<img src="${pageContext.request.contextPath}/resources/img/store1.png" alt="">
											<h6>
												<a href="">${ item.itemName }</a>
											</h6>
											<div class="price">
												<h5>${ item.price }원</h5>
												<c:set var="sum1" value="${sum1 + 1 }"/>
											</div>
										</div>
									</div>
						</c:forEach>
						</div>
						<div id="tabs2">
						<c:forEach items="${ storeItem }" varStatus="status" var="item">
							<c:if test="${item.itemCategory3 eq tab2 }">
									<div class="col s6" style="padding: 13px">
										<div class="entry">
											<img src="${pageContext.request.contextPath}/resources/img/store1.png" alt="">
											<h6>
												<a href="">${ item.itemName }</a>
											</h6>
											<div class="price">
												<h5>${ item.price }원</h5>
												<c:set var="sum2" value="${sum2 + 1 }"/>
											</div>
										</div>
									</div>
							</c:if>
						</c:forEach>
						</div>	
						<div id="tabs3">
						<c:forEach items="${ storeItem }" varStatus="status" var="item">
							<c:if test="${item.itemCategory3 eq tab3 }">
									<div class="col s6" style="padding: 13px">
										<div class="entry">
											<img src="${pageContext.request.contextPath}/resources/img/store1.png" alt="">
											<h6>
												<a href="">${ item.itemName }</a>
											</h6>
											<div class="price">
												<h5>${ item.price }원</h5>
												<c:set var="sum3" value="${sum3 + 1 }"/>
											</div>
										</div>
									</div>
							</c:if>
						</c:forEach>
						</div>
						<div id="tabs4">
						<c:forEach items="${ storeItem }" varStatus="status" var="item">
							<c:if test="${item.itemCategory3 eq tab4 }">
									<div class="col s6" style="padding: 13px">
										<div class="entry">
											<img src="${pageContext.request.contextPath}/resources/img/store1.png" alt="">
											<h6>
												<a href="">${ item.itemName }</a>
											</h6>
											<div class="price">
												<h5>${ item.price }원</h5>
												<c:set var="sum4" value="${sum4 + 1 }"/>
											</div>
										</div>
									</div>
							</c:if>
						</c:forEach>
						</div>
						<div id="tabs5">
						<c:forEach items="${ storeItem }" varStatus="status" var="item">
							<c:if test="${item.itemCategory3 eq tab5 }">
									<div class="col s6" style="padding: 13px">
										<div class="entry">
											<img src="${pageContext.request.contextPath}/resources/img/store1.png" alt="">
											<h6>
												<a href="">${ item.itemName }</a>
											</h6>
											<div class="price">
												<h5>${ item.price }원</h5>
												<c:set var="sum5" value="${sum5 + 1 }"/>
											</div>
										</div>
									</div>
							</c:if>
						</c:forEach>
					</div>
					</div>
					</div>	
						
					</div>
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
	<script type="text/javascript">
	var check = "${sum1}"	//전체값 표시
	$('#category3Count').text('('+check+')');
	
	$('select[name=order]').change(function() {	//선택박스 변경될떄
		var category2;
		
		if('${category1}' != "") {	
			switch('${category1}') {
			case "남성" : category2 = "men";
				break;
			case "여성" : category2 = "women";
				break;
			case "남아" : category2 = "boys";
				break;
			case "유아" : category2 = "girls";
				break;
			}
		}
		
		switch('${category2}') {
		case "의류" : category2 += "Clothes";
			break;
		case "신발" : category2 += "Shoes";
			break;	
		case "잡화" : category2 += "Accessories";
			break;
		default : category2 = '${category2}';
			break;
		}
		
		location.href="${pageContext.request.contextPath}/store/${ storeVO.storeName}/"+category2+"?order="+$('select[name=order]').val();
	});
	
	$('body').click(function(e) {
		if($(e.target).attr("id")=='tab1' || $(e.target).attr("id")=='tab2' || $(e.target).attr("id")=='tab3' //탭값에 따라 변경
				|| $(e.target).attr("id")=='tab4' || $(e.target).attr("id")=='tab5') {
			var tabs;
			switch($(e.target).attr("id")) {
			case "tab1" : tabs = '${sum1}'
				break;
			case "tab2" : tabs = '${sum2}'
				break;
			case "tab3" : tabs = '${sum3}'
				break;
			case "tab4" : tabs = '${sum4}'
				break;
			case "tab5" : tabs = '${sum5}'
				break;
			}
			$('#category3Count').text('('+tabs+')');
		}
 		
		if($(e.target).is('#storeSelect')) {
			$('.selectSubmit').submit();
		}
		
 		if($(e.target).is('#storeSearch')) {
			$('#input-field').show();
			$('#navbar2').hide();
			$('#navbar2Logo').hide();
			$('#navbar2Search').hide();
			$('#search').val("");
			$('#search').focus();
		} else if($(e.target).hasClass('exitSearch')) {
			$('#input-field').hide();
			$('#navbar2').show();
			$('#navbar2Logo').show();
			$('#navbar2Search').show();
		}
 		
 		$('.selectSubmit').submit(function() {
 			$('.selectSubmit').attr("action", "${pageContext.request.contextPath}/store/${ storeVO.storeName}/"+$('#search').val());
 		});
 	});
	</script>
</body>
</html>