<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<li>
    <div class="sltItem">
    	<input type="hidden" name="itemDetailList[${ idNo }].itemName" value="${ itemName }">
    	<input type="hidden" name="itemDetailList[${ idNo }].delete" id="delete_${idNo}" value="false">
    	<a href="" class="removeItem" id="rmv${idNo}"><i class="fa fa-times"></i></a>
		<br/>
		색상: <input type="text" name="itemDetailList[${ idNo }].color" value="${ sltColor }" style="color: #111;" readonly="readonly">
		  / 사이즈: <input type="text" name="itemDetailList[${ idNo }].size" value="${ sltSize }" style="color: #111;" readonly="readonly">
		<br/>
             수량: <input type="number" name="itemDetailList[${ idNo }].count" value="1" class="cntItem"/><br/>
    </div>
</li>