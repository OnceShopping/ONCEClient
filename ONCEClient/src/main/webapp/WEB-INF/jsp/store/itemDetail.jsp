<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

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

<style type="text/css">
	#mainImg, #tabs1, #tabs2, #tabs3, #tabs4 {
		text-align: center;
	}
	
	#mainDescription {
		padding-top: 10px;
		margin-left: 10%;
		margin-right: 10%;
		text-align: left;
	}
		
	#imgDetail {
		width: 95%;
		background-color: white;
		
	}
	
	.sltItem {
		border: 0.5px solid #b2b2b2;
		margin-left: 10px;
		margin-right: 10px;
		margin-bottom: 10px;
		padding-left: 10px;
	}
	
	.cntItem {
		max-width: 20px;
	}
	
	.removeItem {
		padding-top: 3px;
		margin-left: 95%;
	}
	
	#insertCmt {
		resize: none;
		width: 75%;
		margin-bottom: 0px;
		padding-bottom: 0px;
		overflow: auto;
		max-height: 3em;
		vertical-align: middle;		
	}
	
	#sbmCmt {
		font-size: inherit;
         margin-left: 10px;
         margin-right: 10px;
         -webkit-border-radius: 28;
         -moz-border-radius: 28;
         border-radius: 28px;
         background-color:#fff;
         color: #999cff;
         padding: 5px 30px 5px 30px;
         border: solid #a8b2ff 2px;
	}
	
	.dltCmt {
		width: 20%;
		background-color: #ff443a;
		display: none;
		
	}
	.wrap{
     overflow-x: scroll;
     white-space:nowrap;
   }
   .wrap img{
       width:300px;
       height:100%;
   }

	.effect {
	    display: inline-block;
	    position: relative;
	}
	.effect:after {
	    position: absolute;
	    display: block;
	    content: "";
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    box-shadow: 
	      inset 0 0 20px #E9E8ED,
	      inset 0 0 20px #E9E8ED,
	      inset 0 0 20px #E9E8ED,
	      inset 0px -5px 20px #fff;
	}
	#review td,tr{
		padding:0px;
		margin:0px;
		padding-bottom: 5px;
		padding-top: 5px;
	}
</style>

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
 <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
