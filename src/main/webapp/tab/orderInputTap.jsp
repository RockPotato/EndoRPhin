<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#searchProductText {
	width: 150px !important;
	display: inline !important;
}

.bootTapText {
	width: 200px !important;
	display: inline !important;
}

.quanText {
	width: 80px !important;
}
</style>

<div tabindex="1">
	<table class="table table-hover">
		<tr>
			<th>발주일(*)</th>
			<td><input class="form-control bootTapText dueDatePicker" name="dueDate"
				type='text' /></td>
			<th>발주내역(*)</th>
			<td><input class="form-control bootTapText" name="orderList"
				type='text' /></td>
		</tr>
		<tr>
			<th>부서</th>
			<td><input class="form-control bootTapText" name="deptCode"
				type='text' readonly />
				<button type="button" class="btn btn-default searchModal" value="0">
					<i class="fa fa-search"></i>
				</button></td>
			<th>담당자</th>
			<td><input class="form-control bootTapText" name="userId"
				type='text' readonly />
				<button type="button" class="btn btn-default searchModal" value="1">
					<i class="fa fa-search"></i>
				</button></td>
		</tr>
		<tr>
			<th>거래처</th>
			<td><input type="hidden" name="clientCode" />
			<input class="form-control bootTapText" name="clientname"
				type='text' readonly />
				<button type="button" class="btn btn-default searchModal" value="2">
					<i class="fa fa-search"></i>
				</button></td>
			<th>납기일</th>
			<td><input class="form-control bootTapText dueDatePicker"
				name="paymentDueDate" 
				type='text' /></td>
		</tr>
	</table>
</div>
<div>
	<button type="button" class="btn btn-default" id="addProduct">상품 주문</button>
</div>
<div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="modalCheckAll" /></th>
				<th>발주번호</th>
				<th>상품명</th>
				<th>규격</th>
				<th>수량</th>
				<th>단가</th>
				<th>공급가액</th>
			</tr>
		</thead>
		<tbody id="dialogProductTbody">
		</tbody>
	</table>
</div>
<div>
	<button type="button" class="btn btn-default" id="delProductByCheck">선택 삭제</button>
	<div style='float: right;'>
		<label>공급가액</label> <input class="form-control bootTapText"
			name="orderPrice" type='text' readonly /> <label>부가세</label> <input
			class="form-control bootTapText" name="surtax" type='text' readonly />
		<label>합계</label> <input class="form-control bootTapText" type='text'
			name="totalPrice" readonly />
	</div>
</div>

<!-- second modal (상세 수정 화면) -->
<div class="modal" id="myModal3" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog">
		<div class="modal-content" style="max-width: 100% !important;">
			<div class="modal-header">
				<h4 class="modal-title" id="secondModalTitle"></h4>
				<button id="secondUpdClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="container"></div>
			<div class="modal-body">
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table class="table table-hover table-sm">
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

<!-- second modal (상세 등록 화면) -->
<div class="modal" id="myModal4" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="secondModalTitle"></h4>
				<button id="secondAddClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="container"></div>
			<div class="modal-body">
				<section>
					<h3>상품 등록</h3>
					<input type="text" class="search-query form-control"
						id="searchProductText" placeholder="Search.." />
					<button type="button" class="btn btn-default" id="searchProductBtn">
						<i class="fa fa-search"></i>
					</button>
				</section>
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table class="table table-hover table-sm">
						<thead>
							<tr>
								<th>항목코드</th>
								<th>항목명</th>
								<th>규격</th>
								<th>기본 금액</th>
							</tr>
						</thead>
						<tbody id="secondModalTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
			</div>
		</div>
	</div>
</div>

<script>

