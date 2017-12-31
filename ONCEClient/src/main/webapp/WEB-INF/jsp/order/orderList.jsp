<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.transitions.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

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
	
	input[type="button"], input[type="submit"], button {
	font-size: inherit;
	background-color:#fff;
	color: #999cff;
	padding: 5px 30px 5px 30px;
	border: solid #a8b2ff 2px;
}
	</style>
	 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	

<script type="text/javascript">

var preOrderJSON = '${preOrderJSON}';
var orderResult = $.parseJSON(preOrderJSON);
var preStoreJSON = '${preStoreJSON}';
var storeResult = $.parseJSON(preStoreJSON);

var cnt = 0;
var storeName = null;

var cntList = new Array(); /* 해당 store의 상품 개수 */
for(var k=0; k<storeResult.length; k++){
	cntList[k] = 0;
}

function getAllTotal(resultList){
	
	if(preOrderJSON != null){
		$.each(storeResult, function(loop, store){
			
			var ori_total_storeNo = 0; /* 매장별 상품 총 정상가 */
			var cur_total_storeNo = 0; /* 매장별 상품 총 금액 */
			var itemCnt_storeNo = 0; /* 매장별 상품 총 개수 */
			
			cntList[loop] = 0;
			
			var storeNo = store.storeNo;
			storeName = store.storeName;
			
			$.each(resultList, function(index, item){	/* storeNo 같은 거 끼리 묶기 */
				
				if( storeNo == item.storeNo){
					itemCnt_storeNo = item.count;
					cnt += item.count;
					cntList[loop]++;
					
					ori_total_storeNo += item.price*itemCnt_storeNo;
					settingPrice($('#price_'+loop+'_'+index).text(), loop, index);
					
					if(item.salePrice == 0){
						cur_total_storeNo += item.price*itemCnt_storeNo;
					}else{
						cur_total_storeNo += item.salePrice*itemCnt_storeNo;
						settingSalePrice($('#sale_'+loop+'_'+index).text(), loop, index);			
					}
				}
				$('#ori_total_'+loop).text(ori_total_storeNo);
				if((ori_total_storeNo - cur_total_storeNo)!=0){
					$('#dis_total_'+loop).text((ori_total_storeNo - cur_total_storeNo));
				}					
				$('#cur_total_'+loop).text(cur_total_storeNo);
				
				
				settingOriTotalPrice($('#ori_total_'+loop).text(), loop);
				settingDisTotalPrice($('#dis_total_'+loop).text(), loop);
				settingCurTotalPrice($('#cur_total_'+loop).text(), loop);

			});
		});
	}
}

