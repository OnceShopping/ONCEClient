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
	var listJSON = '${sessionScope.listJSON}';
	var resultList = $.parseJSON(listJSON);
	var storeJSON = '${sessionScope.storeJSON}';
	var storeList = $.parseJSON(storeJSON);
		
	var colorList = null;
	var sizeList = null;
		
	function getAllTotal(resultList){
		
		if(listJSON != null){
			$.each(storeList, function(i, store){
				var ori_total_storeNo = 0; /* 매장별 상품 총 정상가 */
				var cur_total_storeNo = 0; /* 매장별 상품 총 금액 */
				var itemCnt_storeNo = 0; /* 매장별 상품 총 개수 */
				
				var storeNo = store.storeNo;
				
				$.each(resultList, function(index, item){	/* storeNo 같은 거 끼리 묶기 */
					
					if( storeNo == item.storeNo){
						itemCnt_storeNo = item.count;
						
						ori_total_storeNo += item.price*itemCnt_storeNo;
						
						if(item.salePrice == 0){
							cur_total_storeNo += item.price*itemCnt_storeNo;
						}else{
							cur_total_storeNo += item.salePrice*itemCnt_storeNo;
						}
					}
					$('#ori_total_'+i).text(ori_total_storeNo);
					$('#dis_total_'+i).text(ori_total_storeNo - cur_total_storeNo);
					$('#cur_total_'+i).text(cur_total_storeNo);
				});
			});
		}
	}
	
	$(document).ready(function(){
	
		getAllTotal(resultList);
		
		$('.changeOption').hide();
	});
	
	function plusCnt(loop, index){
		var changeCnt = $('#count_'+loop+"_"+index).val();
		changeCnt++;
		$('#count_'+loop+"_"+index).val(changeCnt);
	}
	
	function minusCnt(loop, index){
		if($('#count_'+loop+"_"+index).val() == 1){
		}else{
			var changeCnt = $('#count_'+loop+"_"+index).val();
			changeCnt--;
			$('#count_'+loop+"_"+index).val(changeCnt);
		}
	}
		
	function oriPriceForm(loop, index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/oriPriceForm",
			data : {
				'index' : index
			},
			success : function(data) {
				$('#oriPrice_'+loop+"_"+index).html("");
				$('#oriPrice_'+loop+"_"+index).html(data);
			}
		});
	}
	
	function salePriceForm(loop, index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/salePriceForm",
			data : {
				'index' : index
			},
			success : function(data) {
				$('#salePrice_'+loop+"_"+index).html("");
				$('#salePrice_'+loop+"_"+index).html(data);
			}
		});
	}
	
	function changeCnt(loop, index){
		
		var count = $('#count_'+loop+"_"+index).val();
		
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
				
				oriPriceForm(loop, index);
				salePriceForm(loop, index);
							
				var ori_total_storeNo = 0;
				var ori_total_storeNo = 0;
				var ori_total_storeNo = 0;
						
				getAllTotal(changeList);
			}		
		});
					
	}
	
	function showOption(loop, index){	/* 옵션 리스트 보여주게끔 */
		
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
					$('#colorSelect_'+loop+"_"+index).append(colors);
				}
				for(var i=0; i<sizeList.length; i++){
					var sizes = $("<option>"+sizeList[i]+"</option>");
					$('#sizeSelect_'+loop+"_"+index).append(sizes);
				}
			}
		});
		
		$('#changeOption_'+loop+"_"+index).show();
	}
	
	function changeConfirm(loop, index){ /* 옵션 변경 적용 */
		
		var colorSelect = $('#colorSelect_'+loop+"_"+index).val();
		var sizeSelect = $('#sizeSelect_'+loop+"_"+index).val();
				
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
				$('#option_'+loop+"_"+index).text(newJsonList[index].color+" | "+newJsonList[index].size);
				
				alert('변경되었습니다.');
				$('#changeOption_'+loop+"_"+index).hide();
			}
		});
	}
	
	function changeCancle(loop, index){
		alert('취소되었습니다.');
		$('#changeOption_'+loop+"_"+index).hide();
	}

	function deleteOne(loop, index) {
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/deleteOne",
			type : "get",
			data : {
				'loop'  : loop,
				'index' : index
			},
			success : function(data) {
				alert("삭제되었습니다.");
				$('#shoppingCart').html("");
				$('#shoppingCart').html(data);
			}
		});
	}
	
	function deleteAll(loop){
		
		var storeName = null;
		$.each(storeList, function(i, store){
			if(i==loop){
				storeName = store.storeName;
			}
		});
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/deleteAll",
			type : "get",
			data : {
				'loop' : loop
			},
			success : function(data) {
				alert("삭제되었습니다.");
				alert(storeName + "의 상품들이 모두 삭제되었습니다.");
				$('#shoppingCart').html("");
				$('#shoppingCart').html(data);
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
				<c:when test="${ not empty productList }"><!-- productList에 상품이 1개 이상 -->
					<c:forEach var="storeVO" items="${ storeList }" varStatus="loop">
					<div class="entry" id="productList_${ loop.index }">
						<p style="font-weight: bold;">${ storeVO.storeName }
						<button id="deleteAll_${ loop.index }" class="button" style="background-color: #86E57F; font-weight: normal;  float: right; margin-bottom: 10px;" onclick="deleteAll(${ loop.index })">장바구니 비우기</button>
						</p>
						<c:forEach var="itemContents" items="${productList}" varStatus="status">
							<c:if test="${ storeVO.storeNo  eq itemContents.storeNo}">
							<div class="car/t-title s-title">
								<div class="row">
									<div class="col s4">
										<img src="${pageContext.request.contextPath}/upload/${itemContents.imgSaveName}" alt="이미지 준비 중">
									</div>
									<div class="col s7">
										<p>${itemContents.itemName}</p>
									</div>
									<div class="col s1">
										<a href="" onclick="deleteOne(${ loop.index }, ${status.index})">
										<i class="fa fa-remove"></i></a>
										<!-- 삭제버튼 -->
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>Count</p>
									</div>
									<div class="col s8">
										<button class="button" onclick="minusCnt(${loop.index}, ${status.index})">-</button>
										<input id="count_${loop.index}_${status.index}" type="number"
											value="${itemContents.count}">
										<button class="button" onclick="plusCnt(${loop.index}, ${status.index})">+</button>
										<button class="button" onclick="changeCnt(${loop.index}, ${status.index})">변경</button>
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>옵션</p>
									</div>
									<div class="col s8"	>
										<p id="option_${loop.index}_${status.index}" style="float: left;">${itemContents.color} | ${itemContents.size} &nbsp;&nbsp;&nbsp;</p>
										<button id="optionBtn" class="button" onclick="showOption(${loop.index}, ${status.index})">옵션변경</button>
									</div>
									<div class="changeOption" id="changeOption_${loop.index}_${status.index}" style="display: table; margin-top: 15px; margin-bottom: 15px; margin-left: auto; margin-right: auto; text-align: center;">
										<div>
											<label style="float: left; width: 45px;">color</label> 
											<select	id="colorSelect_${loop.index}_${status.index}" name="color" class="form-control  browser-default" style="width: 200px;">
												<option value="" selected="selected" disabled="disabled">color를 선택해 주세요</option>
												<c:forEach var="color" items="${colorList}">
												<option value="${color}">${color}</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px;">
											<label style="float: left; width: 45px;">size</label> 
											<select	id="sizeSelect_${loop.index}_${status.index}" name="size"	class="form-control browser-default" style="width: 200px;">
												<option value="" selected="selected" disabled="disabled">size를 선택해주세요 </option>
												<c:forEach var="size" items="${sizeList}">
												<option value="${size}">${size}</option>
												</c:forEach>
											</select>
										</div>
										<div>
											<input type="hidden" value="${status.index}">
											<button id="option" class="button" onclick="changeConfirm(${loop.index}, ${status.index})">변경</button>
											<button id="option" class="button" onclick="changeCancle(${loop.index}, ${status.index})">취소</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col s4">
											<p>Price</p>
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
						</div>
					</div>
					</c:forEach>
				</c:when>
				
				<c:otherwise><!-- productList에 아무것도 없을 때  -->
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