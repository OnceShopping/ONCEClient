<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
		
		input[type="button"], input[type="submit"], button {
			font-size: inherit;
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
		
		button:hover {
			background-color: #fff;
		}
		
		[type="checkbox"]+label:before, [type="checkbox"]:not(.filled-in)+label:after{
      		border: 2px solid #9E9E9E;
        }
      
      	[type="checkbox"]:checked+label::before {
	 	   border-right: 2px solid #d1b2ff;
	 	   border-bottom: 2px solid #d1b2ff;
		}
 	</style>
 	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function () {
		$('#checkbox').click(function() {
			if($('#checkbox').prop('checked')) {
				$("#checkbox1").prop("checked", true);
			    $("#checkbox2").prop("checked", true); 
			} else {
				$("#checkbox1").prop("checked", false);
		        $("#checkbox2").prop("checked", false);		
			}
		});
		
		$("#nextBtn").click(function(){    
            if(($("#checkbox1").is(":checked") == false)||($("#checkbox2").is(":checked") == false) ){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                return;
            }else {
            	location.href = '${pageContext.request.contextPath}/signup/signupMain';
            }
        });     
		 
	});	
	
	function login(){
		alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
	}
	</script>
	
</head>

<body>
	<header>
		<!-- navbar -->
		<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
		<!-- end navbar -->
	</header>
	
	<section>
		<div class="table-app app-pages app-section">
			<div class="container">
				<div class="pages-title">
					<h3 class="bold">회원가입</h3>
					<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%"> 
				</div>
				<div align="center"><h5 class="normal">약관동의</h5></div>
				<br/>
				<div>
				<input type="checkbox" id="checkbox" /> <label for="checkbox">전체동의</label><br>
				<input type="checkbox" id="checkbox1" /> <label for="checkbox1">이용약관 동의 (필수)</label>
				<br>
				<div style="overflow: scroll; overflow-X: hidden; width: 100%; height: 230px; border: 0.5px solid black; padding: 20px; background: #e5fffd; font-size: 10pt;">
					<h6>제1조(목적)</h6>
					<br/>
					이 약관은 ONCE가 운영하는 홈페이지(이하 "쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 ONCE와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 
					※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br/>
					<br/>
					
					<h6>제2조(정의)</h6>
					<br/>
					① "쇼핑몰"이란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.<br/> 
					② "이용자"란 "쇼핑몰"에 접속하여 이 약관에 따라 "쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br/> 
					③ "회원"이라 함은 "쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "쇼핑몰"의 정보를 지속적으로 제공받으며, "쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br/>
					④ "비회원"이라 함은 회원에 가입하지 않고 "쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다.<br/> 
					<br/>
					
					<h6>제3조 (약관의 명시와 개정)</h6>
					<br/>
					① "쇼핑몰"은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면(전면)에 게시합니다.<br/> 
					② "쇼핑몰"은 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 방문판매 등에 관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/> 
					③ "쇼핑몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.<br/> 
					④ "쇼핑몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "쇼핑몰"에 송신하여 "쇼핑몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br/> 
					⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.<br/> 
					<br/>
					
					<h6>제4조(서비스의 제공 및 변경)</h6>
					<br/>
					① "쇼핑몰"은 다음과 같은 업무를 수행합니다.<br/>
					&nbsp;&nbsp;1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br/>
					&nbsp;&nbsp;2. 구매계약이 체결된 재화 또는 용역의 배송<br/>
					&nbsp;&nbsp;3. 기타 "쇼핑몰"이 정하는 업무<br/>
					② "쇼핑몰"은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.<br/> 
					③ "쇼핑몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 "쇼핑몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 단, "쇼핑몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.<br/> 
					<br/>
					
					<h6>제5조(서비스의 중단)</h6>
					<br/>
					① "쇼핑몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br/> 
					② 제1항에 의한 서비스 중단의 경우에는 "쇼핑몰"은 제8조에 정한 방법으로 이용자에게 통지합니다.<br/> 
					③ "쇼핑몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "쇼핑몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.<br/> 
					<br/>
					
					<h6>제6조(회원가입)</h6>
					<br/>
					① 이용자는 "쇼핑몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br/> 
					② "쇼핑몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br/> 
					&nbsp;&nbsp;1. 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "쇼핑몰"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br/> 
					&nbsp;&nbsp;2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 <br/>
					&nbsp;&nbsp;3. 기타 회원으로 등록하는 것이 "쇼핑몰"의 기술상 현저히 지장이 있다고 판단되는 경우<br/>
					③ 회원가입계약의 성립 시기는 "쇼핑몰"의 승낙이 회원에게 도달한 시점으로 합니다.<br/> 
					④ 회원은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "쇼핑몰"에 대하여 그 변경사항을 알려야 합니다.<br/> 
					<br/>
					
					<h6>제7조(회원 탈퇴 및 자격 상실 등)</h6>
					<br/> 
					① 회원은 "쇼핑몰"에 언제든지 탈퇴를 요청할 수 있으며 "쇼핑몰"은 즉시 회원탈퇴를 처리합니다.<br/> 
					② 회원이 다음 각 호의 사유에 해당하는 경우, "쇼핑몰"은 회원자격을 제한 및 정지시킬 수 있습니다.<br/> 
					&nbsp;&nbsp;1. 가입 신청 시에 허위 내용을 등록한 경우 <br/> 
					&nbsp;&nbsp;2. "쇼핑몰"을 이용하여 구입한 재화·용역 등의 대금, 기타 "쇼핑몰" 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br/> 
					&nbsp;&nbsp;3. 다른 사람의 "쇼핑몰" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br/> 
					&nbsp;&nbsp;4. "쇼핑몰"을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 <br/>
					③ "쇼핑몰"이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "쇼핑몰"은 회원자격을 상실시킬 수 있습니다.<br/> 
					④ "쇼핑몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.<br/>
					<br/>
					
					<h6>제8조(회원에 대한 통지)</h6>
					<br/>
					① "쇼핑몰"이 회원에 대한 통지를 하는 경우, 회원이 "쇼핑몰"에 제출한 전자우편 주소로 할 수 있습니다.<br/>  
					② "쇼핑몰"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "쇼핑몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.<br/>  
					
					<h6>제9조(구매신청)</h6>
					<br/>
					"쇼핑몰" 이용자는 "쇼핑몰"상에서 이하의 방법에 의하여 구매를 신청합니다.<br/> 
					&nbsp;&nbsp;1. 성명, 비밀번호, 전화번호, 핸드폰번호, 주소, E-MAIL 입력<br/>
					&nbsp;&nbsp;2. 재화 또는 용역의 선택<br/>
					&nbsp;&nbsp;3. 결제방법의 선택<br/>
					&nbsp;&nbsp;4. 이 약관에 동의한다는 표시(예, 마우스 클릭)<br/> 
					<br/>
					
					<h6>제10조 (계약의 성립)</h6>
					<br/> 
					① "쇼핑몰"은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.<br/> 
					&nbsp;&nbsp;1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br/> 
					&nbsp;&nbsp;2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br/> 
					&nbsp;&nbsp;3. 기타 구매신청에 승낙하는 것이 "쇼핑몰" 기술상 현저히 지장이 있다고 판단하는 경우<br/>
					② "쇼핑몰"의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br/> 
					<br/>
					
					<h6>제11조(지급방법)</h6>
					<br/>
					"쇼핑몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.<br/> 
					&nbsp;&nbsp;1. 계좌이체<br/> 
					&nbsp;&nbsp;2. 신용카드결제<br/> 
					&nbsp;&nbsp;3. 온라인무통장입금<br/> 
					&nbsp;&nbsp;4. 전자화폐에 의한 결제<br/> 
					&nbsp;&nbsp;5. 수령 시 대금지급 등<br/> 
					<br/>
					
					<h6>제12조(수신확인통지·구매신청 변경 및 취소)</h6>
					<br/>
					① "쇼핑몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br/> 
					② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.<br/> 
					③ "쇼핑몰"은 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.<br/> 
					<br/>
					
					<h6>제13조(배송)</h6>
					<br/>
					"쇼핑몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "쇼핑몰"의 고의·과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상합니다.<br/> 
					<br/>
					
					<h6>제14조(환급, 반품 및 교환)</h6>
					<br/>
					① "쇼핑몰"은 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 3일 이내에 계약해제 및 환급절차를 취합니다.<br/> 
					② 다음 각 호의 경우에는 "쇼핑몰"은 배송된 재화일지라도 재화를 반품 받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 합니다.<br/> 
					&nbsp;&nbsp;1. 배송된 재화가 주문내용과 상이하거나 "쇼핑몰"이 제공한 정보와 상이할 경우<br/> 
					&nbsp;&nbsp;2. 배송된 재화가 파손, 손상되었거나 오염되었을 경우<br/> 
					&nbsp;&nbsp;3. 방문판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우<br/> 
					<br/>
					
					<h6>제15조(개인정보보호)</h6>
					<br/>
					① "쇼핑몰"은 이용자의 정보 수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다.  
					다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.<br/> 
					&nbsp;&nbsp;1. 희망ID<br/> 
					&nbsp;&nbsp;2. 비밀번호<br/> 
					&nbsp;&nbsp;3. 이름<br/>
					&nbsp;&nbsp;4. E-MAIL<br/>
					&nbsp;&nbsp;5. 전화번호<br/>
					② "쇼핑몰"이 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.<br/> 
					③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "쇼핑몰"이 집니다. 다만, 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우에는 예외로 합니다.<br/> 
					④ "쇼핑몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공 받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진 등에 관한 법률 제16조 제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br/> 
					⑤ 이용자는 언제든지 "쇼핑몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "쇼핑몰"은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "쇼핑몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br/> 
					⑥ "쇼핑몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br/> 
					⑦ "쇼핑몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br/> 
					<br/>
					
					<h6>제16조("쇼핑몰"의 의무)</h6>
					<br/>
					① "쇼핑몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.<br/> 
					② "쇼핑몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br/>
					③ "쇼핑몰"이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br/>
					④ "쇼핑몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br/>
					<br/>
					
					<h6>제17조(회원의 ID 및 비밀번호에 대한 의무)</h6>
					<br/> 
					① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br/> 
					② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.<br/> 
					③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "쇼핑몰"에 통보하고 "쇼핑몰"의 안내가 있는 경우에는 그에 따라야 합니다.<br/> 
					<br/>
					
					<h6>제18조(이용자의 의무)</h6>
					<br/>
					이용자는 다음 행위를 하여서는 안 됩니다.<br/> 
					&nbsp;&nbsp;1. 신청 또는 변경 시 허위내용의 등록<br/> 
					&nbsp;&nbsp;2. "쇼핑몰"에 게시된 정보의 변경 <br/>
					&nbsp;&nbsp;3. "쇼핑몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시<br/> 
					&nbsp;&nbsp;4. "쇼핑몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해<br/>
					&nbsp;&nbsp;5. "쇼핑몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 <br/>
					&nbsp;&nbsp;6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 홈페이지에 공개 또는 게시하는 행위<br/> 
					<br/>
					
					<h6>제19조(연결"쇼핑몰"과 피연결"쇼핑몰" 간의 관계)</h6>
					<br/>
					① 상위 "쇼핑몰"과 하위 "쇼핑몰"이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "쇼핑몰"(웹 사이트)이라고 하고 후자를 피연결 "쇼핑몰"(웹사이트)이라고 합니다.<br/> 
					② 연결 "쇼핑몰"은 피연결 "쇼핑몰"이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 "쇼핑몰"의 사이트에서 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.<br/> 
					<br/>
					
					<h6>제20조(저작권의 귀속 및 이용제한)</h6>
					<br/>
					① "쇼핑몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "쇼핑몰"에 귀속합니다.<br/> 
					② 이용자는 "쇼핑몰"을 이용함으로써 얻은 정보를 "쇼핑몰"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.<br/> 
					<br/>
					
					<h6>제21조(분쟁해결)</h6>
					<br/>
					① "쇼핑몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.<br/> 
					② "쇼핑몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br/> 
					③ "쇼핑몰"과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.<br/> 
					<br/>
					
					<h6>제22조(재판권 및 준거법)</h6>
					<br/>
					① "쇼핑몰"과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.<br/> 
					② "쇼핑몰"과 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.
				</div>
				<br/>
				<input type="checkbox" id="checkbox2" /> <label for="checkbox2">개인정보 처리방침 동의 (필수)</label>
				<br>
				<div style="overflow: scroll; overflow-X: hidden; width: 100%; height: 230px; border: 0.5px solid black;padding: 20px; background: #e5fffd; font-size: 10pt;">
					개인정보보호표준포럼(이하 ‘포럼’이라 함)는 정보주체의 개인정보를 중시하며,「정보통신망 이용촉진 및 정보보호에 관한 법률」및「개인정보보호법」을 준수합니다.
					포럼은 개인정보 처리방침을 통해 포럼이 정보주체로부터 제공받은 개인정보를 어떠한 용도와 방식으로 이용하고 있으며, 개인정보를 위해 어떠한 조치를 취하고 있는지 알려드립니다.
					개인정보 처리방침 개정 시에는 웹사이트를 통하여 공시하겠습니다.<br/>
					<br/>
					<h6>1. 개인정보의 처리 목적</h6>
					<br/>
					포럼은 수집한 개인정보를 다음의 목적을 위해 활용합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용하지 않으며 이용 목적이 변경될 경우에는 사전 동의를 받아 처리할 것입니다.<br/>
					&nbsp;&nbsp;1) 회원 관리<br/>
					&nbsp;&nbsp;회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달<br/>
					&nbsp;&nbsp;2) 마케팅 및 광고에 활용<br/>
					&nbsp;&nbsp;신규 서비스 개발과 이벤트 행사에 따른 정보 전달 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br/>
					&nbsp;&nbsp;3) 고객지원<br/>
					&nbsp;&nbsp;각종 문의에 대한 지원<br/>
					<br/>
					
					<h6>2. 개인정보의 처리 및 보유 기간</h6>
					<br/>
					포럼에서 처리하는 개인정보는 수집·이용 목적으로 명시한 범위 내에서 처리·보유합니다.
					포럼은 개인정보보호법 및 관련 법령에서 정하는 보유기간을 준수하며 정보주체의 삭제요구와 가입탈퇴 신청이 있을 경우 지체 없이 파기합니다.
					단, 상법 등 관련법령의 규정에 의하여 보존할 필요가 있는 경우 포럼은 아래와 같이 관계법령에서 정한 일정기간 동안 보유합니다.<br/>
					&nbsp;&nbsp;− 계약 또는 청약 철회, 대금결제, 재화 등의 공금 기록 (전자상거래 등에서의 소비자보호에 관한 법률): 5년<br/>
					&nbsp;&nbsp;− 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래 등에서의 소비자보호에 관한 법률): 3년<br/>
					&nbsp;&nbsp;− 표시·광고에 관한 기록 (전자상거래 등에서의 소비자보호에 관한 법률): 6개월<br/>
					&nbsp;&nbsp;− 정보주체의 인터넷 등 로그기록자료 (통신비밀보호법에 관한 법률): 3개월<br/>
					&nbsp;&nbsp;− 컴퓨터 통신, 인터넷 로그기록자료, 접속지 추적자료(통신비밀보호법에 관한 법률): 3개월<br/>
					<br/>
					
					<h6>3. 개인정보의 제3자 제공에 관한 사항</h6>
					<br/>
					포럼은 수집·보유하고 있는 개인정보를 원칙적으로 외부에 제공하지 않으며, 다음의 경우에는 개인정보를 제3자에게 제공할 수 있습니다.<br/>
					&nbsp;&nbsp;1) 정보주체로부터 별도의 동의를 받은 경우<br/>
					&nbsp;&nbsp;2) 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br/>
					&nbsp;&nbsp;3) 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보 주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우<br/>
					<br/>
					
					<h6>4. 개인정보의 권리·의무 및 그 행사방법에 관한 사항</h6>
					<br/>
					이용자는 정보주체로서 개인정보 관련하여, 언제든지 개인정보 열람, 정정, 삭제, 처리정지 등의 권리를 행사할 수 있습니다.
					단, 다음에 해당하는 경우 포럼은 개인정보의 열람, 정정, 삭제, 처리정지를 거절할 수 있습니다.<br/>
					&nbsp;&nbsp;− 법률에 따라 열람이 금지되거나 제한되는 경우<br/>
					&nbsp;&nbsp;− 다른 사람의 생명·신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우<br/>
					이용자의 개인정보 열람·정정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 통하여 본인 확인 절차를 거치신 후 탈퇴할 수 있습니다. 혹은 개인정보보호담당자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.
					회원 탈퇴 시, 직접 작성하신 게시물은 자동적으로 삭제되지 않으니, 게시물 등의 삭제를 원하시는 경우 반드시 직접 삭제를 하신 후 회원탈퇴를 해주시기 바랍니다.
					이용자가 개인정보 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제 3자에게 제공하지 않겠습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하겠습니다.<br/>
					<br/>
					
					<h6>5. 처리하는 개인정보의 항목</h6>
					<br/>
					&nbsp;&nbsp;1) 수집하는 개인정보의 항목<br/>
					&nbsp;&nbsp;포럼은 이용자의 동의에 의해 다음의 개인정보 항목을 처리하고 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;(1) 홈페이지 회원 가입 및 관리<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;− 필수항목: 이름, 로그인ID, 비밀번호, 회사명, 부서, 직위, 직업, 전화, 휴대폰 번호, 이메일 주소<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;− 선택항목: 주소, 팩스번호<br/>
					&nbsp;&nbsp;또한, 서비스 이용과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br/>
					&nbsp;&nbsp;− IP주소, OS/브라우저 종류, 방문 일시, 서비스 이용기록, 접속로그, 쿠키<br/>
					&nbsp;&nbsp;※ 포럼은 인종, 종교, 사상, 신조, 정치적 성향 및 범죄기록 등 이용자의 인권을 침해할 우려가 있는 개인정보는 수집하지 않습니다.<br/>
					&nbsp;&nbsp;2) 개인정보 수집 방법<br/>
					&nbsp;&nbsp;포럼은 아래의 방법으로 개인정보를 수집하며 ‘동의’ 또는 ‘거부’ 버튼을 클릭하는 절차를 통하여 개인정보 수집에 대한 동의를 받고 있습니다.<br/>
					&nbsp;&nbsp;− 홈페이지 회원가입, 회원정보수정, 세미나 또는 워크샵 온라인 신청, 이메일, 이벤트 응모, 서면양식, 전화, 팩스<br/>
					<br/>
					
					<h6>6. 개인정보의 파기에 관한 사항</h6>
					<br/>
					포럼은 원칙적으로 개인정보의 보유기간이 경과했거나 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다 파기의 절차, 기한 및 방법은 다음과 같습니다.<br/>
					&nbsp;&nbsp;1) 파기절차<br/>
					&nbsp;&nbsp;이용자가 입력한 정보는 보유기간이 경과했거나 처리목적이 달성된 후 내부 방침 및 관련 법령에 따라 파기합니다.<br/>
					&nbsp;&nbsp;2) 파기방법<br/>
					&nbsp;&nbsp;− 전자적 파일 형태인 경우 : 복원이 불가능한 방법으로 영구 삭제<br/>
					&nbsp;&nbsp;− 전자적 파일의 형태 외의 기록물, 인쇄물, 서면, 그 밖의 기록매체인 경우 : 파쇄 또는 소각<br/>
					<br/>
					
					<h6>7. 만14세 미만 아동의 개인정보 보호</h6>
					<br/>
					포럼은 회원사의 담당자, 연구원을 대상으로 하기 때문에 원칙적으로 만14세 미만 아동의 회원가입을 통한 개인정보 수집 및 이용을 하지 않습니다.<br/>
					<br/>
					
					<h6>8. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</h6>
					<br/>
					포럼은 이용자의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)' 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.<br/>
					&nbsp;&nbsp;1) 쿠키 등 사용 목적<br/>
					&nbsp;&nbsp;- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석<br/>
					&nbsp;&nbsp;- 이용자의 취향과 관심분야를 파악 및 자취 추적<br/>
					&nbsp;&nbsp;- 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공<br/>
					&nbsp;&nbsp;2) 쿠키의 설치/운영 및 거부<br/>
					&nbsp;&nbsp;이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
					&nbsp;&nbsp;※ 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.<br/>
					
					<h6>9. 개인정보의 안전성 확보조치에 관한 사항</h6>
					<br/>
					포럼은 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.<br/>
					&nbsp;&nbsp;1) 개인정보의 암호화<br/>
					&nbsp;&nbsp;이용자의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 저장, 관리되며, 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.<br/>
					&nbsp;&nbsp;2) 해킹 등에 대비한 대책<br/>
					&nbsp;&nbsp;포럼은 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며, 암호화통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.<br/>
					&nbsp;&nbsp;3) 취급 직원의 최소화 및 교육<br/>
					&nbsp;&nbsp;포럼의 개인정보관련 취급 직원은 담당자에 한정시켜 최소화 하고 새로운 보안 기술 습득 및 개인정보보호 의무에 관한 수시 교육을 실시하고 있습니다.<br/>
					&nbsp;&nbsp;4) 개인정보처리시스템 접근 제한<br/>
					&nbsp;&nbsp;포럼은 개인정보를 처리할 수 있도록 체계적으로 구성한 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소 등에 관한 기준을 수립하고 비밀번호의 생성 방법, 변경 주기 등을 규정 운영하며 기타 개인정보에 대한 접근통제를 위해 필요한 조치를 다하고 있습니다.<br/>
					&nbsp;&nbsp;5) 개인 아이디와 비밀번호 관리<br/>
					&nbsp;&nbsp;이용자가 사용하는 ID와 비밀번호는 원칙적으로 당해 이용자만 사용하도록 되어 있습니다. 포럼은 이용자 본인의 부주의와 기본적인 인터넷의 위험성으로 인해 ID, 비밀번호 등 개인정보가 유출되어 발생한 문제에 대해 일체의 책임을 지지 않습니다. 비밀번호에 대한 보안 의식을 가지고 비밀번호를 자주 변경하며 공용PC에서의 로그인시 개인정보가 유출되지 않도록 각별한 주의를 기울여 주시기 바랍니다.
				</div>
				<br>
				
				<div align="center" style="margin-top: 20px;">
				<button onclick="location.href='${pageContext.request.contextPath}'">이전</button>
				<button id="nextBtn">다음</button>
				</div>	
					</div>	
			</div>
		</div>
		<br>
		<br>
		<br>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	</footer>
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------- -->
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