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
</head>
<script>

$(document).ready(function() {
    var cnt = 0;
    
    $('#size').attr('disabled', true);
    
    $('#color').change(function() {
       $('#size').attr('disabled', false);
    });
    
    $('#size').change(function() {
       var sltColor = $('#color').val();
       var sltSize = $('#size').val();
       var itemName = $('#itemName').val();
       
       var idNo = cnt;      
       
       if(sltColor != '') {
    	       	   
    	   $.ajax({
   			url : "${ pageContext.request.contextPath }/item/itemDetail",
   			type : "get",
   			data : {
   				'itemName'	: itemName,
   				'sltColor' 	: sltColor,
   				'sltSize'	: sltSize,
   				'idNo'	: idNo
   			},
   			success : function(data) {
   				$('#sltItemList').val("");
   				$('#sltItemList').append(data);
   				idNo = ++cnt;
   			}
   			});
          
          //초기화 
          $('#color').val('');
          $('#size').val('');
          $('#size').attr('disabled', true);
          
       }

        
      $('#rmv' + idNo).click(function() {
    	  $('#delete'+idNo).val('true');
    	  $(this).closest('li').remove();
          return false;
       });
        
    });
});
    
	function cartFunc() {		
		var listJSON = '${sessionScope.listJSON}';
		var resultList = null;
		
		if(listJSON != '' && listJSON != null){
			resultList = $.parseJSON(listJSON);
		}
		
		var itemName = document.getElementById('itemName').value;
		var size = document.getElementById('size').value;
		var color = document.getElementById('color').value;
		
		if (resultList == null || resultList == '') {	// 장바구니에 물품이 아예 없는 경우
			var itemJSON = '${itemJSON}';
			var result = $.parseJSON(itemJSON);
			var itemForm = document.forms['itemContentsVO'];
			itemForm.action = "${ pageContext.request.contextPath }/shoppingCart/addItem/"+result.storeNo+"/"+result.num ;
			itemForm.submit();
		}else{
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
			var itemForm = document.forms['itemContentsVO'];
			
			if(tf==1){
				
			}else{
				itemForm.action = "${ pageContext.request.contextPath }/shoppingCart/addItem/"+result.storeNo+"/"+result.num ;
				itemForm.submit();
			}
		}
	}
	
	function buyFunc(){
		var itemJSON = '${itemJSON}';
		var result = $.parseJSON(itemJSON);
		var itemForm = document.forms['itemContentsVO'];
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
				<form id="itemContentsVO" name="itemContentsVO" method="post">
					<div>
						<label>제 품</label>
						<input name="itemName" id="itemName" type="text" value="${itemVO.itemName}" />
					</div>
					<div class="col s8">
						<label>color</label>
						<select class="browser-default" id="color" >
							<option value="">- [필수] color를 선택해 주세요 -</option>
							<c:forEach var="color" items="${itemVO.colorList}">
							<option value="${color}">${color}</option>
							</c:forEach>
						</select>
						<label>size</label>
						<select class="browser-default" id="size" >
							<option value="">- [필수] size를 선택해 주세요 -</option>
							<c:forEach var="size" items="${itemVO.sizeList}">
							<option value="${size}">${size}</option>
							</c:forEach>
						</select>
					</div>
					<div>
				    	<ul id="sltItemList"> 	
				        </ul>
      				</div>
      				<div class="col s8">
						<input class="button" type="button" id="shoppingCart" value="장바구니 담기" onclick="cartFunc()"/>
						<input class="button" type="button" id="orderList" value="구매하기" onclick="buyFunc()" />
					</div>
					</form>
				</div>
			</div>
		</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->

	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp"></jsp:include>
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