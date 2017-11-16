<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 탈퇴</h3>
	<p>회원 탈퇴 시 모든 구매,주문 내역 및 찜 목록이 삭제되며 이는 다시 복구할 수 없습니다.</p>
	<form action="${pageContext.request.contextPath}/mypage/delete/${customerVO.id}" method="get">
		<input type="submit" value="확인"/>
	</form>
	<input type="button" value="취소" onclick="${pageContext.request.contextPath}/mypage/detail/${customerVO.id}"/>
</body>
</html>