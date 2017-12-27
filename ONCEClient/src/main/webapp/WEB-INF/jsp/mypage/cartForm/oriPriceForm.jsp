<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p style="float: left; margin-left: 10px;">정상가:</p>
	<p style="float: left;" id="price_${loop}_${index}" >${itemContents.price * itemContents.count }</p>