$(document).ready(function(){

	getAllTotal(orderResult);
	
	$('#storeName_cnt').html( storeName + "<span style='float: right; font-weight: normal; color:#9e9e9e; font-size:13px; margin-top: 7px;'>(총 &nbsp;수량 : <u>" +cnt+"</u>개)</span>");
	
	$('#orderListButton').click(function() {
		$('#orderVO').submit();
	});
	
	var heightDiv = $('.row-height');
	$('.col-height').css('height', heightDiv.height());
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
function settingPrice(obj, loop, index){
	
	var price = comma(obj);

	$('#price_'+loop+'_'+index).html(price);
}
function settingSalePrice(obj, loop, index){
	
	var salePrice = comma(obj);

	$('#sale_'+loop+'_'+index).html(salePrice);
}
function settingOriTotalPrice(obj, loop){
	
	var oriTotalPrice = comma(obj);

	$('#ori_total_'+loop).html(oriTotalPrice+"원");
}
function settingDisTotalPrice(obj, loop){
	
	var disTotalPrice = comma(obj);
	if(disTotalPrice == "" || disTotalPrice =="0원") {
	$('#dis_total_'+loop).html("0원");
	} else {
		$('#dis_total_'+loop).html("-"+disTotalPrice+"원");
	}
}
function settingCurTotalPrice(obj, loop){
	
	var curTotalPrice = comma(obj);

	$('#cur_total_'+loop).html(curTotalPrice+"원");
}

function optionChange(obj){
	
	var payVal = obj.value;
		
	$.ajax({
		url : "${ pageContext.request.contextPath }/orderList/payChoice",
		type : "get",
		data : {
			'payVal' : payVal
		},
		success : function(data) {
			$('#paymentOption').val("");
			$('#paymentOption').html(data);
		}
	});	
}
	
</script>
</head>
<body>

	<header>
		<!-- navbar -->
		<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section class="app-pages app-section">
	<!-- product cart -->
	<div class="product-cart">
		<div id="shoppingCart" class="container">
			<div class="pages-title">
				<h3 class="bold">주문목록</h3>
			</div>
				<c:forEach var="storeVO" items="${ preStoreList }" varStatus="loop">
				<form id="orderVO" name="orderVO" action="${ pageContext.request.contextPath }/orderList/checkCnt" method="post">
				<input type="hidden" name="storeNo" value="${ storeVO.storeNo }" />
				<input type="hidden" name="storeName" value="${ storeVO.storeName }" />
				<div class="entry" id="preOrderList_${ loop.index }" style="padding-right: 10px">
				<span id="storeName_cnt" style="font-weight: bold; font-size: 20px">${ storeVO.storeName }</span>
				<c:forEach var="itemContents" items="${preOrderList}" varStatus="status">
				<c:if test="${ storeVO.storeNo  eq itemContents.storeNo}">
				
				<div class="car/t-title s-title">
					<div class="row row-height" style="margin-bottom: 10px">
						<div class="col s4 col-height">
							<img src="/image/${itemContents.imgSaveName}" alt="이미지 준비 중">
						</div>
						<div class="col s7">
							<span class="bold">${itemContents.itemName}</span><br>
							<span id="option_${loop.index}_${status.index}" style="float: left; color: #9e9e9e">${itemContents.color} | ${itemContents.size} &nbsp;&nbsp;&nbsp;</span><br>
							<span style=" color: #9e9e9e">수량 : </span><span id="count_${loop.index}_${status.index}" style=" color: #9e9e9e">${itemContents.count}</span><br>
							<span id="oriPrice_${loop.index}_${status.index}" style=" color: #9e9e9e"><span id="price_${loop.index}_${status.index}">${itemContents.price * itemContents.count }</span>원</span>
						<input type="hidden" name="orderDetails[${ status.index }].itemName" value="${ itemContents.itemName }" />
						<input type="hidden" name="orderDetails[${ status.index }].storeNo" value="${ itemContents.storeNo }" />
						<input type="hidden" name="orderDetails[${ status.index }].storeName" value="${ itemContents.storeName }" />
						<input type="hidden" name="orderDetails[${ status.index }].detailNo" value="${ itemContents.detailNo }" />
						<input type="hidden" name="orderDetails[${ status.index }].imgSaveName" value="${ itemContents.imgSaveName }" />
						</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
		</div>
		
		<div class="entry" id="cart-total_${ loop.index }" style="margin-top: 10px; padding-right: 10px">			
					<div class="row" style="margin-bottom: 10px">
						<div class="col s8" style="text-align: left">
							<h6>상품금액</h6>
							<h6>할인금액</h6>
							<h6 class="bold">총 주문금액</h6>
						</div>
						
						<div class="col s4">
                           
                        </div>
						
						
						<div class="col s4" style="text-align: right">
							<h6 id="ori_total_${ loop.index }"></h6>
							<h6 id="dis_total_${ loop.index }"></h6>
							<h6 id="cur_total_${ loop.index }" style="color: red" class="bold"></h6>
						</div>
					</div>
					
				</div>
		
		<div class="entry" style="margin-top: 10px; padding-right: 10px;">
					<p style="font-weight: bold;">결제수단</p>
					<div class="car/t-title s-title">
						<div class="row" style="margin-bottom: 10px">
							<div class="col s7">
								<input type="radio" name="group" id="ex_rd1" value="무통장 입금"><label for="ex_rd1">무통장입금</label><br>
								<input type="radio" name="group" id="ex_rd2" value="카드 결제"><label for="ex_rd2">카드 결제</label><br>
								<input type="radio" name="group" id="ex_rd3" value="휴대폰 결제"><label for="ex_rd3">휴대폰 결제</label><br>
								<!--  <select id="paymentChange" class="form-control browser-default" onchange="optionChange(this)" disabled>
									<option id="depositless" value="무통장 입금" selected="selected">무통장 입금</option>
									<option id="creditCard" value="카드 결제">카드 결제</option>
									<option id="mobileBill" value="휴대폰 결제">휴대폰 결제</option>
								</select> -->
								<!-- <div id="paymentOption">
									<ul>
										<li>입금자명</li>
										<li><input type="text" disabled/></li>
										<li>입금은행</li>
										<li>
										<select class="form-control browser-default" disabled>
											<option value="하나은행" selected="selected">하나은행</option>
											<option value="신한은행">신한은행</option>
											<option value="우리은행">우리은행</option>
										</select>
										</li>
									</ul>
								</div> -->
							</div>
						</div>
					</div>
				</div>
				<div class="entry" style="margin-top: 10px; border:0px; padding: 0px">
				<div style="width: 100%">
						<button type="button" id="orderListButton" style="width: 100%; height: 40px">결  제 하 기</button>
						<!-- <button type="button" class="button" onclick="history.go(-1); return false;">취소</button> -->
				</div>
				</div>
			</form>
			</c:forEach>
			
		</div>
	</div>
	
	<!-- end product cart -->
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
					<a href="${pageContext.request.contextPath}/login/login" style="width: 20% color: #b2b2e8" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose> 		
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	

	
</body>
</html>