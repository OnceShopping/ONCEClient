<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="oriPrice_${loop}_${index}">
	<p style="float: left; margin-left: 10px;">정상가:</p>
	<p style="float: left;" id="price_${loop.index}_${status.index}" >${itemContents.price * itemContents.count }</p>
</div>
<br/>
<div id="salePrice_${loop}_${index}">
	<c:choose>
		<c:when test="${ itemContents.salePrice eq 0 }" />
		<c:otherwise>
		<p style="float: left;  margin-left: 10px; ">할인가:</p>
		<p style="color:red; float: left;" id="sale_${loop}_${index}" >${itemContents.salePrice * itemContents.count}</p>
		</c:otherwise>
	</c:choose>
</div>