$(document).ready(function(){
	$("input").attr("autocomplete","off");
	$("#delProductByCheck").click(function(){
		$("input[class=detailCheck]:checked").each(function(){
			
			$(this).parents('td').parents('tr').remove();
		});
	});
	
	
	
	$("#searchProductBtn, #addProduct").click(function(){
		$.ajax({
			method : "post",
			url : "/orders/searchProduct",
			data : {
				productName : $("#searchProductText").val()
			},
			success : function(data) {
				$("#secondModalTbody").html('');
				for (var i = 0; i < data.productList.length; i++) {
					$("#secondModalTbody").append("<tr class=\'productTr\'>"
					+"<td>"+data.productList[i].productCode+"</td>"
					+"<td>"+data.productList[i].productName+"</td>"
					+"<td>"+data.productList[i].standard+"</td>"
					+"<td>"+data.productList[i].basePrice+"</td>"
					+"<tr>");
				}
				productTrInput();
			}
		});
	})
	function productTrInput(){
		$(".productTr").off('click');
		$(".productTr").on('click',function(index,item){
			var item=$(this);
			var check=true;
			$(".dialogPdcd").each(function(){
				if($(this).html()==$(item).children('td').eq(0).html()){
					alert('이미 존재하는 상품입니다.');
					check=false;
				}
			});
			if(check){
				var temp;			
				for (var i = 1; i < 3; i++) {
					temp+="<td>"+item.children('td').eq(i).html()+"</td>";}
				$("#dialogProductTbody").append("<tr>"
				+"<td><input type=\'checkbox\' class=\'detailCheck\'></td>"
				+"<td class=\'dialogPdcd\'>"+
												"<input type=\'hidden\' name=\'productCode\' value="+
													item.children('td').eq(0).html()+" />"+item.children('td').eq(0).html()+"</td>"
				+temp+"<td>"+"<input name=\'quantity\' type=\'text\' class=\'form-control quanText\' value=0 />"+"</td>"
				+"<td class=\'baseprice\'>"+item.children('td').eq(3).html()+"</td>"
				+"<td class=\'totalPrice\'>"+0+"</td>");
			}
			numChange();
			$("#myModal4").modal('hide');
		});
	}
	$("#addProduct").click(function(){
		$("#myModal4").modal('show');
	});
	surtaxChange();	
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
	$(".searchModal").click(function(index, item){
		var check = $(this).val();
		$.ajax({
			method : "post",
			url : "/orders/selectModal",
			data : {
				check : $(this).val()
			},
			success : function(data) {
				$("#secondModalUpdTbody").html("");
				switch (check) {
					case '0':
						for (var i = 0; i < data.deptList.length; i++) {
							$("#secondModalUpdTbody").append("<tr class=\'selectDept\'>"
							+"<td>"+data.deptList[i].deptCode+"</td>"
							+"<td>"+data.deptList[i].deptName+"</td>"
							+"</tr>");
						}
						break;
					case '1':
						for (var i = 0; i < data.employeeList.length; i++) {
							$("#secondModalUpdTbody").append("<tr class=\'selectEmployee\'>"
							+"<td>"+data.employeeList[i].userId+"</td>"
							+"<td>"+data.employeeList[i].userNm+"</td>"
							+"<tr>");
						}
						break;
					case '2':
						for (var i = 0; i < data.clientList.length; i++) {
							$("#secondModalUpdTbody").append("<tr class=\'selectClient\'>"+
							"<td>"+data.clientList[i].clientCode+"</td>"+
							"<td>"+data.clientList[i].clientName+"</td>"+
							"<tr>");
						}
						break;
				}
				modalClickEvent();
			}
		});
		$("#myModal3").modal('show');
	})
});

function modalClickEvent(){
	$(".selectDept, .selectEmployee, .selectClient").click(function(){
		switch ($(this).attr('class')) {
			case 'selectDept':
				$('input[name=deptCode]').eq(1).val($(this).find('td').eq(0).html());
				break;
			case 'selectEmployee':
				$('input[name=userId]').val($(this).find('td').eq(0).html());
				break;
			case 'selectClient':
				$('input[name=clientCode]').eq(1).val($(this).find('td').eq(0).html());
				$('input[name=clientname]').val($(this).find('td').eq(1).html());
				break;
		}
		$("#myModal3").modal('hide');
	});
}

function surtaxChange(){
	$("input[name=orderPrice]").on('change',function(){
       	$("input[name=surtax]").val(parseInt($("input[name=orderPrice]").val())/10);
       	$("input[name=totalPrice]").val(Number($("input[name=surtax]").val())+
       			Number($("input[name=orderPrice]").val())).change();
	});
}

</script>