<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.input-group-text{
 	color:#fff !important;
 	border-color : #6E6867 !important;
	background-color: #6E6867 !important;
}
</style>
	<div class="row">
		<div class="col-md-1" style="width: 100%">
		</div>
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<h2>
					<strong><i class="fa fa-calculator"></i> 급여명세서 인쇄/발송</strong>
				</h2>
			</div>
			<form action="/goPaymentPrint" method="get">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th>
								<div class="input-group">
									<span class="input-group-text">년도</span> 
									<select name="paydayYear" class="form-control"></select>
									 <span class="input-group-text">월</span>
									<select name="paydayMonth" class="form-control">
									</select>
								</div>
							</th>
							<th><button class="bttn-fill bttn-md bttn-warning" type="submit">검색</button></th>
					</thead>
				</table>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th>년도</th>
							<th>월</th>
							<th>지급일</th>
							<th>인쇄</th>
							<th>발송</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach items="${paymentList}" var="vo">
							<tr>
								<td>${fn:split(vo.payDay,'-')[0]}</td>
								<td>${fn:split(vo.payDay,'-')[1]}</td>
								<td>${vo.payDay}</td>
								<td><a class="bttn-stretch bttn-md bttn-warning modalPrint"
								 data-target="#printModal" data-toggle="modal" href="#">인쇄하기</a></td>
								<td><a class="bttn-stretch bttn-md bttn-warning modalSend"
								 data-target="#printModal" data-toggle="modal" href="#">이메일</a></td>
							<tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-7"></div>
	</div>

<div class="modal fade" id="printModal" data-backdrop="static" aria-hidden="true" 
	style="margin-left: 500px; none; z-index: 1080;">
    	<div class="modal-dialog modal-lg" style="max-height: 100%; max-width: 100%;">
          <div class="modal-content modal-lg">
            <div class="modal-header modalSketchedHeader">
              <h4 class="modal-title" id="secondModalTitle">임시</h4>
              <button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3 id="modalTitle"></h3>
            	<div style="overflow:scroll; width:100%; height:600px;">
	            	<table class="table table-hover">
	            		<thead id="modalThead">
	            		</thead>
	            		<tbody id="modalTbody">
	            			
	            		</tbody>
					</table>
            	</div>
            </div>
            <div class="modal-footer input-group">
              <a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
              <button style="background-color: #6E6867;"
			 class="btn btn-info" type="button" id="printBtn">
			    Print
			 </button>
              <button style="background-color: #6E6867;"
			 	class="btn btn-info" type="button" id="emailSendBtn">
			    Send
			 </button>
            </div>
          </div>
        </div>
    </div>
<div id="hiddenDiv" style="display: none; z-index: 1080;">
	<div id="printDiv"></div>
