<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${ itemContents.salePrice eq 0 }" />
	<c:otherwise>
	<p style="float: left; margin-left: 10px;  margin-top: 0px; font-size: 12px;">할인가격: &nbsp;&nbsp;</p>
	<p style="color:red; float: left;  margin-top: 0px; font-size: 12px;" id="sale_${loop.index}_${status.index}" >${itemContents.salePrice * itemContents.count}</p><p style="float: left; margin-top: 0px; font-size: 12px;" >원</p>
	</c:otherwise>
</c:choose>