<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${ itemContents.salePrice eq 0 }" />
	<c:otherwise>
		<p style="float: left;  margin-left: 10px; ">할인가:</p>
		<p style="color:red; float: left;">${itemContents.salePrice * itemContents.count}</p>
	</c:otherwise>
</c:choose>