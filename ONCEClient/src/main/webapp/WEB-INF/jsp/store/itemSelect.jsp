<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<li>
    <div class="sltItem">
    	<input type="hidden" name="itemDetailList[${ idNo }].itemName" value="${ itemName }">
    	<input type="hidden" name="itemDetailList[${ idNo }].delete" id="delete_${idNo}" value="false">
    	<input type="hidden" name="itemDetailList[${ idNo }].color" value="${ sltColor }">
    	<input type="hidden" name="itemDetailList[${ idNo }].size" value="${ sltSize }">
    	<a href="" class="removeItem" id="rmv${idNo}"><i class="fa fa-times"></i></a>
		<br/>
		${ sltColor } / ${ sltSize }
		<br/>
			<span><a href="" id="cntMinus${idNo}"><i class="fa fa-minus-square-o" style="font-size: large;"></i></a></span>
	        <input type="number" name="itemDetailList[${ idNo }].count" value="1" class="cntItem" id="cnt${idNo}" style="text-align: center;"/>
	        <span><a href="" id="cntPlus${idNo}"><i class="fa fa-plus-square-o" style="font-size: large;"></i></a></span>

    </div>
</li>