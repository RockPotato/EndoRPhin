<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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
		<h3>
			<i class="fa fa-calculator"></i>발주 현황
		</h3>
		<form action="/orders/currentOrder" id="searchFrm" method="get">
			<div class="search-group">
				<table>
					<tr>
						<td>
							<div class="input-group mb-3">
								<span class="input-group-text">날짜별</span> <input type="text"
									class="search-query form-control dueDatePicker" name="preDate"
									placeholder="Search" value="${ordersVo.preDate}" /> <span
									class="input-group-text"><i class="fa fa-wave-square"></i></span>
								<input type="text"
									class="search-query form-control dueDatePicker" name="postDate"
									placeholder="Search" value="${ordersVo.postDate}" />
							</div>
						</td>
						<td><div class="input-group mb-3">
								<span class="input-group-text">거래처명</span> <input type="text"
									class="search-query form-control" id="searchClient"
									name="clientCode" placeholder="Search" />
								<button type="button" class="bttn-md bttn-warning btn4Search">
									<i class="fa fa-search"></i>
								</button>
							</div></td>
					</tr>
					<tr>
						<td><div class="input-group mb-3">
								<span class="input-group-text">부서명</span> <input type="text"
									class="search-query form-control" id="searchDept"
									name="deptCode" placeholder="Search" />
								<button type="button" class="bttn-md bttn-warning btn4Search">
									<i class="fa fa-search"></i>
								</button>

								<button class="bttn-fill bttn-md bttn-warning" type="button"
									style="margin-left: 50px;" id="searchBtn">검색</button>
							</div></td>
					</tr>
				</table>
			</div>
		</form>
		<form action="" id="deleteFrm" method="post">
			<input type="hidden" name="deprostatus" value="2" />
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>구분</th>
							<th>발주번호</th>
							<th>발주일</th>
							<th>납기일</th>
							<th>거래처명</th>
							<th>내역</th>
							<th>입고액</th>
							<th>발주금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="vo">
							<tr>
								<td><input type="checkbox" class="check"></td>
								<td>${vo.sortation}</td>
								<td><a
									class="bttn-stretch bttn-md bttn-warning orderDialog">${vo.orderCode}</a></td>
								<td>${vo.dueDate}</td>
								<td>${vo.paymentDueDate}</td>
								<td>${vo.clientname}</td>
								<td>${vo.orderList}</td>
								<td><fmt:formatNumber value="${vo.receivepay}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${vo.orderPrice}" pattern="#,###" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<form action="/currentOrderExceldown" id="excelDownFrm">
					<button style="margin-left: 705px; background-color: #6E6867;"
						class="btn btn-info">Excel</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 상세조회 모달창 -->
<div class="dialog">
	<span class="dialog__close">&#x2715;</span> <h4>발주서
		상세</h4>
	<div class="modal-body">
		<form action="/orders/deleteOrder" method="post" id="dialogFrm">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<div>
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#orderDetail"
							aria-controls="uploadTab" role="tab" data-toggle="tab"
							class="tabControl active">발주 상세</a></li>
						<li role="presentation"><a href="#orderslist"
							aria-controls="browseTab" role="tab" data-toggle="tab"
							class="tabControl">발주 품목</a></li>
						<li role="presentation"><a href="#receiveList"
							aria-controls="browseTab" role="tab" data-toggle="tab"
							class="tabControl">입고 현황</a></li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane" id="orderDetail">
						<table class="table table-hover">
							<tr>
								<th>발주일(*)</th>
								<td><input class="form-control bootTapText dueDatePicker"
									name="dueDate" type='text' readonly /></td>
								<th>발주내역(*)</th>
								<td><input class="form-control bootTapText"
									name="orderList" type='text' readonly /></td>
							</tr>
							<tr>
								<th>부서</th>
								<td><input class="form-control bootTapText" name="deptCode"
									type='text' readonly /></td>
								<th>담당자</th>
								<td><input class="form-control bootTapText" name="userId"
									type='text' readonly /></td>
							</tr>
							<tr>
								<th>거래처</th>
								<td><input type="hidden" name="clientCode" /> <input
									class="form-control bootTapText" name="clientname" type='text'
									readonly /></td>
								<th>납기일</th>
								<td><input class="form-control bootTapText dueDatePicker"
									name="paymentDueDate" type='text' readonly /></td>
							</tr>
						</table>
					</div>
					<div role="tabpanel" class="tab-pane" id="orderslist"></div>
					<div role="tabpanel" class="tab-pane" id="receiveList"></div>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- second modal (상세 수정 화면) -->
<div class="modal fade" id="myModal3" data-backdrop="static"
	tabindex="3" aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog">
		<div class="modal-content" style="max-width: 100% !important;">
			<div class="modal-header modalSketchedHeader">
				<h4 class="modal-title" id="secondModalTitle">항목 선택</h4>
				<button id="secondUpdClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="container"></div>
			<div class="modal-body">
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>항목코드</th>
								<th>항목명</th>
							</tr>
						</thead>
						<tbody id="secondModalUpdTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn" id="secondUpdClose">Close</a>
			</div>
		</div>
	</div>
</div>

