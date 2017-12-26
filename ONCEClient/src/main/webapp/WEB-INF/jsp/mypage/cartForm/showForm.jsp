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
			settingOriTotalPrice($('#ori_total_'+${loop.index}).text(), ${loop.index});
			settingDisTotalPrice($('#dis_total_'+${loop.index}).text(), ${loop.index});
			settingCurTotalPrice($('#cur_total_'+${loop.index}).text(), ${loop.index});
		</c:forEach>
		
	});
	
</script>
<div class="pages-title">
				<h3>Shopping Cart</h3>
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
										<div class="col s8" >
											<div id="oriPrice_${loop.index}_${status.index}">
											<p style="float: left; margin-left: 10px;">정상가:</p>
												<p style="float: left;" id="price_${loop.index}_${status.index}" >${itemContents.price * itemContents.count }</p>
											</div>
											<br/>
											<div id="salePrice_${loop.index}_${status.index}">
											<c:choose>
												<c:when test="${ itemContents.salePrice eq 0 }" />
												<c:otherwise>
													<p style="float: left;  margin-left: 10px; ">할인가:</p>
													<p style="color:red; float: left;" id="sale_${loop.index}_${status.index}" >${itemContents.salePrice * itemContents.count}</p>
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
							<button type="button" class="button" onclick="buySubmit(${ loop.index })" style="background-color:#ffc305;margin-bottom: 10px; font-size: 12px;">주 문 하 기</button>
						</div>
					</div>
					</form>
					</c:forEach>
				</c:when>
				
				<c:otherwise><!-- productList에 아무것도 없을 때  -->
					<h6>장바구니에 등록된 상품이 없습니다.</h6>
				</c:otherwise>
			</c:choose>
		</div>