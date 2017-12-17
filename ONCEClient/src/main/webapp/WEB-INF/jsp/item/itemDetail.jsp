<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>O N C E</title>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</head>
<script>
	function cartFunc() {		
		var listJSON = '${sessionScope.listJSON}';
		var resultList = null;
		if(listJSON != ''){
			resultList = $.parseJSON(listJSON);
		}
		var itemName = document.getElementById('itemName').value;
		var size = document.getElementById('size').value;
		var color = document.getElementById('color').value;
		
		if (listJSON != null) {
			
			var tf = 0;
			$.each(resultList, function(index, item) {
				if (item.itemName == itemName && item.color == color && item.size == size) { // 장바구니에 선택한 물품이 이미 있는 경우
					if (confirm('이미 장바구니에 물건이 있습니다. 장바구니로 이동하시겠습니까?')) { // 확인
						location.href = "${pageContext.request.contextPath}/mypage/shoppingCart";
						tf = 1;
					} else { // 취소
						tf = 1;
					}
				}
		});
			var itemJSON = '${itemJSON}';
			var result = $.parseJSON(itemJSON);
			var itemForm = document.forms['itemInfo'];
			
			if(tf==1){
				
			}else{
				itemForm.action = "${ pageContext.request.contextPath }/shoppingCart/addItem/"+result.storeNo+"/"+result.num ;
				itemForm.submit();
			}
		}else{	// 장바구니에 물품이 아예 없는 경우
			itemInfo.action = "${ pageContext.request.contextPath }/shoppingCart/addItem/"+result.storeNo+"/"+result.num ;
			itemForm.submit();
		}
	}
	
	function buyFunc(){
		
		var itemJSON = '${itemJSON}';
		var result = $.parseJSON(itemJSON);
		var itemForm = document.forms['itemInfo'];
		
		itemForm.action = "${ pageContext.request.contextPath }/orderList/addOneItem/"+result.storeNo+"/"+result.num ;
		itemForm.submit();
	}
	
</script>
<body>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->

	<section>
		<div class="login app-pages app-section">
			<div class="container">
				<form:form name="itemInfo" commandName="itemContentsVO" method="post">
					<div>
						<label>제 품</label>
						<form:input path="itemName" id="itemName" type="text"
							value="${itemVO.itemName}" />
					</div>
					<div class="col s8">
						<label>count</label>
						<form:input path="count" id="count" type="number" value="1"
							class="validate" />
					</div>
					<div class="col s8">
						<label>color</label>
						<form:select class="browser-default" path="color" id="color" >
							<form:option value="">- [필수] color를 선택해 주세요 -</form:option>
							<form:options items="${itemVO.colorList}" />
						</form:select>
						<label>size</label>
						<form:select class="browser-default" path="size" id="size" >
							<form:option value="">- [필수] size를 선택해 주세요 -</form:option>
							<form:options items="${itemVO.sizeList}" />
						</form:select>
					</div>
					<div class="col s8">
						<input class="button" type="button" id="shoppingCart" value="장바구니 담기" onclick="cartFunc()"/>
						<input class="button" type="button" id="orderList" value="구매하기" onclick="buyFunc()" />
					</div>
				</form:form>
			</div>
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->

	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp"></jsp:include>
	<!-- end navbar -->
</body>
</html>