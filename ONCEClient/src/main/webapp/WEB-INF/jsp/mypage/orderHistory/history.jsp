<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		if($('#customer').val()==""){
			alert('로그인 후 이용이 가능합니다. 로그인 페이지로 이동합니다.');
			location.href="${pageContext.request.contextPath}/login/loginForm";
		}else{
			
			$('#setTime').hide();	
			var date = today();
			var key;
			var memNo = $('#memNo').val();
			var startDate;
			var endDate;
			
			$('.times').click(function(){
				$('#result').html('');
					
				if(this==$('.times')[2])
					$('#setTime').toggle();
				else{
					$('#setTime').hide();
					key = (this==$('.times')[0]) ? 3 : 6;    
				}
				
				$('.times').removeClass("active");
				$(this).addClass("active");
				
				if(this!=$('.times')[2]){
					
					$.ajax({
						url : "${pageContext.request.contextPath}/orderList/months",
						type:"get",
						data : {
							"key" : key,
							"memNo" : memNo
						},
						dataType:"json",
						cache:false,
						contentType:"application/json; charset=UTF-8",
						success:function(data){		
							var showData = printResult(data);
							$('#result').html(showData);
						}, error : function(request, status, error){
							alert("에러 발생! : " + request.status + "message : "+ request.responseText+ "\n"+ "error : "+ error);
						}			
					});
				}else{
					$('#startDate').val('');
					$('#endDate').val('');
				}
			});
			
			$( ".datepicker" ).datepicker({
				dateFormat:'yy-mm-dd',
				showOtherMonths: true,
		      	selectOtherMonths: true
			});
	
			$('#setDate').click(function(){
				startDate = $('#startDate').val();
				endDate = $('#endDate').val();
				
				if(startDate==""){
					alert("날짜를 선택해주세요.");
					$('#startDate').focus();
				}else if(endDate==""){
					alert("날짜를 선택해주세요.");
					$('#endDate').focus()
				}else{
					var startArray = startDate.split(".");
					var endArray = endDate.split(".");
					
					var start_date=new Date(startArray[0], startArray[1], startArray[2]);
					var end_date=new Date(endArray[0], endArray[1], endArray[2]);
					
					if(start_date.getTime() > end_date.getTime()){
						alert('종료 날짜보다 시작 날짜가 작아야합니다.');
						return false;
					}
					
				
					$.ajax({
						url : "${pageContext.request.contextPath}/orderList/setTimes",
						data : {
							"memNo" : memNo,
							"startDate" : startDate,
							"endDate" : endDate
						},
						dataType:"json",
						type:"get",
						cache:false,
						contentType:"application/json; charset=UTF-8",
						success:function(data){			
							var showData = printResult(data);
							$('#result').html(showData);
						}, error : function(request, status, error){
							alert("에러 발생! : " + request.status + "message : "+ request.responseText+ "\n"+ "error : "+ error);
						}
							
					});
					
				}
			});
		}
		
		$('#3months').trigger('click');
	});
	
	function today(){
		 
		var date = new Date();
		 
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		
		if(("" + month).lenth ==1)
			month = "0" +month;
		if((""+day).length==1)
			day = "0" + day;
		
		var day = "" + year+"-"+month+"-"+day;
		return day;
	}
	
	function printResult(data) {
		var distinct;
		var row="";

		$.each(data,function(index,item){
			
			if(index!=0){
				if(item.date!=distinct)
					row += "<div class='dateStyle'>"+item.date+"</div>";			
			}else
				row += "<div  class='dateStyle'>주문일자: "+item.date+"</div>";
			
			row += "<div onclick='move("+item.orderNo+")' class='orderTable'>";
			row += "<table id='order_"+item.orderNo+"'>";
			row += "<tr class='title'><td colspan='2' style='font-size:12px;'>주문번호 <span style='font-size:13px; font-weight:bold;'>" + item.orderNo + "</span></td></tr>";
			row += "<tr><td rowspan='3' style='width: 50%;'><img src='/image/"+ item.imgSaveName+"' width='120px' height='120px' alt='이미지 준비중입니다.' style='margin-left: auto; margin-right: auto; display: block;'></td>"
			if(item.count!=1){ 
				row += "<td style='padding-left:0px; width: 50%;'><p><span style='font-size:14px; font-weight:bold;'>"+ item.storeName +"</span></br/><span style='font-size:12px;'>"+ (item.orderDetails[0].itemName) + " 외 " + (item.count -1) + "</p></td></tr>";
			}else{
				row += "<td style='padding-left:0px; width: 50%;'><p><span style='font-size:14px; font-weight:bold; padding-left:0px;'>"+ item.storeName +"</span></br/><span style='font-size:12px;'>"+ (item.orderDetails[0].itemName) + "</p></td></tr>";
			}
			
			row += "<tr><td style='font-size:12px; padding:0px;'>주문금액 : " + settingPrice(item.totalPrice) + " 원</td></tr>";
			row += "<tr><td style='font-size:12px; padding:0px; padding-bottom:3px;'>진행상태 : " + item.status + "</td></tr>";
			
			distinct = item.date;
			
			row += "</table></div>";
		});
		return row;
	}

	function move(orderNo){
		location.href="${pageContext.request.contextPath}/orderList/"+orderNo;
	}

	function settingPrice(obj){
		
		return comma(obj);
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
<style type="text/css">

	table, tr, td{
		padding: 5px;
	}
	.selectTimes{
		border: 1px solid  #E2E2E3 !important;
		
	}
	.times{
		text-align: center;
		border: 1px solid  #E2E2E3 !important;
	}
	.active{
		box-shadow: 0 0 10px #A084FF inset;
		
	}
	.datepicker{
		text-align: center;
		margin: 0px;
		font-size: 10px;
	}
	.dateStyle{
		margin-top :20px;
		padding:5px; 
		background-color:#BEFCEC; 
		font-size:12px; 
		border-radius:3px;
	}
	.orderTable{
		border: 1px solid #EBEBEB;
		border-radius: 5px !important;
		margin-top:5px; 
		margin-left:auto;
		margin-right:auto;
		width: 95%;
	}
	.title{
		border:1px solid #EBEBEB; 
		background-color:#EEE9FE;
	}
</style>
</head>
<body>
<header>
		<!-- 상단 navbar -->
		<div class="navbar">
		<div class="container">
			<div class="panel-control-left">
				<a href="#" data-activates="slide-out-left"
					class="sidenav-control-left"><i class="fa fa-bars"></i></a>
			</div>
			<div class="site-title">
				<a href="${pageContext.request.contextPath}" class="logo"><h1>ONCE</h1></a>
			</div>
			<div class="panel-control-right">
				<a href="contact.html"><i class="fa fa-shopping-cart"></i></a>
			</div>
		</div>
	</div>
	<!-- 상단 navbar 끝 -->

	<!-- 좌측 메뉴패널 -->
	<div class="panel-control-right">
		<ul id="slide-out-left" class="side-nav collapsible"
			data-collapsible="accordion">
			<li>
				<div class="photos">
					<h3>cus1</h3>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-map-signs"></i>층별 매장 보기<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${pageContext.request.contextPath}/menu/1F">1F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/2F">2F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/3F">3F</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-th"></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li class="tileList">
							<table>
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/men" class="tileMenu"><i class="fa fa-male"></i><br/>남성
											의류</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/women" class="tileMenu"><i class="fa fa-female"></i><br/>여성 의류</a></td>
								</tr>
							</table>
						</li>
						<li>
							<div class="menuSpace"></div>
						</li>
						<li class="tileList">
							<table class="tileMenu">
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/kids" class="tileMenu"><i class="fa fa-child"></i><br/>유·아동복</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/general" class="tileMenu"><i class="fa fa-briefcase"></i><br/>패션 잡화</a></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="${pageContext.request.contextPath}/login/login"><i class="fa fa-sign-in"></i>로그인</a></li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
			</li>
		</ul>
	</div>
		<!-- 좌측 메뉴패널 끝 -->
	</header>
	
	<section>
	<div class="grid-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold">구매 내역</h3>
			</div>
			<div>
				<table class="selectTimes">
					<tr style="height: 10px;">
						<td class="times" id="3months">3개월</td>
						<td class="times" id="6months">6개월</td>
						<td class="times" id="months">기간 설정</td>
					</tr>
				</table>
				<table>	
					<tr id="setTime" style="display: none;">
						<td width="40%">
							<input type="text" class="datepicker" name="startDate" id="startDate">
						</td>
						<td width="5%">~</td>
						<td width="40%">
							<input type="text" class="datepicker" name="endDate" id="endDate">
						</td>
						<td width="15%">
							<input type="button" id="setDate" value="조회">
						</td>
					</tr>
				</table>
				<div id="result" style="margin-top:20px;">
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${customer.id}" id="customer">
	<input type="hidden" value="${customer.memNo}" id="memNo">
	</section>
	
	
	<!-- footer -->
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
	<!-- footer 끝 -->

		
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
					<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #fff;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>				
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #fff;" class="w3-bar-item" onclick="login()"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>