<script>
function dialog(){
	$(".orderDialog").click(function(e){
		$(".tabControl").show();
		$(".tab-pane").eq(0).toggleClass("active");
		$(".dialog").toggleClass('dialog--active');
		$.ajax({
			method : "post",
			url : "/orders/selectOrder",
			data :{
				orderCode : $(this).html(),
				check : true
			},
			success : function(data) {
				inputData(data);
			}
		});
	});
	
	$('.dialog__close').on('click', function() {
		$(".dialog").removeClass('dialog--active');
		$(".tab-pane").removeClass('active show');
	});

	$(document).keyup(function(e) {
		if (e.keyCode === 27) {
			$(".dialog").removeClass('dialog--active');
			$(".tab-pane").removeClass('active show');
		}
	});
}
function inputData(data){
	$("input[name=dueDate]").val(data.orderVo.dueDate);
	$("input[name=orderList]").val(data.orderVo.orderList);
	$("input[name=deptCode]").val(data.orderVo.deptCode);
	$("input[name=userId]").val(data.orderVo.userId);
	$("input[name=clientname]").val(data.orderVo.clientname);
	$("input[name=paymentDueDate]").val(data.orderVo.paymentDueDate);
	var ordersList = '<table class=\'table table-hover\'>';
	ordersList+='<tr><th>발주번호</th><th>상품명</th><th>규격</th><th>수량</th><th>단가</th><th>공급가액</th></tr>';
	for (var i = 0; i < data.detailList.length; i++) {
		var tempDetail=data.detailList[i];
		ordersList+="<tr>"
		+"<td>"+tempDetail.orderCode+"</td>"
		+"<td>"+tempDetail.productname+"</td>"
		+"<td>"+tempDetail.standard+"</td>"
		+"<td>"+tempDetail.quantity+"</td>"
		+"<td>"+Number(tempDetail.baseprice).toLocaleString()+"</td>"
		+"<td>"+Number(tempDetail.baseprice*tempDetail.quantity).toLocaleString()+"</td>"
		+"</tr>";
	}
	ordersList +='</table>';
	$("#orderslist").html(ordersList);
	receiveInput(data);
}
function receiveInput(data){
	var receiveText='<table class=\'table table-hover\'>';
	receiveText +='<tr><th>입고번호</th><th>입고일</th><th>창고명</th><th>품목</th><th>수량</th><th>입고액</th></tr>';
	for (var i = 0; i < data.receiveDetail.allReceive.length; i++) {
		if(data.receiveDetail.allReceive[i].sortation==0){
			for (var j = 0; j < data.receiveDetail.allReceiveDetail[i].length; j++) {
				var ard = data.receiveDetail.allReceiveDetail[i][j];
				receiveText+='<tr>'
				+'<td>'+ard.receiveCode+'</td>'
				+'<td>'+data.receiveDetail.allReceive[i].receiveDate+'</td>'
				+'<td>'+data.receiveDetail.allReceive[i].warehousename+'</td>'
				+'<td>'+ard.productname+'</td>'
				+'<td>'+ard.quantity+'</td>'
				+'<td>'+Number(ard.baseprice*ard.quantity).toLocaleString()+'</td>'
				+'</tr>';
			}
		}
	}
	receiveText+="</table>";
	$('#receiveList').html(receiveText);
}
$(document).ready(function(){
	dialog();
	$(".dueDatePicker").datepicker({
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
	$("#searchFrm").find('input').each(function(){
		if($(this).val()!=''){
			$("#excelDownFrm").append("<input type=\'hidden\' name=\'"+
					$(this).prop('name')+"\' value=\'"+$(this).val()+"\'/>");
		}
	})
})
$(".btn4Search").click(function(){
		var check;
		if($(".btn4Search")[0]==this)
			check='2';
		else
			check='0';
		$.ajax({
			method : "post",
			url : "/orders/selectModal",
			data : {
				check : check
			},
			success : function(data) {
				$("#secondModalUpdTbody").html("");
				if(check=='2'){
					for (var i = 0; i < data.clientList.length; i++) {
						$("#secondModalUpdTbody").append("<tr class=\'selectClient\'>"+
						"<td>"+data.clientList[i].clientCode+"</td>"+
						"<td>"+data.clientList[i].clientName+"</td>"+
						"<tr>");
					}
				}
				else{
					for (var i = 0; i < data.deptList.length; i++) {
						$("#secondModalUpdTbody").append("<tr class=\'selectDept\'>"
						+"<td>"+data.deptList[i].deptCode+"</td>"
						+"<td>"+data.deptList[i].deptName+"</td>"
						+"</tr>");
					}
				}
				modalClickEvent4Search();
			}
		});
		$("#myModal3").modal('show');
	});
	function modalClickEvent4Search(){
		$(".selectDept, .selectClient").click(function(){
			switch ($(this).attr('class')) {
				case 'selectDept':
					$('#searchDept').val($(this).find('td').eq(0).html());
					break;
				case 'selectClient':
					$('#searchClient').val($(this).find('td').eq(0).html());
					break;
			}
			$("#myModal3").modal('hide');
		});
	}
	$("#searchBtn").click(function(){
		if($("input[name=preDate]").val().length>0&&
				$("input[name=postDate]").val()==''){
			alert('날짜가 올바르게 선택되지 않았습니다.');
			$("input[name=preDate]").val('');
		}
		$("#searchFrm").submit();
	});
</script>