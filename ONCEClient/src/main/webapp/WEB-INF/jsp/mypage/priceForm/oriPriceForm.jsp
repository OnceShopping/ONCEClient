<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p style="float: left; margin-left: 10px;">정상가:</p>
<c:choose>
	<c:when test="${ itemContents.salePrice eq 0 }">
		<p style="float: left;">${itemContents.price * itemContents.count }</p>
	</c:when>
	<c:otherwise>
		<p style="text-decoration: line-through;">${itemContents.price * itemContents.count }</p>
	</c:otherwise>
</c:choose>
