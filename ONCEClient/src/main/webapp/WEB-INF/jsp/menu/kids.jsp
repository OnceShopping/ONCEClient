<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
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

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

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

#tabs1, #tabs2, #tabs3, #tabs4 {
   text-align: center;
}


.row .col .s6 .entry img {
   width: 80% !important;
   margin-left: auto !important;
   margin-right: auto !important;
}

#mainProduct, #mainShops {
   margin-top: 50px;
}
.itemStyle{
	margin-bottom:0px;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
		<c:forEach var="kiditem" items="${ kidItemList }" varStatus="index">
			settingPrice($('#kidItem1_'+${index.count}), ${index.count});
		</c:forEach>
		<c:forEach var="kiditem" items="${ kidItemList2 }" varStatus="index">
			settingPrice($('#kidItem2_'+${index.count}), ${index.count});
		</c:forEach>
		<c:forEach var="kiditem" items="${ kidItemList3 }" varStatus="index">
			settingPrice($('#kidItem3_'+${index.count}), ${index.count});
		</c:forEach>
	});
	
	
	function settingPrice(obj, count){
		
		var val = obj.text();
		var price = comma(val);
		
		$(obj).html(price);
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

		function login(){
			alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
		}
</script>

</head>
<body>

<header>
		<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section>
	<div class="tabs-app app-pages app-section" id="mainProduct">
         <div class="container">
            <div class="pages-title">
               <h3 class="bold">아동 의류</h3>
               <img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
            </div>
            <div class="row">
               <div class="col s12">
                  <ul class="tabs">
                     <li class="tab col s3"><a href="#tabs1">전체</a></li>
                     <li class="tab col s3"><a href="#tabs2">상의</a></li>
                     <li class="tab col s3"><a href="#tabs3">하의</a></li>
                  </ul>
                  <div id="tabs1">
                     <br />
                     <div class="row">
                      <c:forEach var="kiditem" items="${ kidItemList }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${kiditem.num}">
                                 <img src="/image/${kiditem.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6 class="itemStyle">
                                 <a href="${pageContext.request.contextPath}/item/${kiditem.num}">
                                    <span style="color: #9E9E9E;" class="light">${ kiditem.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                              <c:choose>
                              		<c:when test="${ kiditem.salePrice ne 0}">
                              		<div style='text-align: center;'>
                              			<img src="${pageContext.request.contextPath}/resources/img/sale.gif" alt="" style="width:20% !important; margin-right: 0px !important; padding-bottom: 7px;">
		                                <span id="kidItem1_${index.count}" style="font-size: 15px; color: #3B1E1E; font-style: oblique;"  class="normal"><c:out value="${ kiditem.salePrice }"/></span>
		                                </div>
                              		</c:when>
                              		<c:otherwise>
                              			<span id="kidItem1_${index.count}" style="font-size: 15px; color: #3B1E1E; font-style: oblique;"  class="normal"><c:out value="${ kiditem.price }"/></span>
                              		</c:otherwise>
                              	</c:choose>
                              </div>
                           </div>
                        </div>
                        </c:forEach> 
                     </div>
                  </div>
                  <div id="tabs2">
                     <br />
                     <div class="row">
                     <c:forEach var="kiditem2" items="${ kidItemList2 }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${kiditem2.num}">
                                 <img src="/image/${kiditem2.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6 class="itemStyle">
                                 <a href="${pageContext.request.contextPath}/item/${kiditem2.num}">
                                    <span style="color: #9E9E9E;" class="light">${ kiditem2.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                                  <c:choose>
                              		<c:when test="${ kiditem2.salePrice ne 0}">
                              		<div style='text-align: center;'>
                              			<img src="${pageContext.request.contextPath}/resources/img/sale.gif" alt="" style="width:20% !important; margin-right: 0px !important; padding-bottom: 7px;">
		                                <span id="kidItem2_${index.count}" style="font-size: 15px; color: #3B1E1E; font-style: oblique;"  class="normal"><c:out value="${ kiditem2.salePrice }"/></span>
		                              </div>  
                              		</c:when>
                              		<c:otherwise>
                              			<span id="kidItem2_${index.count}" style="font-size: 15px; color: #3B1E1E; font-style: oblique;"  class="normal"><c:out value="${ kiditem2.price }"/></span>
                              		</c:otherwise>
                              	</c:choose>
                              </div>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="tabs3">
                     <br />
                     <div class="row">
                     <c:forEach var="kiditem3" items="${ kidItemList3 }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${kiditem3.num}">
                                  <img src="/image/${kiditem3.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6 class="itemStyle">
                                 <a href="${pageContext.request.contextPath}/item/${kiditem3.num}">
                                    <span style="color: #9E9E9E;" class="light">${ kiditem3.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                               <c:choose>
                              		<c:when test="${ kiditem3.salePrice ne 0}">
                              		<div style='text-align: center;'>
                              			<img src="${pageContext.request.contextPath}/resources/img/sale.gif" alt="" style="width:20% !important; margin-right: 0px !important; padding-bottom: 7px;">
		                                <span id="kidItem3_${index.count}" style="font-size: 15px; color: #3B1E1E; font-style: oblique;"  class="normal"><c:out value="${ kiditem3.salePrice }"/></span>
		                                </div>
                              		</c:when>
                              		<c:otherwise>
                              			<span id="kidItem3_${index.count}" style="font-size: 15px; color: #3B1E1E; font-style: oblique;"  class="normal"><c:out value="${ kiditem3.price }"/></span>
                              		</c:otherwise>
                              	</c:choose>
                              </div>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
	</section>
	
	<footer>
		<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	</footer>
		
	<!-- 하단 navbar -->
	<div class="w3-bottom" style="background-color: #d0c5ff;">
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<c:choose>
				<c:when test="${ !empty loginVO }">
					<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-star"></i></a>
				</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-star"></i></a>
			</c:otherwise>
			</c:choose>
			<a href="${pageContext.request.contextPath}/main" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<c:choose>
				<c:when test="${ !empty loginVO }">
					<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>				
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>