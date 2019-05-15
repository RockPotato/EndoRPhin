<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style type="text/css">
.thead2 {
	color: white;
	background-color: #997149;
	text-align: center;
}
.input-sm{
	width:100%;
	height : 35px;
	font-size: 15px;
}
.wi4{
	width:400px;
}
.font6{
	font-size: 6px !important;
}
</style>
</head>
<center>
	<form action="/insertSlip" method="post" id="insertInputFrm">
		<table class="table table-sm">
			<thead class="thead2">
				<tr>
					<th>작성일(*)</th>
					<th>차대변(*)</th>
					<th colspan="2">계정과목(*)</th>
					<th>사용부서</th>
					<th colspan="2">거래처/카드(*)</th>
					<th>메모</th>
					<th colspan="2">금액</th>
				</tr>
			</thead>
			<tbody class="form-group">
				<tr>
					<td><input name="slipDateStr" class="form-control input-sm"
						type="text" id="insertSlipDate" readonly></td>

					<td><select id="status4Temparary" class="form-control input-sm">
							<option value="0" selected="selected">차변</option>
							<option value="1">대변</option>
					</select></td>
					<!-- Establish -->
					<td colspan="2">
						<div class="input-group">
							<input type="text" id="searchEstablishValue" class="form-control input-sm"
							name="searchEstablishValue" readonly />
							<input type="button" id="searchEstablish_btn" value="검색" 
							class="bttn-simple bttn-sm bttn-warning" 
							data-toggle="modal" data-target="#searchEstablish_modal" />
						</div>
					</td>

					<td><select id="dept4Temparary" class="form-control input-sm">
							<option value="미등록" selected="selected">-------</option>
							<c:forEach items="${deptList }" var="dept">
								<option value="${dept.deptName }">${dept.deptName }</option>
							</c:forEach>
					</select></td>
					<!-- Client -->
					<td colspan="2">
						<div class="input-group">
							<input type="text" id="searchClientValue" class="form-control input-sm"
								name="searchClientValue" readonly />
							<input type="button" class="bttn-simple bttn-sm bttn-warning" 
								id="searchClient_btn2" value="검색"
							data-toggle="modal" data-target="#searchClient_modal"/>
						</div></td>

					<td><input class="form-control input-sm" id="juckyo" name="juckyo" type="text" /></td>
					<td><input class="form-control input-sm" id="searchPriceValue" type="text" /></td>
					<td><button class="bttn-slant bttn-warning" id="temporaryAddition" type="button">등록</button></td>
					
				</tr>
			</tbody>
		</table>
		<table class="table table-sm">
			<thead class="thead">
				<tr>
					<td>날짜</td>
					<td>구분</td>
					<td>계정과목</td>
					<td>거래처</td>
					<td>부서</td>
					<td>메모</td>
					<td colspan="2">금액</td>
				</tr>
			</thead>
			<tbody id="temporaryArea">

			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" style="text-align: right; font-weight: bold;"
						id="leftVale"></td>
					<td style="font-weight: bold; text-align: center;" id="rightVale"></td>
					<td><button type="button" class="bttn-slant bttn-sm bttn-warning" id="insertOnlySlip">작성</button></td>
				</tr>
			</tfoot>
		</table>
	</form>
</center>


<!-- Search Establish Modal Window  -->
<div class="modal modal-center fade" id="searchEstablish_modal"
	tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">계정과목 검색</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="input-group wi4">
					<label for="InputEmail">계정과과목 코드&nbsp;&nbsp;&nbsp;</label> <input
						type="text" id="searchEstablishValue2" class="form-control input-sm"
						name="searchEstablishValue2" /> <input type="button"
						class="bttn-bordered bttn-sm bttn-primary" id="searchDataBtn" name="searchDataBtn"
						value="검색" />
				</div>

				<div class="input-group wi4">
					<label for="InputEmail">현재선택된 코드&nbsp;&nbsp;&nbsp;</label> <input
						type="text" id="selectEstablishValue" name="selectEstablishValue" class="form-control input-sm"
						readonly />
					<button type="button" class="bttn-bordered bttn-sm bttn-primary" 
							id="ok_btn" data-dismiss="modal">확인</button>
				</div>

				<div id="searchDataArea"></div>
			</div>
			<div class="modal-footer"></div>

		</div>
	</div>
</div>



<!-- Search Client Modal Window  -->
<div class="modal modal-center fade" id="searchClient_modal"
	tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">거래처 검색</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="input-group wi4">
					<label for="InputEmail">거래처명</label>
					<input type="text" id="searchClientValue2" class="form-control input-sm"
						name="searchClientValue2" /> <input type="button"
						class="bttn-bordered bttn-sm bttn-primary" id="searchDataBtn2" name="searchDataBtn2"
						value="검색" />
				</div>
				<div class="input-group wi4">
					<label for="InputEmail">선택한 거래처&nbsp;&nbsp;&nbsp;</label> <input
						type="text" id="selectClientValue" name="selectClientValue" class="form-control input-sm"
						readonly />
					<button type="button" class="bttn-bordered bttn-sm bttn-primary" id="ok_btn2"
						 data-dismiss="modal">확인</button>
				</div>
				<div id="searchDataArea2"></div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>


