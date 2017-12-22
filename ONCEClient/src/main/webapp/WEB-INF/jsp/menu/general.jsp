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

</style>


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
               <h3 class="bold">패션 잡화</h3>
            </div>
            <div class="row">
               <div class="col s12">
                  <ul class="tabs">
                     <li class="tab col s3"><a href="#tabs1">전체</a></li>
                     <li class="tab col s3"><a href="#tabs2">악세사리</a></li>
                     <li class="tab col s3"><a href="#tabs3">가방</a></li>
                  </ul>
                  <div id="tabs1">
                     <br />
                     <div class="row">
                      <c:forEach var="generalitem" items="${ generalItemList }">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${generalitem.num}">
                                 <img src="/image/${generalitem.imgSaveName}" alt="이미지 준비중입니다.">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${generalitem.num}">
                                    ${ generalitem.itemName }
                                 </a>
                              </h6>
                              <div class="price">
                                 <h5>${ generalitem.price }</h5>
                              </div>
                           </div>
                        </div>
                        </c:forEach> 
                     </div>
                  </div>
                  <div id="tabs2">
                     <br />
                     <div class="row">
                     <c:forEach var="generalitem2" items="${ generalItemList2 }">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${generalitem2.num}">
                                 <img src="/image/${generalitem2.imgSaveName}" alt="">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${generalitem2.num}">
                                    ${ generalitem2.itemName }
                                 </a>
                              </h6>
                              <div class="price">
                                 <h5>${ generalitem2.price }</h5>
                              </div>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
                  <div id="tabs3">
                     <br />
                     <div class="row">
                     <c:forEach var="generalitem3" items="${ generalItemList3 }">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${generalitem3.num}">
                                  <img src="/image/${generalitem3.imgSaveName}" alt="이미지 준비중입니다.">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${generalitem3.num}">
                                    ${ generalitem3.itemName }
                                 </a>
                              </h6>
                              <div class="price">
                                 <h5>${ generalitem3.price } </h5>
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
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->	
</body>
</html>