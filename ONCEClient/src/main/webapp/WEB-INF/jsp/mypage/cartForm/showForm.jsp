<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
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
</script>
<div class="pages-title">
				<h3 class="bold">장 바 구 니</h3>
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
										<p style="font-weight: bold; font-size: 15px;">${itemContents.itemName}</p>
										<input type="hidden" name="orderDetails[${ status.index }].detailNo" value="${ itemContents.detailNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].itemName" value="${ itemContents.itemName }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeNo" value="${ itemContents.storeNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeName" value="${ itemContents.storeName }" />
										<input type="hidden" name="orderDetails[${ status.index }].imgSaveName" value="${ itemContents.imgSaveName }" />
										<input type="hidden" name="orderDetails[${ status.index }].price" value="${itemContents.price}"/>
										<input type="hidden" name="orderDetails[${ status.index }].salePrice" value="${itemContents.salePrice}"/>
									</div>
									<div class="col s1">
										<a href="" class="deleteStore_${ loop.index }" onclick="deleteOne(${ loop.index }, ${status.index})">
										<i class="fa fa-remove"></i></a><!-- 삭제버튼 -->
									</div>
									<div class="col s8" style="float: left;">
										<div id="oriPrice_${loop.index}_${status.index}" style="float: left; height: 18px;">
										<p style="float: left; margin-left: 10px; margin-top: 0px; font-size: 12px;">상품가격: &nbsp;&nbsp;</p>
											<p style="float: left;  margin-top: 0px; font-size: 12px;" id="price_${loop.index}_${status.index}">${itemContents.price * itemContents.count }</p><p style="float: left; margin-top: 0px; font-size: 12px;" >원</p>
										</div>
										<div id="salePrice_${loop.index}_${status.index}" style="float: left; height: 18px;">
										<c:choose>
										<c:when test="${ itemContents.salePrice eq 0 }" />
										<c:otherwise>
										<p style="float: left; margin-left: 10px;  margin-top: 0px; font-size: 12px;">할인가격: &nbsp;&nbsp;</p>
											<p style="color:red; float: left;  margin-top: 0px; font-size: 12px;" id="sale_${loop.index}_${status.index}" >${itemContents.salePrice * itemContents.count}</p><p style="float: left; margin-top: 0px; font-size: 12px;" >원</p>
										</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col s4" style="font-size: 12px;">
										<p class="options">Count</p>
									</div>
									<div class="col s8">
										<button class="button optButton" type="button" onclick="minusCnt(${loop.index}, ${status.index}), changeCnt(${loop.index}, ${status.index})">-</button>
										<input type="number" name="orderDetails[${status.index }].count" id="count_${loop.index}_${status.index}" class="count_${loop.index} " value="${itemContents.count}" style="position: 0px; font-size: 12px;" onchange="changeCnt(${loop.index}, ${status.index})"/>
										<button class="button optButton" type="button"  onclick="plusCnt(${loop.index}, ${status.index}), changeCnt(${loop.index}, ${status.index})">+</button>
									</div>
								</div>
								<div class="row">
									<div class="col s4" style="font-size: 12px;">
										<p class="options" style="margin-top: 10px;">옵션</p>
									</div>
									<div class="col s8"	>
										<p id="option_${loop.index}_${status.index}" style="float: left; margin-top: 10px; font-size: 12px;">${itemContents.color} / ${itemContents.size} &nbsp;&nbsp;&nbsp;</p>
										<input type="hidden" name="orderDetails[${ status.index  }].color" id="color_${loop.index}_${status.index}" value="${itemContents.color}" />
										<input type="hidden" name="orderDetails[${ status.index  }].size" id="size_${loop.index}_${status.index}" value="${itemContents.size}" />
										<button id="optionBtn" type="button" class="button optButton" onclick="showOption(${loop.index}, ${status.index})" style="margin-top: 7.2px;">옵션변경</button>
									</div>
									<div class="changeOption " id="changeOption_${loop.index}_${status.index}" style="display: table; margin-top: 15px; margin-bottom: 15px; margin-left: auto; margin-right: auto; text-align: center;">
										<div>
											<label style="float: left; width: 45px;">color</label> 
											<select id="colorSelect_${loop.index}_${status.index}" class="form-control browser-default" style="width: 180px;">
												<option value="" selected="selected" disabled="disabled">color를 선택해 주세요</option>
												<c:forEach var="color" items="${colorList}">
												<option value="${color}">${color}</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px;">
											<label style="float: left; width: 45px;">size</label> 
											<select id="sizeSelect_${loop.index}_${status.index}" class="form-control  browser-default" style="width: 180px;">
												<option value="" selected="selected" disabled="disabled">size를 선택해 주세요</option>
												<c:forEach var="size" items="${sizeList}">
												<option value="${size}">${size}</option>
												</c:forEach>
											</select>											
										</div>
										<div>
											<button id="option" type="button"  class="button optButton" onclick="changeConfirm(${loop.index}, ${status.index})">변경</button>
											<button id="option" type="button" class="button optButton" onclick="changeCancle(${loop.index}, ${status.index})">취소</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<hr style="margin-bottom: 5px; margin-top: 5px;"/>
					<div class="entry" id="cart-total_${ loop.index }" >
						<div class="row" style="margin-bottom: 0px;">
								<div class="col s8">
									<h6>상품 금액</h6>
								</div>
								<div class="col s4" >
									<h6 id="ori_total_${ loop.index }" style="margin-left: 5px;float: left;"></h6><h6 style="float: right;">원</h6>
								</div>
								<div class="col s8">
									<h6>할인 금액</h6>
								</div>
								<div class="col s4">
									<span style="float: left;">_&nbsp;</span><h6 style="float: left;"id="dis_total_${ loop.index }"></h6><h6 style="float: right;">원</h6>
								</div>
							</div>
							<div style="border-top: 1px solid #9E9E9E;">
							</div>
							<div class="row" style="margin-bottom: 0px;">
								<div class="col s8" style="float:left;">
									<h6>총 주문 금액</h6>
								</div>
								<div class="col s4" style="color: #673AB7;">
									<h6 id="cur_total_${ loop.index }" style="float:left; margin-left: 5px; font-weight: bold; font-size: 15px;" ></h6><h6 style="float: right;">원</h6>
								</div>
							</div>
					</div>
					<div id="entry" style="margin-top: 10px; width: 100%; margin-bottom: 30px;">
						<button type="button" class="button orderBtn" onclick="buySubmit(${ loop.index })" style=" width: 100%;">주 문 하 기</button>
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
			