<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p style="float: left; margin-left: 10px; margin-top: 0px; font-size: 12px;">상품가격: &nbsp;&nbsp;</p>
<p style="float: left;  margin-top: 0px; font-size: 12px;" id="price_${loop.index}_${status.index}">${itemContents.price * itemContents.count }</p><p style="float: left; margin-top: 0px; font-size: 12px;" >원</p>
