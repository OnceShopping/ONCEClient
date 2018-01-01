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
<link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

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
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}

input[type="button"], input[type="submit"] {
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
	
	<section style="padding-bottom: 40px;">
	 <div class="team-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold">${ floor }</h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
			</div>
			<div class="row">
				<%-- <c:forEach var="" items=""> --%>
				<c:forEach var="store" items="${ storeList }">
					
				<div class="col s6">
					<div class="entry">
						<div style="width: 157px; height: 157px; ">
							<a href="${pageContext.request.contextPath}/store/${store.storeName }">
							<img src="/image/${store.imgSaveName}" alt="" style="width: 100%; height: auto; position: relative;
            				top: 50%; left: 50%; transform: translate(-50%, -50%); -webkit-transform: translate(-50%, -50%);">
							</a>
						</div>
						<div class="content" >
							<h5 id="${store.storeName }" class="test bold">${store.storeName }</h5>
							<p style="color: #9e9e9e; font-size: 12px">${store.storeCategory }</p>
							<p style="font-size: 12px"><i class="fa fa-phone"></i>${store.phone }</p>
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