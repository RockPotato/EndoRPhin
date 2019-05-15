<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--정액법  날짜, 취득원가를 받아서 감가상각비를 계산함-->

<input type="hidden" id="accumulated" name="accumulated" value="">

<table class="table table-sm">
	<thead class="thead">
		<tr>
			<td colspan="5" width="80%">| 고정자산등록   </td>
			<td></td>
		</tr>
	</thead>
		<tr>
			<td colspan="2"  style="margin-right: 16px;" >자산명<span class="asteriskField">*</span></td>
			<td><input type="text" id="assetName" ></td> 
			<tr>
		</tr>
		<tr>
			<td colspan="2" style="margin-right: 16px;" > 계정과목<span class="asteriskField">*</span></td>
			<td><input type="text" id="accountName" >
				<input type="button" class="btn btn-secondary btn-sm"  data-toggle="modal" data-target="#my80sizeModal2" value="검색" ></td>
			
		</tr>
		<tr>
			<td colspan="2"  style="margin-right: 16px;" > 거래처<span class="asteriskField">*</span></td>
			<td><input type="text" id="clientName">
				<input type="button" class="btn btn-secondary btn-sm"  data-toggle="modal" data-target="#my80sizeModal3" value="검색" ></td>
			
		</tr>
		<tr>
			<td colspan="2"  style="margin-right: 16px;" > 감가상각계정코드<span class="asteriskField">*</span></td>
			<td><input type="text" id="sanggakCode">
				<input type="button" class="btn btn-secondary btn-sm"  data-toggle="modal" data-target="#my80sizeModal4" value="검색" >	</td>
				
		</tr>
		<tr>
		
			<td colspan="2"  style="margin-right: 16px;" >내용연수/상각률(원수) <span class="asteriskField">*</span></td>
			<td><input type="text" id="serviceLife" style="width: 50px;">
				<input type="button" class="btn btn-secondary btn-sm"  data-toggle="modal" data-target="#my80sizeModal5" value="▦">
				<input type="text" id="depreciationRate" style="width: 65px;">
				(&nbsp;<input type="text" id="month" style="width: 50px;">&nbsp;)
				<input onclick="myClick();" type="button" class="btn btn-secondary btn-sm"  data-toggle="modal" data-target="#my80sizeModal6" value="년수별상각율">
			</td>
		</tr>
		<tr>
			<td colspan="2"  style="margin-right: 16px;" >감가상각비 <span class="asteriskField">*</span></td>
			<td colspan="2"><input type="text" id="depreciation"></td> 
		</tr>
		<tr>
			<td colspan="2"  style="margin-right: 16px;" >잔존가치 <span class="asteriskField">*</span></td>
			<td colspan="2"><input type="text" id="residualvalue" value="0"></td> 
		</tr>
		<tr>
			<td colspan="2"  style="margin-right: 16px;" > 적요 </td>
			<td><input type="text" id="jukyo"></td> 
		</tr>
		<tr>
			<td><button type="button" class="btn btn-primary" onclick="deleteBtn();">취소 </button>
			<button type="button" class="btn btn-primary" onclick="insertBtn();">등록 </button></td>
			
		</tr>
    </table>
    
    
<!--내용연수 표   -->
<div class="modal fade" id="my80sizeModal5" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document" >
		<div class="modal-content modal-lg">
			<div class="modal-header" style="background:#6C757D; height: 50px">
				<h6 style="color: #fff">| 기준내용년수도움표</h6>
			</div>
			<center>
				<div class="modal-body">
					<div class="form-group"></div>
					
						<table border="1">
						
							<thead>
						     <tr>
						        <td colspan="5" align="center">[별표 5] 건축물등의 기준내용연수 및 내용연수 범위표(제15제3항관련)</td>
						    </tr>
						    <tr >
						     	<td align="center">대분류</td>
						    	<td colspan="3" style="width: 50%" align="center" >중분류</td>
						    	<td colspan="1" align="center">내용년수 </td>
						    </tr>
						    </thead>
						    <tbody>
						      <tr class="classTr" data-value="5" >
							        <td >차량, 공구, 비품</td>
							        <td colspan="2">&nbsp;&nbsp;1&nbsp;&nbsp;</td>
							        <td colspan="1">차량운반구 (운수업등 사용시 제외), 공구, 기구 및 비품</td>
							        <td>&nbsp;&nbsp;5&nbsp;&nbsp;</td>
						      </tr>
						       <tr class="classTr" data-value="20" >
							        <td>건축물</td>
							        <td>&nbsp;&nbsp;2&nbsp;&nbsp;</td>
							        <td colspan="2">연와조, 블럭조, 콘크리트조, 토조, 토벽조, 목조, 목골목탈조, 기타조의
							        				모든 건물 (부속설비 포함과 구축물)</td>
							        <td>&nbsp;&nbsp;20&nbsp;&nbsp;</td>
						      </tr>
						       <tr  class="classTr" data-value="40"  >
							        <td>건축물</td>
							        <td>&nbsp;&nbsp;3&nbsp;&nbsp;</td>
							        <td colspan="2">철골·철근콘크리트조, 철근콘크리트조, 석조, 연와석조, 
							        				철골조의 모든건물 (부속설비 포함)과 구축물</td>
							         
							        <td>&nbsp;&nbsp;40&nbsp;&nbsp;</td>
						      </tr>
						            <tr class="classTr" data-value="12" >
							        <td>선박 및 항공기</td>
							        <td>&nbsp;&nbsp;1&nbsp;&nbsp;</td>
							        <td colspan="2">선박 및 항공기 (어업, 운수업등 사용시 제외)</td>
							        <td>&nbsp;&nbsp;12&nbsp;&nbsp;</td>
						      </tr>
						    </tbody>
						</tbody>
					</table>
					<input type="hidden" class="buttons" data-dismiss="modal" value=""/>
				  <button type="button" class="btn btn-secondary btn-sm"  class="btn btn-default" data-dismiss="modal">닫기</button>
				  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
				</div>
			</div>
		</center>
	</div>