var iPrice=0;
var itName;
var storeName;

	$(document).ready(function() {
		
		var cnt = 0;
		var priceVal=0;			
		
		iPrice = $('#itemPrice').text();
		itName = $('#itName').text(); //아이템 이름
		storeName = $('#storeName').text(); //매장 이름
		
		// 첫 화면에 표시되는 모든 가격에 comma 설정
		var settings = document.getElementsByClassName("setting");
		for(var i=0; i<settings.length; i++){
			var j = settings[i].innerText;
			settings[i].innerText=comma(j);
		}
		
		$('#size').attr('disabled', true);
	    
	    $('#color').change(function() {
	       $('#size').attr('disabled', false);
	    });
	    
	    $('#size').change(function() {
	       var sltColor = $('#color').val();
	       var sltSize = $('#size').val();
	       var itemName = $('#itemName').val();
	       var basePrice = $('#cntPrice').text();
	       
	       var idNo = cnt;      

	       //기존에 추가한 상품을 중복으로 추가하는 경우
	       var dbcheck=false;

	       for(var i=0; i<idNo; i++){
	    	   if(sltColor==$('#color_'+i).val()){
	    		   if(sltSize==$('#size_'+i).val()){
	    			   alert('동일한 상품이 존재합니다. 아래에 존재하는 상품을 확인해주세요.');
	    			   dbcheck=true;
	    			
		    			//초기화 
		   				$('#color').val('');
		   				$('#size').val('');
		   				$('#size').attr('disabled', true);		
	    		   }
	    	   }
	       }
	       
	       
	       
	       if((sltColor != '')&&(dbcheck==false)) {
	                    
			$.ajax({
	            url : "${ pageContext.request.contextPath }/store/itemDetail",
	            type : "post",
	            data : {
	               'itemName' : itemName,
	               'sltColor' : sltColor,
	               'sltSize' : sltSize,
	               'idNo' : idNo
	            },
	            success : function(data) {
	            	$('#sltItemList').val("");
		            $('#sltItemList').append(data);
		            	           
		            //item을 추가할 때마다 발생하는 상품 금액을 정수형으로 바꾸는 로직
		            var price = $('#itemPrice').text(); //첫 화면에 설정된 금액(comma 존재)
		            var num = 0;

		            var commaPrice = price.split(",");
		            for(var j in commaPrice)
		            	num+=commaPrice[j];
		            
		            //화면에 표시되는 총 구매 금액을 정수형으로 바꾸는 로직
		            var totalNum = basePrice.split(","); //총금액(comma 존재)
		        	var addPrice=0;
		        
		        	for(var i in totalNum)
		        		addPrice+=totalNum[i];
		        	
		        	//화면에 표시되는 총 구매 금액과 해당 상품의 상품금액을 더함
		            var setPrice = parseInt(addPrice)+  parseInt(num);
		            
		        	//comma를 설정하여 총 구매 금액에 반영
		            priceVal = comma(setPrice);
		            $('#cntPrice').text(priceVal);
		            idNo = ++cnt;
		           
	            }
	       	});

				//초기화 
				$('#color').val('');
				$('#size').val('');
				$('#size').attr('disabled', true);		
			}
		});
		
		//리뷰 등록
	    $('#sbmCmt').click(function(){
			var text = $('#comment').val();
			var memNo = $('#memNo').val();
			var num = $('#itemNum').val();
			var check;
			
			if(memNo==""){
				alert('로그인 후 이용 가능합니다.');
				location.href="${ pageContext.request.contextPath }/login/loginForm";
				return false;
			}
			else if(text==""){
				alert("상품평을 입력해주세요.");
				$('#comment').focus();
			}else{
				alert('comment check');/////
				
				$.ajax({
		   			url : "${ pageContext.request.contextPath }/comment/check",
		   			type : "get",
		   			dataType:"json",
		   			contentType : "Content-Type:application/json; charset=utf-8",
		   			data : {
		   				"memNo"	: memNo,
		   				"num": num
		   			},
		   			success : function(data) {

		   				alert("check :" + check );
		   				alert('comment check 완료'); ////////
		   				check = data;
		   			
		   				if(check==true){
		   					alert('item');
		   					
		   					$.ajax({
		   						url : "${ pageContext.request.contextPath }/comment/item",
		   						type : "get",
		   						dataType : "json",
		   						contentType : "Content-Type:application/json; charset=utf-8",
		   						data : {
		   					   		'memNo'	: memNo,
		   					   		'content': text,
		   					   		'num': num
		   					   	},
		   					   	success : function(data) {
		   					   	alert('작성하는 순간');
		   					   		print(data);
		   					   	}
		   					});
		   				}else{
		  					alert('해당 상품을 구매해야만 리뷰 작성이 가능합니다.');
 						}		
		   			}, error:function(data){
		   				alert('처음 ajax 에러.. 우엑');
		   			}
		   		});
								
			}
		});
		
		 var num = $('#itemNum').val();
		 
		 $.ajax({
			url : "${ pageContext.request.contextPath }/comment/show",
			type : "get",
		   	dataType : "json",
		   	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		   	data : {
		   		'num': num
		   	},
		   	success : function(data) {
		   		
		   		print(data);
		   		
		   	},error : function(request, status, error) {
				alert("에러 발생! : " + request.status + "message : "+ request.responseText+ "\n"+ "error : "+ error);
			}
		});
	});
	
	function print(data){

		row = "<table id='review'>";
		row += "<tr style='border-bottom: 1px solid #E3E3E3;'>";
		row += "<td style='width:50%; text-align: center; font-size: 12px;'>내용</td>";
		row += "<td style='width:20%; text-align: center; font-size: 12px;'>작성자</td>";
		row += "<td style='width:30%; text-align: center; font-size: 12px;'>작성일<td>";
		row += "</tr>"; 
		
		$.each(data,function(index,item){
			
			row += "<tr>";
			row += "<td style='text-align: left; padding-left: 10px; font-size: 11.5px;'>" + item.content + "</td>";
			row += "<td style='text-align: center; font-size: 11.5px;'>" + item.id + "</td>";
			row += "<td style='text-align: center; font-size: 11.5px;'>" + item.date + "</td>";
			row += "</tr>";
			
		});
		
		row += "</table>";

		$('#cmtList').html(row);
	}
	
	function cartFunc() {      
	      var listJSON = '${sessionScope.listJSON}';
	      var resultList = null;

	      //총 금액을 체크하여 옵션 미선택 시 예외처리
	      var checkPrice = $('#cntPrice').text();
	      if(checkPrice==0){
	    	  alert('color 또는 size를 선택하여 상품을 추가해야 장바구니에 담기가 가능합니다.');
	    	  return false;
	      }
	      
	      if(listJSON != '' && listJSON != null){
	         resultList = $.parseJSON(listJSON);
	      }
	      
	      var itemName = document.getElementById('itemName').value;
	      var size = document.getElementById('size').value;
	      var color = document.getElementById('color').value;
      	      
	      if (resultList == null || resultList == '') {   // 장바구니에 물품이 아예 없는 경우
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
	      var result = null;
	      
	      //총 금액을 체크하여 옵션 미선택 시 예외처리
	      var checkPrice = $('#cntPrice').text();
	      if(checkPrice==0){
	    	  alert('color 또는 size를 선택하여 상품을 추가해주세요.');
	    	  return false;
	      }
	      
	      if(itemJSON != '' && itemJSON != null){
	    	  result = $.parseJSON(itemJSON);
		  }
	      var itemForm = document.forms['itemContentsVO'];
	      itemForm.action = "${ pageContext.request.contextPath }/orderList/addOneItem/"+result.storeNo+"/"+result.num ;
	      itemForm.submit();
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

	function calculate_M(){  //-표시를 누를 경우
		
		var total = $('#cntPrice').text(); //총 금액으로 표시되는 금액
		
		var totalNum = total.split(",");
		var num=0;
		
		for(var i in totalNum)
			num+=totalNum[i]; 
	
		var price = parseInt(num)-parseInt(iPrice);
		
		$('#cntPrice').text(comma(price));
	}
	
	function calculate_P(){  //+표시를 누를 경우
		
		var total = $('#cntPrice').text();
		
		var totalNum = total.split(",");
		var num=0;
		
		for(var i in totalNum)
			num+=totalNum[i]; 
		
		var price = parseInt(num)+parseInt(iPrice);
		
		$('#cntPrice').text(comma(price));
	}
	function deleteOption(count){ //x표시를 누를 경우
		
		var total = $('#cntPrice').text();
		
		var totalNum = total.split(",");
		var num=0;
		
		for(var i in totalNum)
			num+=totalNum[i]; 
		
		var delPrice = eval(iPrice + '*' + count);
		var price = parseInt(num) - parseInt(delPrice);
		
		$('#cntPrice').text(comma(price));
		
	}
	function share(){

		Kakao.init('e41ce637926a9ca7c2b5e1040f027929');

		Kakao.Link.sendTalkLink({
			label:'이 상품 어때요?',
			image:{
				src:'http://13.124.194.6:8080/image/ONCE-846dcdc8-01a1-41d2-a7a4-2d25d213f439.png',
				width:'300',
				height:'200'
			},
			webButton:{
				text:'#'+storeName+' #'+itName,
				url:'http://13.124.194.6:8080/ONCEAdmin/'
			}
		});
	}
</script>

</head>
<body>
	<header>
		<input type="number" >
		<!-- 인덱스에서 바로 접근했을 경우 탑 메뉴 -->
		<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
		<!-- 매장에서 접근했을 경우 탑 메뉴 -->
	</header>
	
		
	<!-- 주문하기 버튼 누르기 이후 -->
	<div id="orderDetail" class="modal bottom-sheet">
		<form id="itemContentsVO" name="itemContentsVO" method="post">
	   	<p style="padding-left: 5px;">옵션</p>
	   	<hr style="border: 0.5px solid #b2b2b2; margin: 0px;"/>
	   	<div class="modal-content">
			<div>
				<input name="itemName" id="itemName" type="hidden" value="${itemContentsVO.itemName}" />
				<input name="price" id="price" type="hidden" value="${itemContentsVO.price}" />
				<label>COLOR</label>
                  <select class="browser-default" id="color" >
                     <option value="">- [필수] color를 선택해 주세요 -</option>
                     	<c:forEach var="color" items="${itemVO.colorList}">
                     		<option value="${color}">${color}</option>
                     	</c:forEach>
                  </select>
				<label>SIZE</label>
                  <select class="browser-default" id="size" >
                     <option value="">- [필수] size를 선택해 주세요 -</option>
                     <c:forEach var="size" items="${itemVO.sizeList}">
                     <option value="${size}">${size}</option>
                     </c:forEach>
                  </select>
			</div>
	   </div>
	   <div>
			<ul id="sltItemList">
			</ul>
	   </div>
	   <p style="padding-right: 5px; text-align: right">총 주문 금액 <span id="cntPrice" style="color: red;">0</span> 원</p>
	   <div class="modal-footer" style="padding-top: 3%; text-align: center; background-color: #fff; border: 1px solid #a8b2ff; float: left; width: 50%;">
			<a style="width: 50%; color: #a8b2ff; padding-right: 8%;" class="w3-bar-item" id="shoppingCart" onclick="cartFunc()">장바구니 담기</a>
		</div>
		<div class="modal-footer" style="padding-top: 3%; text-align: center; background-color: #a8b2ff; float: right; width: 50%;">
			<a style="width: 50%; color: #fff; padding-left: 8%;" class="w3-bar-item" id="orderList" onclick="buyFunc()">바로 주문하기</a>
	   </div>
	   </form>
	 </div>
	<!-- 하단 주문 버튼 끝-->
	
	
	<section>
		<!-- 메인 시작 -->
		<div id="mainImg">
					<c:forEach items="${ imgList }" var="list" varStatus="status">
						<c:if test="${status.count eq 1}">
							<div style="width: 100%; line-height: 100px;">
								<img src="/image/${list.imgSaveName}" alt="" style="width: 100%; max-width: 760px; vertical-align: middle; height:auto;" >
							</div>
						</c:if>
					</c:forEach>
				</div>
			<div class="container" style="margin-top:20px; margin-bottom:20px;">
				<div id="mainDescription">
					<h6 id="storeName"><span style='color: #9E9E9E; font-style: oblique;'>${ storeName }</span>
					<a id="kakao-link-btn" href="javascript:share();"><span style='color: #3B1E1E; float: right; font-size: 22px;'><i class="fa fa-share-alt"></i></span></a></h6>
					<h4><b><span id="itName">${ itemContentsVO.itemName }</span></b></h4>
					<h5>
						<c:choose>
							<c:when test="${ itemContentsVO.salePrice ne 0}">
								<span style="text-decoration:line-through; color: #9E9E9E; font-weight: lighter;"><span class="setting"><c:out value="${ itemContentsVO.price }"/></span><span style="font-size:14px;"> 원</span></span>
								<span style="color: red; margin-left: 10px;" class="setting" id="itemPrice" >${ itemContentsVO.salePrice }</span><span style="font-size:14px;"> 원</span>
							</c:when>
							<c:otherwise>
							<span id="itemPrice" class="setting"><c:out value="${ itemContentsVO.price }"/></span><span style="font-size:14px;"> 원</span>
							</c:otherwise>
						</c:choose>
					</h5>
				</div>
			</div>
		<!-- 메인 끝 -->
		
		<!-- 상세 시작 -->
		<div class="tabs-app app-section" id="mainProduct">
			<div class="container">
				<div class="row">
					<div class="col s12">
						<ul class="tabs">
							<li class="tab col s4"><a href="#tabs1">상품 정보</a></li>
							<li class="tab col s4"><a href="#tabs2">리뷰</a></li>
							<li class="tab col s4"><a href="#tabs3">주문 정보</a></li>
						</ul>
						<!-- 상세 정보 시작 -->
						<div id="tabs1">
							<p style="text-align: left; margin:20px; font-size: 11.5px;">
								<c:choose>
									<c:when test="${ empty itemContentsVO.detail }">
										죄송합니다 상품 상세 정보는 준비 중입니다.
									</c:when>
									<c:otherwise>
										${ itemContentsVO.detail }
									</c:otherwise>
								</c:choose>							
							</p>
							<div class="row">
								<c:forEach items="${ imgList }" var="list" varStatus="status">
									<c:if test="${status.count eq 2}"> 
										<div style="width: 90%; line-height: 100px; text-align: center; margin-left: auto; margin-right: auto;" class="effect">
											<img src="/image/${list.imgSaveName}" alt="" style="width: 100%; max-width: 760px; vertical-align: middle; height:auto;" ><br/>
										</div>
									</c:if>
								</c:forEach>
								<form action="${pageContext.request.contextPath}/store/imgDetail" method="post">
									<input type="hidden" id="itemNum" name="num" value="${ itemContentsVO.num }">
									<input type="submit" id="imgDetail" value="이미지 더 보기+" style="border: 0.5px solid black; padding:5px;"/>
								</form>
								<br/>
								<!-- 스토어 정보 -->
								<hr style="border:3px solid #EEEEEE; margin-bottom: 7px;">
								<div style="text-align: left;">
									<span style="margin-left: 10px; font-weight: bold;">스토어 정보</span>
									<hr style="border:1px solid #EEEEEE; margin-top: 7px;">
									<h5 style="font-style: oblique; margin-left:10px; text-decoration: underline;">${storeName}</h5>
									<div style="margin-top:5px; margin-left:15px; font-size: 11.5px;">
										<i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp;${storeVO.ceo}<br/>
										<i class="fa fa-building-o" aria-hidden="true"></i>&nbsp;&nbsp;${storeVO.companyNo }<br/>
										<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;&nbsp;주중, 주말 10:00 AM ~ 5:00 PM <br/>
							 			<i class="fa fa-volume-control-phone" aria-hidden="true"></i>&nbsp;&nbsp;${storeVO.phone}
									</div>
								</div>
								<!-- 신상품 -->
								<hr style="border:3px solid #EEEEEE; margin-bottom: 7px;">
								<div id="newItem">
									<p style="text-align: left; margin-left: 10px; font-size: large;"><b>신상품</b></p>
									<div class="wrap">
									<c:forEach items="${ newItemList }" varStatus="status">
										<c:if test="${ status.index % 2 eq 0 }">
											<c:forEach items="${ newItemList }" var="newItemList" begin="${ status.index }" end="${ status.count + status.step }">
												<c:if test="${status.count <= 4}">
													<a href="${ pageContext.request.contextPath}/item/${newItemList.num}"><img src="/image/${ newItemList.imgSaveName }" alt="" style="width: 40%; vertical-align: middle; height:auto;"></a>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
									</div>
								</div>
								<!-- 신상품 끝 -->
							</div>
						</div>
						<!-- 상세 정보 끝 -->
						
						<!-- 리뷰 시작 -->
						<div id="tabs2">
							<br />
						    <div class="row">
							  <!-- 상품평 입력 시작 -->
						      <div class="input-field col s12" id="cmtTab">
						      	<form name="addCmt" id="addCmt">
							        <input type="text" placeholder="상품평을 입력해 주세요." id="comment" style="width: 65%; float: left; font-size: 11.5px; margin-left: 5px;">
							        <input type="hidden" name="memNo" id="memNo" value="${loginVO.memNo }">
							        <span style="float: right;">
							       		<input type="submit" class="button" id="sbmCmt" value="등록"/>
							       	</span>
						      	</form>
						      </div>
							  <!-- 상품평 입력 끝 -->
							  <!-- 상품평 리스트 시작 -->
						      <div class="col s12">
						      	<div id="cmtList" style='margin-top: 20px;'>
						      		
						      	</div>
						      </div>
							  <!-- 상품평 리스트 끝 -->
						    </div>
						</div>
						<!-- 리뷰 끝 -->
						
						<!-- 주문 정보 시작 -->
						<div id="tabs3">
							<br />
							<div class="row" style="text-align: left; margin-left: 10px; margin-right: 10px; font-size: 11.5px;">
								<b>교환/환불</b><br>
								상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br>
								환불요청 가능 기간은 상품 수령 후(수령완료 시점부터) 7일 이내입니다.<br><br>
								다음의 경우에는 예외적으로 교환 및 환불이 불가능합니다.<br>
								<ul style="list-style-type: circle;">
									<li><span style="font-size: 5px;"><i class="fa fa-circle" aria-hidden="true"></i></span> 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우</li>
									<li><span style="font-size: 5px;"><i class="fa fa-circle" aria-hidden="true"></i></span> 소비자 과실로 인한 옷의 변색(예:착색, 화장품, 오염 등)</li>
									<li><span style="font-size: 5px;"><i class="fa fa-circle" aria-hidden="true"></i></span> 착용으로 인한 니트류 상품의 늘어남 발생 및 가죽 제품의 주름 발생</li>
									<li><span style="font-size: 5px;"><i class="fa fa-circle" aria-hidden="true"></i></span> 기타 착용 흔적 : 텍 제거 등</li>
									<li><span style="font-size: 5px;"><i class="fa fa-circle" aria-hidden="true"></i></span> 구매 확정된 주문의 경우</li>
								</ul>
							</div>
						</div>
						<!-- 주문 정보 끝 -->
					</div>
				</div>
			</div>
		</div>
		<!-- 상세 끝 -->
	</section>

	
	<!-- 하단 주문 버튼 -->
	<div class="w3-bottom">
		<!-- 주문하기 버튼 누르기 이전 -->
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center; background-color: #a8b2ff;">
			<a href="#orderDetail" style="width: 80%; padding-left: 20%; color: #fff;" class="w3-bar-item">주문하기</a>
		<!-- 	<a href="#" style="width: 20%; color: #fff;" class="w3-bar-item"><i class="fa fa-heart-o"></i></a> -->
		</div>
	</div>

</body>
</html>