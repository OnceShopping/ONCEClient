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
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
			
		var listJSON = '${sessionScope.listJSON}';
		var resultList = $.parseJSON(listJSON);
		var ori_total = 0;
		var cur_total = 0;
		var itemCnt = 0;
		var colorList = null;
		var sizeList = null;
		
		if (listJSON != null) {
			$.each(resultList, function(index, item) {
				itemCnt = item.count;
				ori_total += item.price*itemCnt;
			});
		}
		
		if (listJSON != null) {
			$.each(resultList, function(index, item) {
				itemCnt = item.count;
				if(item.salePrice == 0){
					cur_total += item.price*itemCnt;
				}else{
					cur_total += item.salePrice*itemCnt;
				}
			});
		}
		
		$('#ori_total').text(ori_total);
		$('#dis_total').text(ori_total-cur_total);
		$('#cur_total').text(cur_total);
				
		$('.changeOption').hide();
	});
	
	function plusCnt(index){
		var changeCnt = $('#count_'+index).val();
		changeCnt++;
		$('#count_'+index).val(changeCnt);
	}
	
	function minusCnt(index){
		if($('#count_'+index).val() == 1){
		}else{
			var changeCnt = $('#count_'+index).val();
			changeCnt--;
			$('#count_'+index).val(changeCnt);
		}
	}
	
	function deleteFunction(index) {

		$.ajax({
					url : "${ pageContext.request.contextPath }/shoppingCart/deleteItem",
					type : "get",
					data : {
						'index' : index
					},
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					cache : false,
					success : function(data) {
						alert("삭제되었습니다.");
					}
				});
	}
	
	function oriPriceForm(index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/oriPriceForm",
			data : {
				'index' : index
			},
			success : function(data) {
				$('#oriPrice_'+index).html("");
				$('#oriPrice_'+index).html(data);
			}
		});
	}
	
	function salePriceForm(index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/salePriceForm",
			data : {
				'index' : index
			},
			success : function(data) {
				$('#salePrice_'+index).html("");
				$('#salePrice_'+index).html(data);
			}
		});
	}
	
	function changeCnt(index){
		
		var count = $('#count_'+index).val();
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/changeCnt",
			type : "get",
			data : {
				'index' : index,
				'count' : count
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			cache : false,
			success : function(data) {
				alert("수량이 변경 되었습니다.");
				var changeList = $.parseJSON(data);
				
				oriPriceForm(index);
				salePriceForm(index);
							
				var ori_total = 0;
				var cur_total = 0;
				var itemCnt = 0;
				
				if (changeList != null) {
					$.each(changeList, function(index, item) {
						itemCnt = item.count;
						ori_total += item.price*itemCnt;
					});
				}
				
				if (changeList != null) {
					$.each(changeList, function(i, item) {
						itemCnt = item.count;
						if(item.salePrice == 0){
							cur_total += item.price*itemCnt;
						}else{
							cur_total += item.salePrice*itemCnt;
						}
					});
				}
				
				$('#ori_total').text(ori_total);
				$('#dis_total').text(ori_total-cur_total);
				$('#cur_total').text(cur_total);
				
			}			
		});
			
	}
	
	function showOption(index){	/* 옵션 리스트 보여주게끔 */
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/showOption",
			type : "get",
			data : {
				'index' : index
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			cache : false,
			success : function(data) {
				var optionList = $.parseJSON(data);
				var colorList = optionList.colorList;
				var sizeList = optionList.sizeList;
				
				for(var i=0; i<colorList.length; i++){
					var colors = $("<option>"+colorList[i]+"</option>");
					$('#colorSelect_'+index).append(colors);
				}

				for(var i=0; i<sizeList.length; i++){
					var sizes = $("<option>"+sizeList[i]+"</option>");
					$('#sizeSelect_'+index).append(sizes);
				}
			}
		});
		
		$('#changeOption_'+index).show();
	}
	
	function changeConfirm(index){ /* 옵션 변경 적용 */
		
		var colorSelect = $('#colorSelect_'+index).val();
		var sizeSelect = $('#sizeSelect_'+index).val();
				
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/changeOption",
			type : "get",
			data : {
				'index' : index,
				'colorSelect' : colorSelect,
				'sizeSelect' : sizeSelect
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			cache : false,
			success : function(data) {
				var newJsonList = $.parseJSON(data);
				$('#option_'+index).text(newJsonList[index].color+" | "+newJsonList[index].size);
				
				alert('변경되었습니다.');
				$('#changeOption_'+index).hide();
			}
		});
	}
	
	function deleteAll(){
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/deleteAll",
			type : "get",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			cache : false,
			success : function(data) {
				alert("장바구니 목록이 삭제 되었습니다.");
				$('#productList').remove();
				$('.cart-total').remove();
				$('#shoppingCart').append('<h6>장바구니에 등록된 상품이 없습니다.</h6>');
			}
		});
	}
