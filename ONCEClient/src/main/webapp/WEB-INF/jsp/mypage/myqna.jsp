<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

.button {
    text-align: center;
    line-height: 50px;
    height: 60px;
    font-size: 12px;
}
</style>



</head>
<body>

<header>
		<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section>
	<div class="grid-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h2>1:1 문의</h2>
			</div>
			<h4>어떤 문의를 하고 싶으세요?</h4>
			<div class="row">
				<div class="col s4"><a href="${pageContext.request.contextPath}/mypage/writeForm/Dept"><div class="button">백화점</div></a></div>
				<div class="col s4"><a href="${pageContext.request.contextPath}/mypage/writeForm/Store"><div class="button">매장</div></a></div>
				<div class="col s4"><a href="${pageContext.request.contextPath}/mypage/writeForm/Info"><div class="button">주문/수령</div></a></div>
			</div>
		</div>
	</div>
	<div class="table-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>나의 Q&A</h3>
			</div>
			<table class="bordered">
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>작성일</th>
						<!-- <th>상태</th> -->
					</tr>
				</thead> 
				<tbody>
				  <c:forEach var="boardQA" items="${ qnaList }">
					<c:if test="${ boardQA.staffNo eq 0}">
					<tr>
						<td>${ boardQA.category1 }</td>
						<td><a href="${pageContext.request.contextPath}/qnaDetail/${boardQA.boardNo}">${ boardQA.title }</a></td>
						<td>${ boardQA.regDate }</td>
						<!-- <td id="status"></td> -->
					</tr>
				   </c:if>
			      </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</section>
	
	<footer>
		<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	</footer>
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>