<img style="position: absolute; left: -10px"/>
</div>
<script>
var payDay;
var htmlText;
var email;
	$(document).ready(function(){
		var modalCheck;
		$(".modalPrint, .modalSend").click(function(){
			if($(this).html()=='인쇄하기'){
				$("#secondModalTitle").html('인쇄하기');
				$("#printBtn").show();
				$("#emailSendBtn").hide();
				modalCheck=false;
			}else{
				$("#secondModalTitle").html('이메일 발송');
				$("#emailSendBtn").show();
				$("#printBtn").hide();
				modalCheck=true;
			}
			$("#modalThead").html('<tr><th></th><th>사번</th><th>직원명</th><th>부서명</th><th>E-Mail 주소</th></tr>')
			payDay= $(this).parents('td').siblings('td')[2].innerHTML;
			$.ajax({
				method : "post",
				url : "/getPaymentForAdjust",
				data : {
					payDay : payDay,
					printCheck : true
				},
				success : function(data) {
					modalInput4Print(data,modalCheck);
				}
			})	
		});
	
		$("#printBtn").click(function(){
			var printUserTr = $("input[name=printCheck]:checked").closest('tr');
			if($("input[name=printCheck]:checked").length==0){
				alert('사원을 선택하세요.');
				return false;
			}
			$.ajax({
				method : "get",
				url : "/getPaymentList",
				async :false,
				data : {
					payCode : printUserTr.data('pdcd')
				},
				success : function(data) {
					$("#printDiv").html(printDiv(data,printUserTr));
				}
			});
			printJS({ printable: 'printDiv', type: 'html',scanStyles:true,  targetStyles: ['*'], header: '급여 명세서' });
		})
		dateInit();
		$("#emailSendBtn").click(function(){
			if($("input[name=printCheck]:checked").length==0){
				alert('사원을 선택하세요.');
				return false;
			}
			htmlText = new Array();
			email = new Array();
			$("input[name=printCheck]:checked").each(function(){
				var printUserTr=$(this).parent('td').parent('tr');
				if($(this).parent('td').siblings('td').eq(3).html()!='없음'){
					$.ajax({
						method : "get",
						url : "/getPaymentList",
						async :false,
						data : {
							payCode : $(this).parent('td').parent('tr').data('pdcd')
						},
						success : function(data) {
							htmlText.push(printDiv(data,printUserTr));
						}
					});
					
					email.push($(this).parent('td').siblings('td').eq(3).html());
				}
			})
			if(htmlText.length>0){
				$.ajax({
					method : "post",
					url : "/sendPaymentMail",
					async :false,
					data : 
						"htmlText="+htmlText+
						"&email="+email
					,
					success : function(data) {
						alert(data+" 건의 메일이 발송 되었습니다.");
					}
				});
			}	
		})
	});
	function printDiv(data,printUserTr){
		var divText ="<table class=\'table table-striped\'>";
			divText +="<thead>"
			+"<tr><td>이름</td><td>"+printUserTr.children('td').eq(2).html()
			+"</td><td>부서</td><td>"+printUserTr.children('td').eq(3).html()+"</td></tr>"
			+"</thead><tbody style=\'text-align: center;\'>";		
			for (var i = 0; i < data.paymentDetailList.length; i++) {
				var detailItem =data.paymentDetailList[i];
				var divItem = data.divList[i];
				divText+="<tr>"
				+"<td>"+divItem.deductName+"</td>"
				+"<td colspan=\'3\'>"+detailItem.deductPay+"</td>"
				+"</tr>";
			}
			divText+="<tr style=\'color: blue !important;\'><td>총급여액</td><td colspan=\'3\'>"+data.paymentVo.totalSalary+"</td></tr>"
			+"<tr style=\'color: red !important;\'><td>총공제액</td><td colspan=\'3\'>"+data.paymentVo.totalWage+"</td></tr><tbody>"
			+"<tfoot>"
			+"<tr><td colspan=\'3\'></td><td>EndoRPhin (인)<img style=\' position: absolute; top:720px; left: 560px; width: 80px; height: 80px;\' src=\'/images/stamp.png\'></td></tr>"
			+"</tfoot></table>";
		return divText
	}
	
	function modalInput4Print(data,modalCheck){
		var tbodyText="";
		for (var i = 0; i < data.employeeList.length; i++) {
			var item =data.employeeList[i];
			tbodyText+="<tr class=\'printUserTr\' data-pdcd=\'"+data.paymentList[i].payCode+"\'>";
			if(modalCheck){
				tbodyText+="<td><input name=\'printCheck\' type=\'checkbox\'></td>";
			}else{
				tbodyText+="<td><input name=\'printCheck\' type=\'radio\'></td>";
			}
			tbodyText+="<td>"+item.userId+"</td>"
			+"<td>"+item.userNm+"</td>"
			+"<td>"+item.deptname+"</td>";
			if(item.email==null){
				tbodyText+="<td>"+'없음'+"</td>";
			}else{
				tbodyText+="<td>"+item.email+"</td>";
			}
			tbodyText+="</tr>";
		}
		$("#modalTbody").html(tbodyText);
	}
	function dateInit(){
		for (var i = -3; i < 3; i++) {
			$("select[name=paydayYear]").append("<option value="+(new Date().getFullYear()+i)+">"
					+(new Date().getFullYear()+i)+"년</option>");
		}
		for (var i = 1; i <= 12; i++) {
			if(i<10){
				$("select[name=paydayMonth]").append("<option value="+'0'+i+">"
						+i+"월</option>");
			}else
				$("select[name=paydayMonth]").append("<option value="+i+">"
						+i+"월</option>");
		}
		$("select[name=paydayYear]").val(new Date().getFullYear());
		if(new Date().getMonth()+1<10){
			$("select[name=paydayMonth]").val('0'+(new Date().getMonth()+1));
		}else
			$("select[name=paydayMonth]").val(new Date().getMonth()+1);
	}
</script>