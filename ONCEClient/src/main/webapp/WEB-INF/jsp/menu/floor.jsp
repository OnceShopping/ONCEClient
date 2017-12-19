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
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}
</style>

<script>

	function addlikeStore(storeName){
		 $.ajax({   
			   type: "get"  
			  ,url: "${pageContext.request.contextPath}/likeStore"
			  ,data: { "storeName" : storeName}
			  ,contentType : "charset=UTF-8"
			  ,success:function(data){
				var msgList = $.parseJSON(data);
			    alert(msgList.msg);
			  }
			  ,error:function(data){
			    alert("로그인 후 이용해주세요.");
			    location.href="${pageContext.request.contextPath}/login/login"
			  }
			  });
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
	 <div class="team-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>층별 매장</h3>
			</div>
			<div class="row">
				<%-- <c:forEach var="" items=""> --%>
				<c:forEach var="store" items="${ storeList }">
					
				<div class="col s6">
					<div class="entry">
						<head>
							<a href="${pageContext.request.contextPath}/store/${store.storeName }"><img src="${pageContext.request.contextPath}/resources/img/logo1.jpg" alt=""></a>
						</head>
						
						<div class="content" >
							<h6 id="${store.storeName }" class="test">${store.storeName }</h6>
							<p>${store.storeCategory }</p>
							<ul>
								<ll><i class="fa fa-phone-square"></i>${store.phone }</ll>
							</ul>
							<input class="button" type="button" value="즐겨찾기 추가" onclick="addlikeStore('${store.storeName }')"></input>
						</div>
					</div>
				</div>
				</c:forEach>
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