<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${customerVO.name} 님의 회원 정보</h3>
	<div>
		<form action="${pageContext.request.contextPath}/mypage/detail/${customerVO.id}" method="get">
			<input type="text" name="id" id="id" disabled="disabled" value="${customerVO.id}"/><br/>
			<input type="password" name="password" id="password"/><br/>
			<input type="password" name="pwChk" id="pwChk"/><br/>
			<input type="text" name="telephone" id="telephone" value="${customerVO.telephone}"/><br/>
			<input type="text" name="orderPassword" id="orderPassword"/><br/>
			<input type="text" name="orPwChk" id="orPwChk"/><br/>
			<input type="submit" value="수정"/><br/>
		</form>
		<a href="${pageContext.request.contextPath}/mypage/delete">회원 탈퇴</a>
	</div>
</body>
</html>