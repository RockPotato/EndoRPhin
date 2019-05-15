<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="row">
		<div class="col-md-1" style="width: 100%">
		</div>
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<h2>
					<strong><i class="fa fa-calculator"></i>개인별 급여 현황</strong>
				</h2>
			</div>
			<form action="/paymentPersonal" method="get">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
						<th><input type="text" class="search-query form-control" 
								id="datepickerTo" name='paydayTo' value="${paydayTo}"></th>
							<th><h4><strong>~</strong></h4></th>	
							<th><input type="text" class="search-query form-control" 
								id="datepickerFrom" name='paydayFrom' value="${paydayFrom}"></th>
						<th><label >사원명 :</label></th>
						<th>
							<input value="${userid}" type="text" name="userid" value="${userid }" class="form-control"
							id="searchUserIdInput" placeholder="사원 선택 " readonly="readonly"/>
						</th>
						<th>
							<a href="#" data-toggle="modal" style="color:white" id="myModal3In">
								<i class="fa fa-users" style="font-size:25"></i>
							</a>
						</th>
						<th><button style="background-color: #6E6867;" 
								class="btn btn-info" type="submit">검색</button></th>
					</thead>
				</table>
			</form>
		</div>
	</div>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
							<th>사번</th>
							<th>성명</th>
							<th>지급일자</th>
							<th>부서명</th>
							<th>총급여액</th>
							<th>총공제액</th>
							<th>총지급액</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach items="${selectPersonalPaymentList}" var="vo">
							<tr class="mainPaymentListTr">
								<td>${vo.userId }</td>
								<td>${vo.usernm }</td>
								<td><a href="#" data-userid='${vo.userId}' data-toggle="modal" class='myModal3In'
										style="color:brown">${vo.payDay}</a></td>
								<td>${vo.deptname }</td>
								<td><fmt:formatNumber value="${vo.totalSalary}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${vo.totalWage}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${vo.totalSalary-vo.totalWage}" pattern="#,###" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<form action="/paymentPersonalExceldown" id="personalFrm">
		<button style="margin-left: 705px; background-color: #6E6867;"
			class="btn btn-info">Excel</button>
		</form>
	</div>
</div>
<%@ include file="employeeSearch.jsp" %>  
<div class="modal fade" id="myModal4" tabindex="-1" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<table class="table-hover">
						<tr>
							<th><label>사번</label></th>
							<td><input style="width:50px" class="modalUserInfo" disabled="disabled"  size="12"/></td>
							<th><label>이름</label></th>
							<td><input style="width:100px" class="modalUserInfo" disabled="disabled"  size="12"/></td>
							<th><label>지급일자</label></th>
							<td><input style="width:160px" class="modalUserInfo" disabled="disabled"  size="12"/></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-body">
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table class="table table-hover" style="border-spacing: 6px; border-collapse: separate;">
						<thead>
							<tr>
								<th>항목명</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody id="modalPaymentTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
<!-- 				<a href="#" class="btn">신규 등록</a>  -->
				<a href="" data-dismiss="modal" class="btn" aria-hidden="true">Close</a>
			</div>
		</div>
	</div>
</div>  
  
<script>
	$(document).ready(function(){
		$("#datepickerFrom,#datepickerTo").datepicker({
			 dateFormat: 'yy-mm-dd' //Input Display Format 변경
	             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	             ,changeYear: true //콤보박스에서 년 선택 가능
	             ,changeMonth: true //콤보박스에서 월 선택 가능                
	             ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	             ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	             ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,minDate: "-3Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+2Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)        
		});
		if($("#datepickerTo").val()=="")
			$("#datepickerTo").datepicker('setDate','today-1M');
		if($("#datepickerFrom").val()=="")
			$("#datepickerFrom").datepicker('setDate','today');
		modalTrEvent();
		
		$("#personalFrm").append("<input type=\'hidden\' name=\'paydayTo\' value=\'"+$("#datepickerTo").val()+"\'>");
		$("#personalFrm").append("<input type=\'hidden\' name=\'paydayFrom\' value=\'"+$("#datepickerFrom").val()+"\'>");
		$("#personalFrm").append("<input type=\'hidden\' name=\'userid\' value=\'"+$("#searchUserIdInput").val()+"\'>");
	});
	
	$(".myModal3In").click(function(){
		$(".modalUserInfo").eq(2).val($(this).html());
		for(var i=0;i<2;i++){
			$(".modalUserInfo").eq(i).val($(this).closest(".mainPaymentListTr").children("td").eq(i).html());
		}
		$.ajax({
			method : "get",
			url : "/getPaymentListPersonal",
			data : {payday : $(this).html(),
					userid : $(this).data('userid')},
			success : function(data) {
				$("#modalPaymentTbody").html('');
				for (var i = 0; i < data.divList.length; i++) {
					var detailcheck=false;
					$("#modalPaymentTbody").append("<tr>");
					$("#modalPaymentTbody").append("<td>"+data.divList[i].deductName+"</td>");										
					for (var j = 0; j < data.paymentDetailList.length; j++) {
						if(data.divList[i].deductCode==data.paymentDetailList[j].deductCode){
							detailcheck=true;
							$("#modalPaymentTbody").append("<td>"+Number(data.paymentDetailList[j].deductPay).toLocaleString()+"</td>");										
						}
					}
					if(detailcheck==false){
						$("#modalPaymentTbody").append("<td>"+0+"</td>");										
					}
					$("#modalPaymentTbody").append("</tr>");
				}
				$("#modalPaymentTbody").append("<tr><td>총급여액</td><td>"+Number(data.paymentVo.totalSalary).toLocaleString()+"</td></tr>");
				$("#modalPaymentTbody").append("<tr><td>총공제액</td><td>"+Number(data.paymentVo.totalWage).toLocaleString()+"</td></tr>");
				$("#modalPaymentTbody").append("<tr><td>실지급액</td><td>"+
						Number(data.paymentVo.totalSalary-data.paymentVo.totalWage).toLocaleString()+"</td></tr>");
			}
		});
		$("#myModal4").modal("show");
	});
	$("#myModal3In").click(function(){
		$("#myModal3").modal("show");
	});
	
	function modalTrEvent(){
		$(".modalUserIdTr").off('click');
		$(".modalUserIdTr").on('click',function(){
			$("#searchUserIdInput").val($(this).find('td').eq(1).html());
			$("#myModal3").modal("hide");
		});
	}
	$("#modalSearchUserBtn").click(function(){
		$.ajax({
			method : "get",
			url : "/searchUserNmToPayment",
			data : "usernm=" + $("#modalSearchUserName").val(),
			success : function(data) {
				$(".modalUserIdTr").each(function(){$(this).remove()});
				for (var i = 0; i < data.length; i++) {
					$("#modalUserTbody").append('<tr class=\'modalUserIdTr\'><td>'+
												data[i].userId+'</td><td>'+
												data[i].userNm+'</td></tr>');
				}
				modalTrEvent();
			}
		});
	})
	
	
	

</script>

<script type="text/javascript" src="/js/datepicker.js"></script>