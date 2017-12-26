<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
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
</head>
<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
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
						
						if(item.salePrice == 0){
							cur_total_storeNo += item.price*itemCnt_storeNo;
						}else{
							cur_total_storeNo += item.salePrice*itemCnt_storeNo;
						}
					}
					$('#ori_total_'+loop).text(ori_total_storeNo);
					if((ori_total_storeNo - cur_total_storeNo)!=0){
						$('#dis_total_'+loop).text("-" + (ori_total_storeNo - cur_total_storeNo));
					}					
					$('#cur_total_'+loop).text(cur_total_storeNo);
				});
			});
		}
	}
	
	$(document).ready(function(){
	
		getAllTotal(orderResult);
		
		$('#storeName_cnt').html( storeName + "<span style='float: right; font-weight: normal;'>총 &nbsp;수량 : <u>" +cnt+"</u>개</span>");
		
		<c:forEach var="storeVO" items="${ storeList }" varStatus="loop">
		<c:forEach var="itemContents" items="${productList}" varStatus="status">
			settingPrice($('#price_'+${loop.index}+'_'+${status.index}).text(), ${loop.index}, ${status.index});
			var salePrice='${itemContents.salePrice}';
			if(salePrice!=0){
				settingSalePrice($('#sale_'+${loop.index}+'_'+${status.index}).text(), ${loop.index}, ${status.index});				
			}
		</c:forEach>
			settingOriTotalPrice($('#ori_total_'+${loop.index}).text(), ${loop.index});
			settingDisTotalPrice($('#dis_total_'+${loop.index}).text(), ${loop.index});
			settingCurTotalPrice($('#cur_total_'+${loop.index}).text(), ${loop.index});
		</c:forEach>
		
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
	
		$('#ori_total_'+loop).html(oriTotalPrice);
	}
	function settingDisTotalPrice(obj, loop){
		
		var disTotalPrice = comma(obj);
	
		$('#dis_total_'+loop).html(disTotalPrice);
	}
	function settingCurTotalPrice(obj, loop){
		
		var curTotalPrice = comma(obj);
	
		$('#cur_total_'+loop).html(curTotalPrice);
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
<body>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->
	
	<!-- product cart -->
	<div class="product-cart app-pages app-section">
		<div id="shoppingCart" class="container">
			<div class="pages-title">
				<h3>Order LIST</h3>
			</div>
			<c:forEach var="storeVO" items="${ preStoreList }" varStatus="loop">
				<form id="orderVO" name="orderVO" action="${ pageContext.request.contextPath }/orderList/checkCnt" method="post">
				<input type="hidden" name="storeNo" value="${ storeVO.storeNo }" />
				<input type="hidden" name="storeName" value="${ storeVO.storeName }" />
					<div class="entry" id="preOrderList_${ loop.index }">
						<p id="storeName_cnt" style="font-weight: bold;">${ storeVO.storeName }</p>
						<c:forEach var="itemContents" items="${preOrderList}" varStatus="status">
							<c:if test="${ storeVO.storeNo  eq itemContents.storeNo}">
							<div class="car/t-title s-title">
								<div class="row">
									<div class="col s4">
										<img src="/image/${itemContents.imgSaveName}" alt="이미지 준비 중">
									</div>
									<div class="col s7">
										<p>${itemContents.itemName}</p>
										<input type="hidden" name="orderDetails[${ status.index }].itemName" value="${ itemContents.itemName }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeNo" value="${ itemContents.storeNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeName" value="${ itemContents.storeName }" />
										<input type="hidden" name="orderDetails[${ status.index }].detailNo" value="${ itemContents.detailNo }" />
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>Count</p>
									</div>
									<div class="col s8">
										<input type="number" name="orderDetails[${status.index }].count" id="count_${loop.index}_${status.index}" value="${itemContents.count}" style="color: #111;" readonly="readonly"/>
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>옵션</p>
									</div>
									<div class="col s8"	>
										<p id="option_${loop.index}_${status.index}" style="float: left;">${itemContents.color} | ${itemContents.size} &nbsp;&nbsp;&nbsp;</p>
										<input type="hidden" name="orderDetails[${ status.index  }].color" id="color_${loop.index}_${status.index}" value="${itemContents.color}" />
										<input type="hidden" name="orderDetails[${ status.index  }].size" id="size_${loop.index}_${status.index}" value="${itemContents.size}" />
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>Price</p>
										<input type="hidden" name="orderDetails[${ status.index }].price" value="${itemContents.price}"/>
										<input type="hidden" name="orderDetails[${ status.index }].salePrice" value="${itemContents.salePrice}"/>
									</div>
									<div class="col s8" >
										<div id="oriPrice_${loop.index}_${status.index}">
										<p style="float: left; margin-left: 10px;">정상가:</p>
										<p style="float: left;" id="price_${loop.index}_${status.index}">${itemContents.price * itemContents.count }</p>		
										</div>
										<br/>
										<div id="salePrice_${loop.index}_${status.index}">
										<!-- 세일가 0 이면 출력 안되게끔 제어 걸기  -->
										<c:choose>
											<c:when test="${ itemContents.salePrice eq 0 }" />
											<c:otherwise>
												<p style="float: left;  margin-left: 10px; ">할인가:</p>
												<p style="color:red; float: left;" id="sale_${loop.index}_${status.index}">${itemContents.salePrice * itemContents.count}</p>
											</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
							</div>
						</c:if>
				</c:forEach>
				</div>
								
				<div class="entry" style="margin-top: 10px;">
					<p style="font-weight: bold;">결제 정보 선택</p>
					<div class="car/t-title s-title">
						<div class="row">
							<div class="col s4">
								결재 방식
							</div>
							<div class="col s7">
								<select id="paymentChange" class="form-control browser-default" onchange="optionChange(this)" disabled>
									<option id="depositless" value="무통장 입금" selected="selected">무통장 입금</option>
									<option id="creditCard" value="카드 결제">카드 결제</option>
									<option id="mobileBill" value="휴대폰 결제">휴대폰 결제</option>
								</select>
								<div id="paymentOption">
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
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="cart-total" id="cart-total_${ loop.index }">			
					<div class="row">
						<div class="col s8">
							<h6>상품 가격</h6>
						</div>
						<div class="col s4">
							<h6 id="ori_total_${ loop.index }"></h6>
						</div>
						<div class="col s8">
							<h6>할인 금액</h6>
						</div>
						<div class="col s4">
							<h6 id="dis_total_${ loop.index }"></h6>
						</div>
						<div class="col s8">
							<h5>Total</h5>
						</div>
						<div class="col s4">
							<h5 id="cur_total_${ loop.index }"></h5>
						</div>
					</div>
					<div class="row">
						<button type="submit" class="button" style="background-color: #ffc305; margin-bottom: 10px; font-size: 12px;">결  제 하 기</button>
						<button type="button" class="button" onclick="history.go(-1); return false;">취소</button>
					</div>
				</div>
			</form>
			</c:forEach>
		</div>
	</div>
	<!-- end product cart -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" flush="false"></jsp:include>
	<!-- end footer -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="#" style="width: 20%;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<c:choose>
			<c:when test="${ empty loginVO }">
				<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	<!-- script -->

	<script
		src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</body>
</html>