</div>
    <script>
    

    /* depreciation 정액법 = (취득원가 - 잔존가치)/ 내용연수  */
    $(".classTr").on("click", function(){
		var data = $(this).data("value"); /* 내용연수  */
		var cal  = 1/parseInt(data);     
		var fixed = cal.toFixed(3);
		
		var acquisitionPrice = $("#acquisitionPrice").val(); 
		var depreciation = acquisitionPrice/parseInt(data); 
		
		var depre = parseInt(depreciation);
		depre = fn_numberWithCommas(depre);
		
		$("#serviceLife").val(data); 
	 	$("#depreciationRate").val(fixed); 
		$("#depreciation").val(depre);
		
		$('.buttons').trigger('click');
	});
    /*원단위 콤마 변환*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	}
    
	function removeComma(str){
		return parseInt(str.replace(/,/g,""));
	}
	
	function insertBtn(){
		if($("#assetName").val().trim() == "" || $("#accountName").val().trim()==""
			|| $("#clientName").val().trim() == "" || $("#sanggakCode").val().trim()==""
			|| $("#depreciation").val().trim() == "" || $("#residualvalue").val().trim()==""){
			alert("(*)은 필수 사항입니다.");
			return false;
		}
		var delDepre  = $("#depreciation").val();
		delDepre = removeComma(delDepre);
		$("#depreciation").val(delDepre);
		
		$.ajax({
			url  : "${pageContext.request.contextPath }/insertFrm",
			data : "assetCode="+$("#assetCode").val() + "&"+ "date="+$("#date").val()+ 
					"&" +"assetName="+$("#assetName").val()+ 
					"&" +"sanggakWay="+$("#sanggakWay").val() +  "&"+"accountName="+$("#accountName").val()+ 
					"&" + "clientName="+$("#clientName").val() + "&" + "acquisitionPrice="+$("#acquisitionPrice").val()+ 
					"&" + "residualvalue="+$("#residualvalue").val()+"&" + "jukyo="+$("#jukyo").val() + 
					"&" + "sanggakCode="+$("#sanggakCode").val()+"&" + "depreciation="+$("#depreciation").val()+
					"&" + "accumulated="+$("#accumulated").val()+"&" + "purchaseCode="+$("#purchaseCode").val()+
					"&" + "serviceLife="+$("#serviceLife").val()+"&" + "depreciationRate="+$("#depreciationRate").val(),
					
			success : function(data){
				$("#serviceLife_div").html("");	
				$("#insertArea").html("");	
				
				alert("성공적으로 등록되었습니다.");
				location.reload();
			}
		});
	}
	
	function deleteBtn(){
 	$.ajax({
		url 	: "${pageContext.request.contextPath }/deleteAsset",
		data 	: "assetCode="+$("#assetCode").val(),
		success : function(data){
       	 alert("고정자산등록을 취소합니다.");
       	 
       	$("#insertArea").html("");	
       	location.reload();
		}
	});
}
	
  	$(document).keydown(function (e) {
	     
        if (e.which === 116) {
            if (typeof event == "object") {
                event.keyCode = 0;
                var del = confirm("작업을 취소하시 겠습니까?");
                if (del == true) {
                	$.ajax({
                		url 	: "${pageContext.request.contextPath }/deleteAsset",
                		data 	: "assetCode="+$("#assetCode").val(),
                		success : function(data){
	                   	 alert("고정자산등록을 취소합니다.");
	                   	$("#insertArea").html("");	
	                   	location.reload();
                		}
                	});
                } else {
                    alert("작업을 계속진행합니다.");
                }
            }
                return false;
          
        } 

	}); 
    </script>