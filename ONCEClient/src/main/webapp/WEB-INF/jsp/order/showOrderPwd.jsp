<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-content">
	<h4 class="modal-title" id="exampleModalLabel">결 제 완 료</h4>
	<hr style="margin-top: 5px; border-top: 1px solid #999;"/>
	<h6>수령 비밀 번호</h6>
	<p style="font-weight: bold;">${secretPassword}</p>
	<p style="font-size: 10px;">회원가입시 설정하신 수령 비밀번호입니다. 회원정보수정에서 수정 하실 수 있습니다.</p>
	<div class="modal-footer" style="background-color: #fff; border-top: 1px solid #ccc;">
		<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='${pageContext.request.contextPath }/orderList/paySuccess'">확인</button>
	</div>
</div>