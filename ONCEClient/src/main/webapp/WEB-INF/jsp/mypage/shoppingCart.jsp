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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.transitions.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
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
	</style>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
<script type="text/javascript">

	var listJSON = '${sessionScope.listJSON}';
	var resultList = $.parseJSON(listJSON);
	var storeJSON = '${sessionScope.storeJSON}';
	var storeList = $.parseJSON(storeJSON);
		
	var colorList = null;
	var sizeList = null;
	
	var btnList = new Array();	/* 옵션 버튼 눌린 횟수*/
	var itemCnt = new Array();	/* 해당 item의 상품 개수 */
	for(var index=0; index<resultList.length; index++){
		btnList[index] = 0;	
		itemCnt[index] = 0;
	}
	var cntList = new Array(); /* 해당 store의 item 개수 */
	for(var loop=0; loop<storeList.length; loop++){
		cntList[loop] = 0;
	}
		
	var sumCntList = new Array();	/* 해당 store까지 누적 item 개수*/
	for(var loop=0; loop<storeList.length; loop++){
		sumCntList[loop] = 0;
	}
	
	function getAllTotal(resultList){
		
		
		if(listJSON != null){
			$.each(storeList, function(loop, store){

				var ori_total_storeNo = 0; /* 매장별 상품 총 정상가 */
				var cur_total_storeNo = 0; /* 매장별 상품 총 금액 */
				var itemCnt_storeNo = 0; /* 매장별 상품 총 개수 */
				
				var storeNo = store.storeNo;
				cntList[loop] = 0;
				
				if(loop!=0){
					sumCntList[loop] = sumCntList[loop-1];
				}
				
				$.each(resultList, function(index, item){	/* storeNo 같은 거 끼리 묶기 */
					
					if( storeNo == item.storeNo){
						
						itemCnt[index] = item.count;
						
						++cntList[loop];
						++sumCntList[loop];
						
						ori_total_storeNo += item.price*itemCnt[index];
												
						if(item.salePrice == 0){
							cur_total_storeNo += item.price*itemCnt[index];
						}else{
							cur_total_storeNo += item.salePrice*itemCnt[index];
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
		getAllTotal(resultList);
		$('.changeOption').hide();
		
		<c:forEach var="storeVO" items="${ storeList }" varStatus="loop">
		<c:forEach var="itemContents" items="${productList}" varStatus="status">
			settingPrice($('#price_'+${loop.index}+'_'+${status.index}).text(), ${loop.index}, ${status.index});
			
			var salePrice='${itemContents.salePrice}';
			if(salePrice!=0){
				settingSalePrice($('#sale_'+${loop.index}+'_'+${status.index}).text(), ${loop.index}, ${status.index});				
			}			
		</c:forEach>
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

	
	function oriPriceForm(loop, index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/oriPriceForm",
			data : {
				'loop'  : loop,
				'index' : index
			},
			success : function(data) {
				$('#oriPrice_'+loop+"_"+index).html("");
				$('#oriPrice_'+loop+"_"+index).html(data);
				settingPrice($('#price_'+loop+'_'+index).text(), loop, index);
			}
		});
	}
	
	function salePriceForm(loop, index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/salePriceForm",
			data : {
				'loop'  : loop,
				'index' : index
			},
			success : function(data) {
				$('#salePrice_'+loop+"_"+index).html("");
				$('#salePrice_'+loop+"_"+index).html(data);
				var salePrice = data.salePrice;
				if(salePrice != 0){
					settingSalePrice($('#sale_'+loop+'_'+index).text(), loop, index);			
				}
			}
		});
	}
	
	function changeCnt(loop, index){
		
		var count = $('#count_'+loop+"_"+index).val();
		
		sumCntList[loop] = -itemCnt[index] + count;
		cntList[loop] = -itemCnt[index] + count;
		itemCnt[index] = count;
		
		if(count==0){
			alert('수량을 0보다 이상인 값으로 설정해 주세요.');
			$('#count_'+loop+"_"+index).focus();
		}else{
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
							
					history.go(0);					
				}
			});
			
		}		
	}
	
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
	
	function showOption(loop, index){	/* 옵션 리스트 보여주게끔 */
		
		if(btnList[index]==0){
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
		}
	
		$('#changeOption_'+loop+"_"+index).show();
		
		btnList[index]++;
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
				$('#option_'+loop+"_"+index).html(newJsonList[index].color+" | "+newJsonList[index].size+"&nbsp;&nbsp;&nbsp;");				
				
				$('#color_'+loop+"_"+index).val('');
				$('#color_'+loop+"_"+index).val(newJsonList[index].color);
				
				$('#size_'+loop+"_"+index).val('');
				$('#size_'+loop+"_"+index).val(newJsonList[index].size); 
							
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
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				$('#shoppingCart').html("");
				$('#shoppingCart').html(data);
				
			}
		});	
	}
	
	function deleteAll(loop, index){
		
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
				'loop'  : loop,
				'index' : index
			},
			contentType : "application/json; charset=UTF-8",
			success : function(data) {				
				$('#shoppingCart').html("");
				$('#shoppingCart').html(data);
			}, complete : function(){
				alert(storeName + "의 상품들이 모두 삭제되었습니다.");
			}
		});
		
	}
	
	function buySubmit(loop){

		var count_loop = document.getElementsByClassName('count_'+loop);
		var count_check = new Array();	/* 수량이 0인 item이 있나 체크 | 0일때 true, 1 이상일 때 false*/
		var check = false;
	
		for(i=0;i<count_loop.length;i++){
			if(count_loop[i].value==0){
				count_check[i] = true;
			}else{
				count_check[i] = false;
			}
		}
		
		for(i=0;i<count_loop.length;i++){
			if(count_check[i]==true){
				check = true;
				break;
			} 
		}		
	
		if(check==false){
			$('#count_'+loop).val(cntList[loop]);
			
			$('#orderVO_'+loop).attr("action", "${ pageContext.request.contextPath }/orderList/addCartItem");
			
			$('#orderVO_'+loop).submit();
		}else{
			alert('수량을 0보다 이상인 값으로 설정해 주세요.');
		}
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
				<h3 class="bold">Shopping Cart</h3>
			</div>
			<c:choose>
				<c:when test="${ not empty productList and productList != ''}"><!-- productList에 상품이 1개 이상 -->
					<c:forEach var="storeVO" items="${ storeList }" varStatus="loop">
					<form id="orderVO_${loop.index }" name="orderVO" method="post">
					<input type="hidden" name="storeNo" value="${ storeVO.storeNo }" />
					<input type="hidden" name="storeName" value="${ storeVO.storeName }" />
					<input type="hidden" id="count_${ loop.index }" name="count" />
					<div class="entry" id="productList_${ loop.index }">
						<c:forEach var="itemContents" items="${productList}" varStatus="status">
						<c:if test="${ status.first }">
							<p style="font-weight: bold;">${ storeVO.storeName }</p>
						</c:if>			
							<c:if test="${ storeVO.storeNo  eq itemContents.storeNo}">
							<div class="car/t-title s-title">
								<div class="row">
									<div class="col s4">
										<img src="/image/${itemContents.imgSaveName}" alt="이미지 준비 중">
									</div>
									<div class="col s7">
										<p>${itemContents.itemName}</p>
										<input type="hidden" name="orderDetails[${ status.index }].detailNo" value="${ itemContents.detailNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].itemName" value="${ itemContents.itemName }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeNo" value="${ itemContents.storeNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeName" value="${ itemContents.storeName }" />
										<input type="hidden" name="orderDetails[${ status.index }].imgSaveName" value="${ itemContents.imgSaveName }" />
									</div>
									<div class="col s1">
										<a href="" class="deleteStore_${ loop.index }" onclick="deleteOne(${ loop.index }, ${status.index})">
										<i class="fa fa-remove"></i></a><!-- 삭제버튼 -->
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>Count</p>
									</div>
									<div class="col s8">
										<button class="button" type="button" onclick="minusCnt(${loop.index}, ${status.index}), changeCnt(${loop.index}, ${status.index})">-</button>
										<input type="number" name="orderDetails[${status.index }].count" id="count_${loop.index}_${status.index}" class="count_${loop.index} " value="${itemContents.count}" onchange="changeCnt(${loop.index}, ${status.index})"/>
										<button class="button" type="button"  onclick="plusCnt(${loop.index}, ${status.index}), changeCnt(${loop.index}, ${status.index})">+</button>
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
										<button id="optionBtn" type="button"  class="button" onclick="showOption(${loop.index}, ${status.index})">옵션변경</button>
									</div>
									<div class="changeOption" id="changeOption_${loop.index}_${status.index}" style="display: table; margin-top: 15px; margin-bottom: 15px; margin-left: auto; margin-right: auto; text-align: center;">
										<div>
											<label style="float: left; width: 45px;">color</label> 
											<select id="colorSelect_${loop.index}_${status.index}" class="form-control browser-default" style="width: 200px;">
												<option value="" selected="selected" disabled="disabled">color를 선택해 주세요</option>
												<c:forEach var="color" items="${colorList}">
												<option value="${color}">${color}</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px;">
											<label style="float: left; width: 45px;">size</label> 
											<select id="sizeSelect_${loop.index}_${status.index}" class="form-control  browser-default" style="width: 200px;">
												<option value="" selected="selected" disabled="disabled">size 선택해 주세요</option>
												<c:forEach var="size" items="${sizeList}">
												<option value="${size}">${size}</option>
												</c:forEach>
											</select>											
										</div>
										<div>
											<button id="option" type="button"  class="button" onclick="changeConfirm(${loop.index}, ${status.index})">변경</button>
											<button id="option" type="button" class="button" onclick="changeCancle(${loop.index}, ${status.index})">취소</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col s4">
											<p>Price</p>
											<input type="hidden" name="orderDetails[${ status.index }].price" value="${itemContents.price}"/>
											<input type="hidden" name="orderDetails[${ status.index }].salePrice" value="${itemContents.salePrice}"/>
										</div>
										<div class="col s8">
											<div id="oriPrice_${loop.index}_${status.index}">
											<p style="float: left; margin-left: 10px;">정상가:</p>
												<p id="price_${loop.index}_${status.index}" >${itemContents.price * itemContents.count }</p>
											</div>
											<br/>
											<div id="salePrice_${loop.index}_${status.index}">
											<c:choose>
											<c:when test="${ itemContents.salePrice eq 0 }" />
											<c:otherwise>
											<p style="float: left; margin-left: 10px;">할인가:</p>
												<p style="color:red; " id="sale_${loop.index}_${status.index}" >${itemContents.salePrice * itemContents.count}</p>
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
							<div class="col s4" style="float: left;">
								<span style="float: none;">_&nbsp;</span><h6 style="float: right;"id="dis_total_${ loop.index }"></h6>
							</div>
							<div class="col s8">
								<h5>Total</h5>
							</div>
							<div class="col s4">
								<h5 id="cur_total_${ loop.index }"></h5>
							</div>
						</div>
						<div class="row">
							<button type="button" class="button" onclick="buySubmit(${ loop.index })" style="background-color:#ffc305;margin-bottom: 10px; font-size: 12px;">주 문 하 기</button>
						</div>
					</div>
					</form>
					</c:forEach>
				</c:when>
				
				<c:otherwise><!-- productList에 아무것도 없을 때  -->
					<div class="entry" style="margin-bottom: 125px;">
					<h6>장바구니에 등록된 상품이 없습니다.</h6>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- end product cart -->
	</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	
	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>      
      <c:choose>
				<c:when test="${ not empty loginVO }">
					<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login/login" style="width: 20%" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose>      
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
	

	
</body>
</html>