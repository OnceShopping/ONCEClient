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


<script>
 $(document).ready(function() {
	
	 <c:forEach items="${ itemList }" varStatus="status">
		settingPrice($('#price_'+${status.count}), ${status.count});
	</c:forEach>
	 
	var item = '${itemList}';
	 
	$('.exitSearch').click(function() {
		$('#search').val("");
	});
	 
	if(item == '[]' || item == '') {
		$('#mainProduct').css('height', '400px');
	}
	
	$('.itemSelected').click(function() {
		location.href="${pageContext.request.contextPath}/item/search/"+$('#search').val();
	});
	
	
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
	<div class="navbar">
		<div class="container">
			<div id="input-field">
            		<input class="form-control" name="search" id="search" type="search" required style="position:relative; 
            		background: #ffffff; height: 30px;  box-shadow: none; border-bottom: none; width: 89%" placeholder="물품 검색">
					<input type="button" value="&#xf05c;" class="exitSearch" style="font-family: FontAwesome; position:relative; background: #ffffff; border: 0; box-shadow: none; 
               		outline: none; padding: 0px; width: 30px; height: 30px; right:37px; top:-1px">
               		<input type="button" value="&#xf002;" class="itemSelected" style="font-family: FontAwesome; position:relative; background: #cbbcff; border: 0; box-shadow: none; 
               		outline: none; padding: 0px; width: 30px; height: 30px; left:160px; top:-50px">
			</div>
		</div>
	</div>
	</header>
              
	<section>
	<div class="grid-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
			</div>
		</div>
	</div>
	<!-- 인기상품 리스트 -->
      <div class="tabs-app app-pages app-section" id="mainProduct" style="margin-top: 0px;">
         <div class="container">
            <div class="row">
               <div class="col s12">
               <div id="tabs1">
                     <br />
                     <div class="row">
                      <c:forEach var="item" items="${ itemList }" varStatus="index">
                        <div class="col s6">
                           <div class="entry">
                              <a href="${pageContext.request.contextPath}/item/${item.num}">
                                 <img src="/image/${item.imgSaveName}" alt="이미지 준비중입니다." style="width: 100%">
                              </a>
                              <h6>
                                 <a href="${pageContext.request.contextPath}/item/${item.num}">
                                    ${ item.itemName }
                                 </a>
                              </h6>
                              <div class="price">
                                 <h5><span id="price_${index.count }"><c:out value="${ item.price }"/></span> 원</h5>
                              </div>
                              <br/>
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
	<!-- footer 끝 -->

	<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->

</body>
</html>