<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[등록화면 ]
1. 자산코드, 취득일 , 상각방법, 정률법 ,정액법을 등록한다.
2. 정류법과 정액법선택을 저장하고 화면을 분류함.-->
<table style="margin-top: 30px">
	<thead>
		<tr>
			<td colspan="1"><label for="date" style="margin-right: 16px; font-size: 15px; " > 자산코드
							<span class="asteriskField">*</span></label>
			<td><input type="text" id="assetCode" name="assetCode" class="form-control-sm" ></td>
			<td><button  id="duplCheckbtn" name="duplCheckbtn" class="btn btn-primary btn-sm" style="margin-left: 6px;">확인</button>
			<td colspan="2"><div id="dupleCode"></div></td>
			<td><br><br></td>
			</tr>
		<tr>
			<td colspan="2"style="margin-right: 16px;" > 취득일<span class="asteriskField">*</span>
				<input class="form-control-sm" id="acquisitionDate" name="acquisitionDate" placeholder="YYYY/MM/DD" type="text" style="width: 180px; margin-left: 29px;"/>
			<td ><label style="margin-left: 15px ">유형</label> <span class="asteriskField">*</span> 
				<select id ="purchaseCode" name="purchaseCode" class="form-control-sm">
								<option value="과세매입" selected="selected">51 과세매입</option>
								<option value="불공" >54 불공</option>
				</select>
			</td>
			<td> <label style="margin-left: 20px ">상각방법</label>  <span class="asteriskField">*</span> 
				<select id ="sanggakWay" name="sanggakWay"  class="form-control-sm">
								<option value="1" selected="selected">정액법</option>
								<option value="0" >정률법</option>
				</select>
			</td>
			<td colspan="2"> <label style="margin-left: 20px ">취득금액</label><span class="asteriskField">*</span>   
				<input type="text" id="acquisitionPrice" name="acquisitionPrice"></td> 
			<td>
				<button  id="insertBtn" name="insertBtn" class="btn btn-primary btn-sm" style="margin-left: 10px ">저장</button>
			</td>	
			<td>
			<button class="btn btn-outline-primary btn-sm" onclick="fn_close();">닫기</button>
			</td>
		</tr>
	</thead>
</table>
<br>
<div id="serviceLife_div"></div>

<div class="modal modal-center fade" id="my80sizeModal6" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
			<div class="modal-header" style="background:#6C757D; height: 50px">
				<h6 style="color: #fff">| 년수별상각율</h6>
			</div>
				<div class="modal-body" align="center">
					<div class="form-group"></div>
					
					<div style="overflow:scroll; width:450px; height:370px;">
						<table border="1">
							<thead >
						     <tr class="thead">
						        <td>내용연수</td>
						        <td>정액법</td>
						        <td>정률법</td>
						    </tr>
						    </thead>
						    <tbody id="tbody">
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
				    <button type="button"  class="btn btn-secondary" data-dismiss="modal">닫기</button>
				  </div>
				</div>
			</div>
		</center>
	</div>
</div>

<script>

$("#acquisitionPrice").keypress(function(e){
	
	fn_insertSet(e);
});
	function fn_insertSet(e){
		if(e.which == 13){
		var comma = fn_numberWithCommas($("#acquisitionPrice").val());
		
		$("#acquisitionPrice").val(comma);
	}
	}
	
	/* 내용연수표로 이동 */
	function myClick(){
		$.ajax({
			url  : "${pageContext.request.contextPath }/serviceLife",
			success : function(data){
				$("#tbody").html(data);
			}	   
		});
	}
	
	/*원단위 콤마 변환*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function removeComma(str){
		return parseInt(str.replace(/,/g,""));
	}
	
	$("#insertBtn").on("click", function(){

		if($("#assetCode").val().trim() == "" || $("#acquisitionPrice").val().trim()==""){
			alert("(*)은 필수 사항입니다.");
			return false;
		}
		var price = $("#acquisitionPrice").val();
		price = removeComma(price);
		$("#acquisitionPrice").val(price);
	
		$.ajax({
			url  : "${pageContext.request.contextPath }/insertStatusFrm",
			data : "assetCode="+$("#assetCode").val() + "&"+ "acquisitionDate="+$("#acquisitionDate").val()+ 
					"&" + "purchaseCode="+$("#purchaseCode").val() + "&" + "sanggakWay="+$("#sanggakWay").val()+ 
					"&" + "acquisitionPrice="+$("#acquisitionPrice").val(),
			success : function(data){
				$("#serviceLife_div").html(data);
				$("#serviceLife_div").html(data);
		
				var date  = new Date($("#acquisitionDate").val());
				var month = 12-date.getMonth();
				$("#month").val(month);
				$('#insertBtn','#assetCode','#acquisitionDate','#purchaseCode','#sanggakWay','acquisitionPrice').attr('disabled', true);
		}
	});
});
			
	/* 카드코드 중복체크 ajax */
	$("#duplCheckbtn").on("click", function(){
	
	$.ajax({
		url 	: "${pageContext.request.contextPath }/DupleAsset",
		method  : "post",
		data 	: "assetCode="+$("#assetCode").val(),
		success : function(dupleCode){
			transDupl(dupleCode);
		}
	});
}); 
	
	var dupleCode ="";
	
	function transDupl(dupleCode){
		if(dupleCode == "0"){
			dupleCode ="<b><font color='blue'>사용가능한 카드 코드입니다.</font><br>"
			$("#dupleCode").html(dupleCode);
		}else if(dupleCode == "1"){
			dupleCode="<b><font color='red'>중복된 자산 코드입니다.</font><br>"
			$("#dupleCode").html(dupleCode);
			return false;
		}else if(dupleCode == "empty"){
			dupleCode = "<b><font color='orange'>자산 코드를 입력하세요.</font><br>"
			$("#dupleCode").html(dupleCode);
			return false;
		}
	}  
	
	$(document).ready(function() {
	    var date_input = $('input[name="acquisitionDate"]'); //our date input has the name "date"
	    var container = $('.bootstrap-iso form').length > 0 ? $(
	        '.bootstrap-iso form').parent() : "body";
	    date_input.datepicker({
	        dateFormat: 'yy/mm/dd',
	        container: container,
	        todayHighlight: true,
	        autoclose: true,
	        
	    });
	    $('#acquisitionDate').datepicker('setDate', 'today');      
	 });   
	
	function fn_close(){
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
	
</script>