<script>
$("document").ready(function() {
    var nowDay = new Date();
    var month;
    if (nowDay.getMonth() >= 9)
        month = (nowDay.getMonth() + 1);
    else
        month = "0" + (nowDay.getMonth() + 1);
    $('#insertSlipDate').val(nowDay.getFullYear() + "-" + month +
        "-" + nowDay.getDate()); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
});


/* 계정과목 검색 기능 */
$("#searchEstablishValue").keydown(function(key) {
    if (key.keyCode == 13) {
        $("#searchEstablish_btn").click();
        $("#searchEstablishValue2").focus();
    }
});

$("#searchEstablishValue").dblclick(function() {
    $("#searchEstablish_btn").click();
    $("#searchEstablishValue2").focus();
});

$("#searchEstablishValue2").keydown(function(key) {
    if (key.keyCode == 13) {
        $("#searchDataBtn").click();
        $("#searchEstablishValue2").focus();
    }
});


$("#searchEstablish_btn").on("click", function() {
    $("#searchEstablishValue2").val($("#searchEstablishValue").val());
    $("#searchDataBtn").click();
    $("#searchEstablishValue2").focus();
    $("#searchDataArea").html("");


});

$("#searchDataBtn").on("click", function() {
    $("#searchEstablishValue2").focus();
    $.ajax({
        url: "${pageContext.request.contextPath }/establishSearchUseSlip",
        data: "searchEstablishValue2=" + $("#searchEstablishValue2").val(),
        success: function(data) {
            console.log(data);
            $("#searchDataArea").html(data);
            $("#searchEstablishValue2").focus();
        }
    });

});


/* 거래처 검색 기능 */
$("#searchClientValue").keydown(function(key) {
    if (key.keyCode == 13) {
        $("#searchClient_btn2").click();
        $("#searchClientValue2").focus();
    }
});

$("#searchClientValue").dblclick(function() {
    $("#searchClient_btn2").click();
    $("#searchClientValue2").focus();
});

$("#searchClientValue2").keydown(function(key) {
    if (key.keyCode == 13) {
        $("#searchDataBtn2").click();
        $("#searchClientValue2").focus();
    }
});


$("#searchClient_btn2").on("click", function() {
    $("#searchClientValue2").val($("#searchClientValue").val());
    $("#searchDataBtn2").click();
    $("#searchClientValue2").focus();
    $("#searchDataArea2").html("");


});

$("#searchDataBtn2").on("click", function() {
    $("#searchClienthValue2").focus();
    $.ajax({
        url: "${pageContext.request.contextPath }/ClientSearchUseSlip",
        data: "searchClientValue2=" + $("#searchClientValue2").val(),
        success: function(data2) {
            console.log(data2);
            $("#searchDataArea2").html(data2);
            $("#searchClientValue2").focus();

        }
    });

});


$("#temporaryAddition").on("click", function() {
    if ($.isNumeric($("#searchPriceValue").val())) {
        $.ajax({
            url: "${pageContext.request.contextPath }/insertDetailSlip",
            data: "status=" + $("#status4Temparary").val() +
                "&price=" + $("#searchPriceValue").val() +
                "&juckyo=" + $("#juckyo").val() +
                "&dept=" + $("#dept4Temparary").val() +
                "&slipDate=" + $("#insertSlipDate").val() +
                "&establish=" + $("#searchEstablishValue").val() +
                "&client=" + $("#searchClientValue").val(),
            success: function(data) {
                $("#temporaryArea").append(data);
                totalSum();
            }

        });
        // 입력영역 값 초기화
        $("#searchEstablishValue").val("");
        $("#searchClientValue").val("");
        $("#juckyo").val("");
        $("#searchPriceValue").val("");
    } else {
        alert("잘못된 값을 입력하셨습니다.");
    }
});


// 작성 버튼
$("#insertOnlySlip").on("click", function() {
    var le = $("#leftVale").text();
    var ri = $("#rightVale").text();

    le = le.split(":");
    ri = ri.split(":");


    if (le[1] != ri[1]) {
        alert("차변/대변 금액이 일치하지 않습니다.");
    }else if(le==''&&ri==''){
    	alert("상세 내역을 입력하세요.");
    }
    else {
        // 전표 입력 실행
        $("#insertInputFrm").submit();
    }
});

function totalSum() {
    var leftSum = 0;
    var rightSum = 0;
    //차변합계
    $(".left").each(function() {
        leftSum += parseInt($(this).val());
    });
    $("#leftVale").text("차변합계 : " + leftSum);

    //대변합계
    $(".right").each(function() {
        rightSum += parseInt($(this).val());
    });

    $("#rightVale").text("대변합계 : " + rightSum);
}
</script>
