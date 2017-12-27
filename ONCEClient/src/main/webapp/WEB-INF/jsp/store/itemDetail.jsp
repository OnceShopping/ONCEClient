<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
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
	
	#share {
		text-align: right;
		margin-right: 10%;
		font-size: large;
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
		height: 50px;
		width: 20%;
		vertical-align: middle;
	}
	
	.dltCmt {
		width: 20%;
		background-color: #ff443a;
		display: none;
		
	}
</style>

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
 
<script>
	var totalCount = 0;	// 총 상품 수(합계)
	var itemCnt = new Array();
	
	$(document).ready(function() {
		
		$('#orderDetail').modal({backdrop: 'static'});
		
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
		            idNo = ++cnt;
		            ++totalCount;
		          	//초기화 
					$('#color').val('');
					$('#size').val('');
					$('#size').attr('disabled', true);
					changePrice();
	            }
	          });	
			}
	    });
	    
	    
	    
	});
	
	function plusCnt(idNo){
		var changeCnt = $('#cnt_'+idNo).val();
		changeCnt++;
		totalCount++;
		$('#cnt_'+idNo).val(changeCnt);
	}
	
	function minusCnt(idNo){
		if($('#cnt_'+idNo).val() == 1){
		}else{
			var changeCnt = $('#cnt_'+idNo).val();
			changeCnt--;
			totalCount--;
			$('#cnt_'+idNo).val(changeCnt);
		}
	}
	
	function deleteOne(idNo){
		var num = $('#cnt_'+idNo).val();
		totalCount = totalCount - num;
		$(this).closest('li').remove();	
	}
	
	function changePrice(){
		var itemJSON = '${itemJSON}';
	    var result = $.parseJSON(itemJSON);
	    var totalPrice = 0;
	    
	    if(result.salePrice==0 || result.salePrice == null){
	    	totalPrice = result.price*totalCount;
	    }else{
	    	totalPrice = result.salePrice*totalCount;
	    }
	    $('#cntPrice').text(totalPrice);
	}

		
	function morePicture(){
		var pictures = document.getElementsByClassName('moreImg');
		for(var i=0; i<pictures.length; i++){
			var picture = pictures.item(i);
			picture.setAttribute('style','display: block;');
		}		
	}
	
	function cartFunc() {      
	      var listJSON = '${sessionScope.listJSON}';
	      var resultList = null;
	      
	      if(listJSON != '' && listJSON != null){
	         resultList = $.parseJSON(listJSON);
	      }
	      
	      var itemName = document.getElementById('itemName').value;
	      var sizeList = document.getElementsByClassName('size');
	      var colorList = document.getElementsByClassName('color');
	      	      
	      if (resultList == null || resultList == '') {   // 장바구니에 물품이 아예 없는 경우
	         var itemJSON = '${itemJSON}';
	         var result = $.parseJSON(itemJSON);
	         var itemForm = document.forms['itemContentsVO'];
	         	         
	         itemForm.action = "${ pageContext.request.contextPath }/shoppingCart/addItem/"+result.storeNo+"/"+result.num ;
	         itemForm.submit();
	         
	      }else{
	    	  var tf = 0;
	    	  $.each(resultList, function(index, item) {
	    		  	var size;
	    		  	var color;
	    		  	for(var i=0; i<size.length; i++){	
	    			  	size = sizeList[i].value;
	    			  	color = colorList[i].value;
	    			  	if (item.itemName == itemName && item.color == color && item.size == size) { // 장바구니에 선택한 물품이 이미 있는 경우
	    				  tf = 1;
	    			  	  break;
	    			  	}else{
	    				  tf = 0;
	    				}
		    		}
	      		});
	    	}
	    	  
	    	  var itemJSON = '${itemJSON}';
		      var result = $.parseJSON(itemJSON);
		      var itemForm = document.forms['itemContentsVO'];
	    	  	    	  
	    	  if(tf==1){
	    		  if (confirm('이미 장바구니에 물건이 있습니다. 장바구니로 이동하시겠습니까?')) { // 확인
	                  location.href = "${pageContext.request.contextPath}/mypage/shoppingCart";
	               } else { // 취소
	            	   history.go(0);
	               }
	    	  }else{
		            itemForm.action = "${ pageContext.request.contextPath }/shoppingCart/addItem/"+result.storeNo+"/"+result.num ;
		            itemForm.submit();
		       }
	   }
	   
	   function buyFunc(){
	      var itemJSON = '${itemJSON}';
	      alert(itemJSON);
	      var result = null;
	      if(itemJSON != '' && itemJSON != null){
	    	  result = $.parseJSON(itemJSON);
		  }
	      var itemForm = document.forms['itemContentsVO'];
	      itemForm.action = "${ pageContext.request.contextPath }/orderList/addOneItem/"+result.storeNo+"/"+result.num ;
	      itemForm.submit();
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
	
	<section>
		<!-- 메인 시작 -->
		<div class="app-pages">
			<div class="container">
				<div id="mainImg" style="height: 250px;">
					<c:forEach items="${ imgList }" var="list" varStatus="status">
						<c:if test="${status.count eq 1}">
							<img style="width: 180px; height: 250px;" src="/image/${list.imgSaveName}" alt="">
						</c:if>
					</c:forEach>
				</div>
				<div id="mainDescription">
					<h5>${ storeName }</h5>
					<h4><b>${ itemContentsVO.itemName }</b></h4>
					<h5>${ itemContentsVO.price } 원
						<c:if test="${ itemContentsVO.salePrice ne 0 }">
							<span style="color: red;">
								&nbsp;<i class="fa fa-long-arrow-right" style="color: #000;"></i>&nbsp;
								${ itemContentsVO.salePrice } 원
							</span>
						</c:if>
					</h5>
				</div>
			</div>
		</div>
		
		<!-- 공유 -->
		<div id="share">
			<a><i class="fa fa-share-alt"></i></a>
		</div>
		<!-- 메인 끝 -->
		
		<!-- 상세 시작 -->
		<div class="tabs-app app-section" id="mainProduct">
			<div class="container">
				<div class="row">
					<div class="col s12">
						<ul class="tabs">
							<li class="tab col s4"><a href="#tabs1">상세 정보</a></li>
							<li class="tab col s4"><a href="#tabs2">상품평</a></li>
							<li class="tab col s4"><a href="#tabs3">구매 안내</a></li>
						</ul>
						<!-- 상세 정보 시작 -->
						<div id="tabs1">
							<br />
							<div class="row">
								<c:forEach items="${ imgList }" var="list" varStatus="status">
									<c:if test="${status.count eq 2}">
										<img style="width: 180px; height: 250px;" src="/image/${list.imgSaveName}" alt="" width="93%"><br/>
									</c:if>
								</c:forEach>
								<c:forEach items="${ imgList }" var="list" varStatus="status" begin="3" end="4">
									<img class="moreImg" style="width: 180px; height: 250px;" src="/image/${list.imgSaveName}" alt="" width="93%" style="display: none;" ><br/>
								</c:forEach>
								<input type="button" id="imgDetail" class="button z-depth-1" onclick="morePicture()" value="이미지 더 보기" />
								<br/><br/>
								<hr style="border: 0.5px solid #b2b2b2; margin: 0px;"/>
								<br/>
								<p style="text-align: left; margin-left: 10px; margin-right: 10px;">
									${ itemContentsVO.detail }
									<c:if test="${ itemContentsVO.detail eq null }">
									죄송합니다 상품 상세 정보는 준비 중입니다
									</c:if>
								</p>
								<br/>
								<hr style="border: 0.5px solid #b2b2b2; margin: 0px;"/>
								<br/>
								<div id="newItem">
									<p style="text-align: left; margin-left: 10px; font-size: large;"><b>신상품</b></p>
									<c:forEach items="${ newItemList }" varStatus="status">
										<c:if test="${ status.index % 2 eq 0 }">
											<div class="row">
											<c:forEach items="${ newItemList }" var="newItemList" begin="${ status.index }" end="${ status.count + status.step }">
												<c:if test="${status.count <= 4}">
													<div class="col s6">
														<div class="entry">
															<a href="${ pageContext.request.contextPath}/store/item/${newItemList.num}">
																<img style="width: 180px; height: 250px; display: inline-block;" src="/image/${ newItemList.imgSaveName }" alt="">
															</a>
															<h6>
																<a href="${ pageContext.request.contextPath}/store/item/${newItemList.num}">${ newItemList.itemName }</a>
															</h6>
														</div>
													</div>
												</c:if>
											</c:forEach>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 상세 정보 끝 -->
						
						<!-- 상품평 시작 -->
						<div id="tabs2">
							<br />
						    <div class="row">
							  <!-- 상품평 입력 시작 -->
						      <div class="input-field col s12" id="cmtTab">
						      	<form action="" name="addCmt" id="addCmt">
									<textarea id="insertCmt" class="materialize-textarea" wrap="soft"></textarea>
							        <label for="comment">상품평을 입력해 주세요</label>
							        <input type="submit" class="button" id="sbmCmt" value="등록"/>
						      	</form>
						      </div>
							  <!-- 상품평 입력 끝 -->
							  <!-- 상품평 리스트 시작 -->
						      <div class="col s12">
						      	<ul id="cmtList">
						      		<li>
						      			<div>댓글 내용</div>
						      			<div>삭제 버튼</div>
						      			<div>float 클리어 부분</div>
						      		</li>
						      	</ul>
						      </div>
							  <!-- 상품평 리스트 끝 -->
						    </div>
						</div>
						<!-- 상품평 끝 -->
						
						<!-- 구매 안내 시작 -->
						<div id="tabs3">
							<br />
							<div class="row">
								구매 안내
							</div>
						</div>
						<!-- 구매 안내 끝 -->
					</div>
				</div>
			</div>
		</div>
		<!-- 상세 끝 -->
	</section>

	
	<!-- 하단 주문 버튼 -->
	<div class="w3-bottom">
		<!-- 주문하기 버튼 누르기 이전 -->
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center; background-color: #99d8c9">
			<a href="#orderDetail" style="width: 80%; padding-left: 20%; color: #fff;" class="w3-bar-item">주문하기</a>
			<a href="#" style="width: 20%; color: #fff;" class="w3-bar-item"><i class="fa fa-heart-o"></i></a>
		</div>
	</div>
	
	<!-- 주문하기 버튼 누르기 이후 -->
	<div id="orderDetail" class="modal bottom-sheet">
		<form id="itemContentsVO" name="itemContentsVO" method="post">
	   	<p style="padding-left: 5px;">옵션</p>
	   	<hr style="border: 0.5px solid #b2b2b2; margin: 0px;"/>
	   	<div class="modal-content">
			<div>
				<input name="itemName" id="itemName" type="hidden" value="${itemContentsVO.itemName}" />
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
	   </div>
	   <div>
			<ul id="sltItemList">
			</ul>
	   </div>
	   <p style="padding-right: 5px; text-align: right">총 금액 <span id="cntPrice" style="color: red;">00,000</span>원</p>
	   <div class="modal-footer" style="padding-top: 3%; text-align: center; background-color: #99d8c9;">
			<a style="width: 50%; color: #fff; padding-right: 8%;" class="w3-bar-item" id="shoppingCart" onclick="cartFunc()">장바구니 담기</a>
			<a style="width: 50%; color: #fff; padding-left: 8%;" class="w3-bar-item" id="orderList" onclick="buyFunc()">바로 주문하기</a>
	   </div>
	   </form>
	 </div>
	<!-- 하단 주문 버튼 끝-->

</body>
</html>