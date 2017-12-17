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
		
	alert(orderResult);
	
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
					$('#dis_total_'+loop).text(ori_total_storeNo - cur_total_storeNo);
					$('#cur_total_'+loop).text(cur_total_storeNo);
				});
			});
		}
	}
	
	$(document).ready(function(){
	
		getAllTotal(orderResult);
		
		$('#storeName_cnt').html( storeName + "<span style='float: right; font-weight: normal;'>총 &nbsp;수량 : <u>" +cnt+"</u>개</span>");
		
	});
		
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
	
	function paySubmit(loop){
		$('#count_'+loop).val(cntList[loop]);
			
		$('#orderVO_'+loop).attr("action", "${ pageContext.request.contextPath }/orderList/payment"+"/"+cntList[loop]);
		
		$('#orderVO_'+loop).submit();
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
										<img src="${pageContext.request.contextPath}/upload/${itemContents.imgSaveName}" alt="이미지 준비 중">
									</div>
									<div class="col s7">
										<p>${itemContents.itemName}</p>
										<input type="hidden" name="orderDetails[${ status.index }].itemName" value="${ itemContents.itemName }" />
										<input type="hidden" name="orderDetails[${ status.index }].detailNo" value="${ itemContents.detailNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeNo" value="${ itemContents.storeNo }" />
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>Count</p>
									</div>
									<div class="col s8">
										<input type="number" name="orderDetails[${status.index }].count" id="count_${loop.index}_${status.index}" value="${itemContents.count}" />
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
											<c:choose>
												<c:when test="${ itemContents.salePrice eq 0 }">
													<p style="float: left;">${itemContents.price * itemContents.count }</p>
												</c:when>
												<c:otherwise>
													<p style="text-decoration:line-through;">${itemContents.price * itemContents.count }</p>
												</c:otherwise>
											</c:choose>		
										</div>
										<br/>
										<div id="salePrice_${loop.index}_${status.index}">
										<!-- 세일가 0 이면 출력 안되게끔 제어 걸기  -->
										<c:choose>
											<c:when test="${ itemContents.salePrice eq 0 }" />
											<c:otherwise>
												<p style="float: left;  margin-left: 10px; ">할인가:</p>
												<p style="color:red; float: left;">${itemContents.salePrice * itemContents.count}</p>
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
						<button class="button" style="background-color: #ffc305; margin-bottom: 10px; font-size: 12px;">결  제 하 기</button>
					<!-- <button class="button" onclick="history.go(-1)">취소</button> -->
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

	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" flush="false"></jsp:include>
	<!-- end navbar -->

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