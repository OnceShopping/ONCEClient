<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ONCE</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">

<link rel="shortcut icon" href="resources/img/favicon.png">

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/materialize.min.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/slick-theme.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/owl.theme.css">
<link rel="stylesheet" href="resources/css/owl.transitions.css">
<link rel="stylesheet" href="resources/css/lightbox.min.css">
<link rel="stylesheet" href="resources/css/style.css">
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

#tabs1, #tabs2, #tabs3, #tabs4 {
   text-align: center;
}


.row .col .s6 .entry img {
   width: 80% !important;
   margin-left: auto !important;
   margin-right: auto !important;
}

#mainProduct, #mainShops {
   margin-top: 0px;
}
h6{
	margin-bottom:0px;
}
</style>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/materialize.min.js"></script>
<script src="resources/js/slick.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/custom.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		<c:forEach var="item" items="${itemList}" varStatus="index">
			settingPrice($('#menItem_'+${index.count}), ${index.count});
		</c:forEach> 
		
		<c:forEach var="item" items="${itemList2}" varStatus="index">
			settingPrice($('#womenItem_'+${index.count}), ${index.count});
		</c:forEach> 
		
		<c:forEach var="item" items="${itemList3}" varStatus="index">
			settingPrice($('#kidItem_'+${index.count}), ${index.count});
		</c:forEach> 
		
		<c:forEach var="item" items="${itemList4}" varStatus="index">
		settingPrice($('#general_'+${index.count}), ${index.count});
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
	
</script>
</head>
<body>
   <header>
      <jsp:include page="WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
   </header>
   <section>
      <!-- 상단 슬라이더 -->
      <div class="slider-slick app-pages">
      <c:forEach var="notice" items="${ noticeList }">
         <div class="slider-entry">
            <img src="/image/${notice.imgSaveName}" alt="이미지 준비중입니다.">
            <div class="overlay"></div>
            <div class="caption">
               <div class="container">-
                  <h2 class="bold">${ notice.title }</h2>
                  <a href="${pageContext.request.contextPath}/noticeDetail/${ notice.noticeNo }"><button class="button">더 보기</button></a>
               </div>
            </div>
         </div> 
         </c:forEach>  
      </div>
      <!-- 상단 슬라이더 끝 -->
      <!-- 인기상품 리스트 -->
      <div class="tabs-app app-pages app-section" id="mainProduct">
         <div class="container">
            <div class="pages-title">
               <h3 class="bold">인기상품</h3>
               <img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
            </div>
            <div class="row">
               <div class="col s12">
                  <ul class="tabs">
                     <li class="tab col s3"><a href="#tabs1">남성</a></li>
                     <li class="tab col s3"><a href="#tabs2">여성</a></li>
                     <li class="tab col s3"><a href="#tabs3">아동</a></li>
                     <li class="tab col s3"><a href="#tabs4">잡화</a></li>
                  </ul>
                  <div id="tabs1">
                     <br />
                     <div class="row">
                      <c:forEach var="menitem" items="${ itemList }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${menitem.num}">
                                 <img src="/image/${menitem.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${menitem.num}">
                                   <span style="color: #9E9E9E;" class="light">${ menitem.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                                 <b><span id="menItem_${ index.count }" style="font-size: 15px;" class="normal"><c:out value="${ menitem.price }"/></span></b>
                              </div>
                              <br/>
                           </div>
                        </div>
                        </c:forEach> 
                     </div>
                  </div>
                  <div id="tabs2">
                     <br />
                     <div class="row">
                     <c:forEach var="womenitem" items="${ itemList2 }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${womenitem.num}">
                                 <img src="/image/${womenitem.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${womenitem.num}">
                                    <span style="color: #9E9E9E;" class="light">${ womenitem.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                                 <span id="womenItem_${index.count}" style="font-size: 15px;" class="normal"><c:out value="${ womenitem.price }"/></span>
                              </div>
                              <br/>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="tabs3">
                     <br />
                     <div class="row">
                     <c:forEach var="kiditem" items="${ itemList3 }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${kiditem.num}">
                                 <img src="/image/${kiditem.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${kiditem.num}">
                                    <span style="color: #9E9E9E;" class="light">${ kiditem.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                                  <span id="kidItem_${index.count}" style="font-size: 15px;" class="normal"><c:out value="${ kiditem.price }"/></span>
                              </div>
                              <br/>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="tabs4">
                     <br />
                     <div class="row">
                     <c:forEach var="general" items="${ itemList4 }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${general.num}">
                                 <img src="/image/${general.imgSaveName}" alt="이미지 준비중입니다." style="border-radius: 5px;">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${general.num}">
                                    <span style="color: #9E9E9E;" class="light">${ general.itemName }</span>
                                 </a>
                              </h6>
                              <div class="price">
                                <span id="general_${index.count}" style="font-size: 15px;" class="normal"><c:out value="${ general.price }"/></span>
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
      
      <!-- 인기매장 리스트 -->
      <div class="collapsible-app app-pages app-section" id="mainShops">
         <div class="container">
            <div class="pages-title">
               <h3 class="bold">인기매장</h3>
               <img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
               <p class="light" style="text-align: right;">판매량순</p>
            </div>
            <div class="entry">
            <c:forEach var="popStore" items="${ popStoreList }">
               <ul class="collapsible" data-collapsible="accordion">
                  <li>
                     <div class="collapsible-header acc-collapsible">
                        ${ popStore.storeName }  <img src="resources/img/up.gif" width="4%"  style="margin-bottom: 0.5%"><i class="fa fa-caret-down"></i>
                     </div>
                     <div class="collapsible-body">
                        <p>위치:${ popStore.floor } &nbsp;&nbsp;&nbsp;&nbsp; 매장 전화번호:${ popStore.phone }</p>
                     </div>
                  </li>
               </ul>
               </c:forEach>
            </div>
         </div>

      </div>
      <!-- 인기매장 리스트 끝 -->
   </section>
   
   <footer>
      <jsp:include page="WEB-INF/jsp/include/bottom.jsp"></jsp:include>
   </footer>
   <!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom" style="background-color: #d0c5ff;">
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="#" style="width: 20%; color: #fff;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>