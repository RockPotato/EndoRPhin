<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--[수정화면 /상세화면]
1. 자산코드, 취득일 , 상각방법, 정률법 ,정액법을 수정한다
2. 정류법과 정액법선택을 저장하고 화면을 분류함.-->
<table style="margin-top: 30px">
	<thead >
		<tr>
			<td colspan="1" ><label for="date" style="margin-right: 16px; font-size: 15px; " >자산코드
							<span class="asteriskField">*</span></label>
			<input class="form-control-sm" type="text" id="assetCode1" name="assetCode1" value="${asset.assetCode}" readonly> 
			<td><br><br></td>
		</tr>
		<tr> 
			<c:set var="dates" >
				<fmt:formatDate value="${asset.acquisitionDate  }" pattern="yyyy/MM/dd" />
			</c:set>
			<td colspan="2"style="margin-right: 16px;" >취득일<span class="asteriskField">*</span>
				<input class="form-control-sm"  id="acquisitionDate1" name="acquisitionDate1"  placeholder="YYYY/MM/DD" type="text" style="width: 180px; margin-left: 29px;" value="${dates}"  >
			<td> <label style="margin-left: 15px ">유형</label> <span class="asteriskField">*</span>
				<select id ="purchaseCode1" name="purchaseCode1" class="form-control-sm">
				
				<c:if test="${asset.purchaseCode == '과세매입'}">
					<option value="과세매입" selected="selected">51 과세매입</option></c:if>
					<option value="불공" >54 불공</option>
				<c:if test="${asset.purchaseCode == '불공'}">
					<option value="과세매입" >51 과세매입</option>
				</c:if>	
					
				</select>
			</td>
			<td><label style="margin-left: 20px ">상각방법</label>  <span class="asteriskField">*</span> 
				<select id ="sanggakWay1" name="sanggakWay1"  class="form-control-sm">
				<c:if test="${asset.sanggakWay == 1}">
					<option value="1" selected="selected">정액법</option>
					<option value="0" >정률법</option>
				</c:if>
				<c:if test="${asset.sanggakWay == 0}">
					<option value="1" >정액법</option>
					<option value="0" selected="selected">정률법</option>
				</c:if>
								
				</select>
			</td>
			<td colspan="2"> <label style="margin-left: 20px ">취득금액</label><span class="asteriskField">*</span>
				<input type="text" id="acquisitionPrice1" name="acquisitionPrice1" value="${asset.acquisitionPrice}"></td> 
			<td>
				<button class="btn btn-primary btn-sm"id="insertBtn" name="insertBtn" style="margin-left: 10px ">수정</button>
			</td>
			<td>
				<button class="btn btn-primary btn-sm"id="closeBtn" name="closeBtn">닫기</button>
			</td>		
		</tr>
	</thead>
</table>
<br>
<div id="serviceLife_div1"></div>

<!--내용연수 모달창  -->
<div class="modal modal-center fade" id="my80sizeModal6" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
			<div class="modal-header" style="background:#6C757D; height: 50px">
				<h6 style="color: #fff">| 년수별상각율</h6>
			</div>
				<div class="modal-body" align="center">
					<div class="form-group"></div>
					
					<div style="overflow:scroll;  width:300px; height:350px;">
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
				  <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
				</div>
				</div>
			</div>
	</div>
</div>

<script>

$("#acquisitionPrice").keypress(function(e){
	
	fn_insertSet(e);
});
    //금액 엔터누를시 콤마 찍힘
	function fn_insertSet(e){
		if(e.which == 13){
		var comma = fn_numberWithCommas($("#acquisitionPrice").val());
		
		$("#acquisitionPrice").val(comma);
	}
	}
	/*내용연수표로 이동 */
	function myClick(){
		$.ajax({
			url  : "${pageContext.request.contextPath }/serviceLife",
			success : function(data){
				$("#tbody").html(data);
			}	   
		});
	}
	$("#insertBtn").on("click", function(){
	 	if($("#assetCode1").val().trim() == "" || $("#acquisitionPrice1").val().trim()==""){
			alert("(*)은 필수 사항입니다.");
			return false;
		} 
		$.ajax({
			url  : "${pageContext.request.contextPath }/updateStatusAsset",
			data : "assetCode="+$("#assetCode1").val() + "&"+ "acquisitionDate="+$("#acquisitionDate1").val()+ 
					"&" + "purchaseCode="+$("#purchaseCode1").val() + "&" + "sanggakWay="+$("#sanggakWay1").val()+ 
					"&" + "acquisitionPrice="+$("#acquisitionPrice1").val(),
			success : function(data){
				$("#serviceLife_div1").html(data);
				$("#serviceLife_div1").html(data);
		
				var date  = new Date($("#acquisitionDate1").val());
				var month = 12-date.getMonth();
				$("#month").val(month);
				
		}
		
	});
});
		  
	/*원단위 콤마 변환*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
			
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
		}else if(dupleCode == "empty"){
			dupleCode = "<b><font color='orange'>자산 코드를 입력하세요.</font><br>"
			$("#dupleCode").html(dupleCode);
		}
	}  
	$(function() {

		$(document).ready(function() {
		    var date_input = $('input[name="acquisitionDate1"]'); //our date input has the name "date"
		    var container = $('.bootstrap-iso form').length > 0 ? $(
		        '.bootstrap-iso form').parent() : "body";
		    date_input.datepicker({
		        dateFormat: 'yy/mm/dd',
		        container: container,
		        todayHighlight: true,
		        autoclose: true,
		        
		    });
		    $('#acquisitionDate1').datepicker('setDate', 'today');      
		 });   
	});
	
	$("#closeBtn").on("click", function(){
		$("#insertArea").html("");
	});
</script>