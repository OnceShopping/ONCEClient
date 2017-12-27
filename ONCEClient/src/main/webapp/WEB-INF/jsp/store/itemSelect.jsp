<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<li>
    <div class="sltItem">
    	<input type="hidden" name="itemDetailList[${ idNo }].itemName" value="${ itemName }">
    	<input type="hidden" name="itemDetailList[${ idNo }].delete" id="delete_${idNo}" value="false">
    	<input type="hidden" name="itemDetailList[${ idNo }].color" class="color" value="${ sltColor }">
    	<input type="hidden" name="itemDetailList[${ idNo }].size" class="size" value="${ sltSize }">
    	<a href="" class="removeItem" id="rmv_${idNo}" onclick="deleteOne(${ idNo }), changePrice()"><i class="fa fa-times"></i></a>
		<br/>
		${ sltColor } / ${ sltSize }
		<br/>
		<span><a href="" id="cntMinus_${idNo}" onclick="plusCnt(${idNo}), changePrice()"><i class="fa fa-minus-square-o" style="font-size: large;"></i></a></span>
	    <input type="number" id="cnt_${idNo}" name="itemDetailList[${ idNo }].count" value="1" readonly="readonly"
	    		class="cntItem" style="text-align: center; color: #111;"/>
	    <span><a href="" id="cntPlus_${idNo}" onclick="minusCnt(${idNo}), changePrice()"><i class="fa fa-plus-square-o" style="font-size: large;"></i></a></span>
    </div>
</li>