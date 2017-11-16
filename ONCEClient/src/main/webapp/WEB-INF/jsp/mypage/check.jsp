<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 정보 수정/탈퇴</h3>
	<p>본인 확인을 위해서 비밀번호를 한 번 더 입력해 주세요</p>
	<form action="${ pageContext.request.contextPath }/mypage/check" method="post">
		<input type="password" name="password" id="password"/>
		<input type="submit" value="확인"/>
	</form>
</body>
</html>