</script>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->

	<!-- product cart -->
	<div class="product-cart app-pages app-section">
		<div id="shoppingCart" class="container">
			<div class="pages-title">
				<h3>Shopping Cart</h3>
			</div>
			<c:choose>
				<c:when test="${ not empty productList }">
					<div class="entry" id="productList">
						<c:forEach var="itemContents" items="${productList}" varStatus="status">
							<div class="cart-title s-title">
								<div class="row">
									<div class="col s4">
										<img
											src="${pageContext.request.contextPath}/upload/${itemContents.imgSaveName}"
											alt="이미지 준비 중">
									</div>
									<div class="col s7">
										<h6>${itemContents.itemName}</h6>
									</div>
									<div class="col s1">
										<a href="" onclick="deleteFunction('${status.index}')"><i
											class="fa fa-remove"></i></a>
										<!-- 삭제버튼 -->
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<h6>Count</h6>
									</div>
									<div class="col s8">
										<button class="button" onclick="minusCnt(${status.index})">-</button>
										<input id="count_${status.index}" type="number"
											value="${itemContents.count}">
										<button class="button" onclick="plusCnt(${status.index})">+</button>
										<button class="button" onclick="changeCnt(${status.index})">변경</button>
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<h6>옵션</h6>
									</div>
									<div>
										<div id="option_${status.index}" class="col s4"	style="float: left;">${itemContents.color} | ${itemContents.size}</div>
										<div>
											<button id="optionBtn" class="button" onclick="showOption(${status.index})">옵션변경</button>
										</div>

										<div class="changeOption" id="changeOption_${status.index}"
											style="display: table; margin-top: 15px; margin-bottom: 15px; margin-left: auto; margin-right: auto; text-align: center;">
											<div>
												<label style="float: left">color&nbsp;&nbsp;&nbsp;</label> 
												<select	id="colorSelect_${status.index}" name="color" class="form-control" style="width: 200px;">
													<option value="" selected="selected" disabled="disabled">color를 선택해 주세요</option>
													<c:forEach var="color" items="${colorList}">
														<option value="${color}">${color}</option>
													</c:forEach>
												</select>
											</div>
											<div>
												<label style="float: left">size&nbsp;&nbsp;&nbsp;</label> <select
													id="sizeSelect_${status.index}" name="size"
													class="form-control" style="width: 200px;">
													<option value="" selected="selected" disabled="disabled">size를 선택해주세요 </option>
													<c:forEach var="size" items="${sizeList}">
														<option value="${size}">${size}</option>
													</c:forEach>
												</select>
											</div>
											<div>
												<input type="hidden" value="${status.index}">
												<button id="option" class="button"
													onclick="changeConfirm(${status.index})">변경</button>
												<button id="option" class="button"
													onclick="changeCancle(${status.index})">취소</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<h6>Price</h6>
									</div>
									<div class="col s8" >
										<div id="oriPrice_${status.index}">
										<!-- 세일가가 0이 아니면 취소선 되도록 제어 걸기 -->
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
										<div id="salePrice_${status.index}">
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
						</c:forEach>
					</div>
					<div class="cart-total">
						<div class="row" style="margin-bottom: 30px">
							<button id="deleteAll" class="button" onclick="deleteAll()">장바구니 비우기</button>
						</div>
						<div class="row">
							<div class="col s8">
								<h6>상품 가격</h6>
							</div>
							<div class="col s4">
								<h6 id="ori_total"></h6>
							</div>
							<div class="col s8">
								<h6>할인 금액</h6>
							</div>
							<div class="col s4">
								<h6 id="dis_total"></h6>
							</div>
							<div class="col s8">
								<h5>Total</h5>
							</div>
							<div class="col s4">
								<h5 id="cur_total"></h5>
							</div>
						</div>
						<div class="col s4">
								<button class="button" style="background-color: #ffc305; width: 75px; height: 30px; font-size: 12px;">결  제</button>
							</div>
					</div>
				</c:when>
				<c:otherwise>
					<h6>장바구니에 등록된 상품이 없습니다.</h6>
				</c:otherwise>
			</c:choose>

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
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</body>
</html>