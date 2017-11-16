<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	alert("${ message }");
	location.href = "${ pageContext.request.contextPath }/mypage/check";
</script>