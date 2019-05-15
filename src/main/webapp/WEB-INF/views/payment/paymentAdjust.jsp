<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
select {
	width: 200px;
}
.input-group-text{
 	color:#fff !important;
 	border-color : #6E6867 !important;
	background-color: #6E6867 !important;
}
.table {
	display: table;
	height: 80px;
	position: relative;
}

.table td {
	display: table-cell;
	vertical-align: middle !important;
}

.nav>li>a:focus, .nav>li>a:hover {
	text-decoration: none;
	background-color: #eee;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd;
}

.nav>li>a {
	position: relative;
	display: block;
	padding: 10px 15px;
}

.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0;
}

.tabControl {
	color: #000 !important;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: default;
	background-color: #fff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}
</style>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="form-group">
			<h2>
				<strong><i class="fa fa-calculator"></i> 급여계산</strong>
			</h2>
		</div>
		<form action="/paymentAdjust">
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<th>
							<div class="input-group">
								<span class="input-group-text">년도</span> <select
									name="paydayYear" class="form-control"></select> <span
									class="input-group-text">월</span> <select name="paydayMonth"
									class="form-control">
								</select>
							</div>
						</th>
						<th><button style="background-color: #6E6867;" type="submit"
								class="btn btn-info">검색</button></th>
				</thead>
			</table>
		</form>
		<div class="form-group">
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<th>년도</th>
						<th>월</th>
						<th>급여액</th>
						<th>공제액</th>
					</tr>
				</thead>
				<tbody id="paymentTbody">
					<tr>
						<td><a data-toggle="modal" data-target="#my80sizeModal"
							data-payday="${paymentVo.payDay}" style="color: #000 !important;"
							class="paymentDetail" href="#">${fn:substring(paymentVo.payDay,0,4) }</a></td>
						<td>${fn:substring(paymentVo.payDay,5,7) }</td>
						<td><fmt:formatNumber value="${paymentVo.totalSalary}"
								pattern="#,###" /></td>
						<td><fmt:formatNumber value="${paymentVo.totalWage}"
								pattern="#,###" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>



<div class="row">
	<div class="col-md-10" style="width: 100%"></div>
	<div class="col-md-1" style="width: 100%">
		<button data-toggle="modal" data-target="#my80sizeModal" type="button"
			style="background-color: #6E6867;" class="btn btn-info"
			id="insPaymentReport">신규등록</button>
	</div>
</div>

<!-- 80% size Modal  등록 모달 창-->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog"
	aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-lg">
			<div class="modal-header">
				<h4>급여 계산</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="firModalFrm" action="/deletePaymentReport">
				<div class="modal-body">
					<div class="form-group">
						<table class="table table-hover">
							<tr id="insModalTr">
								<th><label>지급일</label></th>
								<td><input id="paymentDate" readonly
									class="modalUserInfo datepicker" size="12" /></td>
								<th>내역</th>
								<td><button type="button"
										style="background-color: #6E6867;" data-toggle='modal'
										data-target="#myModal3" class="btn btn-info">상세보기</button></td>
							</tr>
							<tr id="updModalTr">
								<th><label>지급일</label></th>
								<td><input readonly name="paymentDate"
									class="modalUserInfo" size="12" /></td>
								<th>내역</th>
								<td><button type="button"
										style="background-color: #6E6867;" data-toggle='modal'
										data-target="#myModal3" class="btn btn-info">상세보기</button></td>
							</tr>
							<tr>
								<th><label>지급액</label></th>
								<td><input class="modalUserInfo" id="totalSalary" size="12"
									readonly /></td>
								<th><label>공제액</label></th>
								<td><input class="modalUserInfo" id="totalWage" size="12"
									readonly /></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" style="background-color: #6E6867;"
						class="btn btn-info" id="insReportBtn">등록</button>
					<button type="button" style="background-color: #6E6867;"
						class="btn btn-info updReportBtn" id="firModalDelBtn">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- second modal (상세 수정 화면) -->
<div class="modal fade" id="myModal3" data-backdrop="static"
	tabindex="3" aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content modal-lg">
			<form id="modalFrm" action="/insertPaymentReport" method="post">
				<div class="modal-header">
					<h4 class="modal-title">급여 내역 상세보기</h4>
					<button id="secondUpdClose1" type="button" class="close"
						data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="container"></div>
				<div class="modal-body">
					<div style="overflow: scroll; width: 100%; height: 380px;">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>급여 코드</th>
									<th>사원명</th>
									<th>급여액</th>
									<th>공제액</th>
								</tr>
							</thead>
							<tbody id="secondModalTbody">
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn" id="secondUpdClose">Close</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	for (var i = -5; i < 3; i++) {
		$("select[name=paydayYear]").append("<option value="+(new Date().getFullYear()+i)+">"
				+(new Date().getFullYear()+i)+"년</option>")
	}
	for (var i = 1; i <= 12; i++) {
		$("select[name=paydayMonth]").append("<option value="+(i)+">"+i+'월'+"</option>");
	}
	$("select[name=paydayYear]").val(new Date().getFullYear());
	$("select[name=paydayMonth]").val(new Date().getMonth()+1);
	datepicker();
	init();
});
function datepicker(){
		$(".datepicker").datepicker({
			dateFormat: 'yy-mm-dd' //Input Display Format 변경
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	            ,changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능                
	            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
        });                    
        //초기값을 오늘 날짜로 설정
		$('.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	
		// today 부분 기존 dd/MM/yyyy 포맷을 yy-mm-dd 로 바꿧기 때문에 2019-03-21 과 같은 db포맷과 같은 방식(한국형 포맷)으로 포맷팅되어있다.
	}
$("#insPaymentReport").click(function(){
	$(".updReportBtn,#updModalTr").hide();
	$("#insReportBtn,#insModalTr").show();
	getPaymentReportAjax();
})
function init(){
	$(".paymentDetail").click(function(){
		$(".datepicker").toggleClass('hasDatepicker');
		$("#insReportBtn,#insModalTr").hide();
		$(".updReportBtn,#updModalTr").show();
		$("input[name=paymentDate]").val($(this).data('payday'))
		$(".datepicker").val($(this).data('payday')).change();
	});
	$("#paymentDate").change(function(){
		getPaymentReportAjax();
	});
	$("#insReportBtn").click(function(){
		var check;
		$.ajax({
			method : "get",
			url : "/cogCheck",
			data : "paymentDate=" + $("#paymentDate").val(),
			async: false,
			success : function(data) {
				if(data<=0){
					check=true;
				}
				else{
					alert('이미 계산 되었습니다.');
				}
			}
		});
		if(check){
			$("#modalFrm").append("<input name=\'paymentDate\' value=\'"+$("#paymentDate").val()+"\'/>");
			$("#modalFrm").submit();	
		}
	});
}
function getPaymentReportAjax(){
	$.ajax({
		method : "get",
		url : "/getPaymentForAdjust",
		data : "payDay=" + $("#paymentDate").val(),
		success : function(data) {
			secondModalInput(data);
		}
	});
}
function secondModalInput(data){
	var dataText ;
	$("#secondModalTbody").html('');
			$("#totalSalary,#totalWage").val(0);
			for (var i = 0; i < data.paymentList.length; i++) {
				var vo = data.paymentList[i];
				$("#totalSalary").val(parseInt($("#totalSalary").val())
						+parseInt(vo.totalSalary));
				$("#totalWage").val(parseInt($("#totalWage").val())
						+parseInt(vo.totalWage));
				dataText+="<tr>"
				+"<td><input name =\'payCode\' type=\'hidden\' value=\'"+vo.payCode
				+"\' />"+vo.payCode+"</td>"
				+"<td>"+vo.usernm+"</td>"
				+"<td>"+Number(vo.totalSalary).toLocaleString()+"</td>"
				+"<td>"+Number(vo.totalWage).toLocaleString()+"</td>"
				+"</tr>";
			}
			$("#totalSalary,#totalWage").val(Number($("#totalSalary,#totalWage").val()).toLocaleString());
	$("#secondModalTbody").html(dataText);
	
}
$("#firModalDelBtn").click(function(){
	$("#firModalFrm").submit();
})	
</script>