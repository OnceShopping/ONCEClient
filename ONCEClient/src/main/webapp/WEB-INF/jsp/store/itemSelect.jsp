<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var idNum =${idNo};
		
		$('#rmv'+idNum).click(function() {  //x표시를 누를 경우
			var obj = $(this).attr('id');
			var splitChar = obj.split("rmv");
 			var num = splitChar[1];
			
 			var count = $('#cnt'+num).val();
			deleteOption(count);
			
			$('#'+obj).closest('li').remove();
			//$('#'+obj).closest('li').closet('script').remove();
			
           return false;
		});
		
 		 $('#cntMinus'+idNum).click(function() {  //-표시를 누를 경우
 			var obj = $(this).attr('id');
 			
 			var splitChar = obj.split("cntMinus");
 			var num = splitChar[1];
 			var count = $('#cnt'+num).val();
 			
 			if(count=='1')
 				count=1;
 			else{
 				count--;
 				calculate_M();
 			}
 			
 			$('#cnt'+num).val(count);
 			
 			
          	return false;
		});
 		
		
		$('#cntPlus'+idNum).click(function() {  //+표시를 누를 경우
				var obj = $(this).attr('id');
					
				var splitChar = obj.split("cntPlus");
				var num = splitChar[1];
				var count = $('#cnt'+num).val();
				
				count++;
				$('#cnt'+num).val(count);
				calculate_P(); 
				
		 	return false;
		});
	});
	
</script>
<li>
    <div class="sltItem">
    	<input type="hidden" name="itemDetailList[${ idNo }].itemName" value="${ itemName }">
    	<input type="hidden" name="itemDetailList[${ idNo }].delete" id="delete_${idNo}" value="false">
    	<input type="hidden" name="itemDetailList[${ idNo }].color" id="color_${idNo}" value="${ sltColor }">
    	<input type="hidden" name="itemDetailList[${ idNo }].size" id="size_${idNo}" value="${ sltSize }">
    	<a href="" class="removeItem" id="rmv${idNo}"><i class="fa fa-times"></i></a>
		<br/>
		${ sltColor } / ${ sltSize }
		<br/>
			<span><a href="" id="cntMinus${idNo}"><i class="fa fa-minus-square-o" style="font-size: large;"></i></a></span>
	        <input type="number" min="1" name="itemDetailList[${ idNo }].count" value="1" class="cntItem" id="cnt${idNo}" style="text-align: center;"/>
	        <span><a href="" id="cntPlus${idNo}"><i class="fa fa-plus-square-o" style="font-size: large;"></i></a></span>
    </div>
</li>