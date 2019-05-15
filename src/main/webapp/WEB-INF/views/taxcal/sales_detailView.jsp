<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4>전표 상세내역</h4>
<table border="1">
	<thead class="thead">
		<tr>
			<td>구분</td>
			<td>계정</td>
			<td>적요</td>
			<td>차변</td>
			<td>대변</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${sales_detailList }" var="list">
			<tr class="sales_detailTr" data-salescode="${list.salesCode }"
				data-status="${list.status }"
				data-establishcode="${list.establishCode }"
				data-jukyo="${list.jukyo }" data-price="${list.price }"
				data-salesdetailcode="${list.salesDetailCode }">

				<td><select class="form-control" disabled="disabled">
						<option value="차변">차변</option>
						<c:choose>
							<c:when test="${list.status eq '대변'}">
								<option value="대변" selected>대변</option>
							</c:when>
							<c:otherwise>
								<option value="대변">대변</option>
							</c:otherwise>
						</c:choose>
				</select></td>
				<td><input class="form-control-sm" type="text"
					value="${list.establishCode }" /></td>
				<td><input class="form-control-sm" type="text"
					value="${list.jukyo }" /></td>
				<c:choose>
					<c:when test="${list.status eq '차변' }">
						<td><input class="form-control-sm leftPrice" type="text"
							value='<fmt:formatNumber value="${list.price }" pattern="#,###" />'
							onchange="javascript:fn_setSum()" /></td>
						<td></td>
					</c:when>
					<c:otherwise>
						<td></td>
						<td><input class="form-control-sm rightPrice" type="text"
							value='<fmt:formatNumber value="${list.price }" pattern="#,###" />'
							onchange="javascript:fn_setSum()" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>

		<tr style="background-color: #E6E6E6;">
			<td colspan="3"><b>합계</b></td>
			<td><b><input class="form-control-sm"
					style="text-decoration: underline;" id="leftSum" type="text"
					readonly /></b></td>
			<td><b><input class="form-control-sm"
					style="text-decoration: underline;" id="rightSum" type="text"
					readonly /></b></td>
		</tr>
	</tbody>
</table>
<br>
<input class="bttn-unite bttn-sm bttn-warning" id="salesDetailUpdateBtn"
	type="button" value="수정" />
<input class="bttn-unite bttn-sm bttn-warning" id="salesDetailDeleteBtn"
	type="button" value="삭제" />
<input class="bttn-unite bttn-sm bttn-warning" id="closeBtn"
	type="button" value="닫기" />

<script>
//화면 로딩 소스
$("document").ready(function() {
    fn_setSum();
});


// 닫기 버튼 클릭
$("#closeBtn").on("click", function() {
    fn_closeBtn();
});


// 수정 버튼 클릭
$("#salesDetailUpdateBtn").on("click", function() {
    fn_updateBtn();
});


// 삭제 버튼 클릭
$("#salesDetailDeleteBtn").on("click", function() {
    fn_deleteBtn();
});




//function

/*****************************수정버튼***************************/
function fn_updateBtn() {

    // 차변합계 대변합계 일치할 경우 수정로직 실행
    if ($("#leftSum").val() == $("#rightSum").val()) {
        var salesCode = $(".sales_detailTr").data().salescode;

        $(".sales_detailTr").each(function() {
            var salesDetailCode = $(this).data().salesdetailcode;
            var status = $(this).children().eq(0).children().val();
            var establishCode = $(this).children().eq(1).children().val();
            var jukyo = $(this).children().eq(2).children().val();
            var price = "";

            if (status == "차변") {
                price = $(this).children().eq(3).children().val();
            } else {
                price = $(this).children().eq(4).children().val();
            }
            fn_updateAjax(salesCode, salesDetailCode, status, establishCode, jukyo, price);

        });



        // 차변합계 대변합계 일치하지 않을 경우 에러메세지 발생
    } else {
        alert("차변과 대변의 금액이 일치하지 않습니다. 확인 후 수정해주세요.");
    }
}


/*****************************취소버튼***************************/
function fn_closeBtn() {
    $("#detailViewArea").html("");
}




/**********************차변, 대변 합계 구하기**********************/
function fn_setSum() {

    var leftSum = 0;
    var rightSum = 0;

    //차변 구하기
    $(".leftPrice").each(function() {
        var left = $(this).val().replace(/,/gi, "");
        if ($(this).val() == '')
            left = 0;
        leftSum += parseInt(left);
        fn_setSumLeftValue(leftSum);

    });
    //대변 구하기
    $(".rightPrice").each(function() {
        var right = $(this).val().replace(/,/gi, "");
        if ($(this).val() == '')
            right = 0;
        rightSum += parseInt(right);
        fn_setSumRightValue(rightSum);

    });
}


/********************** 세자리 단위 콤마 설정하기( 차변 )**********************/
function fn_setSumLeftValue(setLeftSum) {
    setLeftSum = numberWithCommas(setLeftSum);
    $("#leftSum").val(setLeftSum);
}




/********************** 세자리 단위 콤마 설정하기( 대변 )**********************/
function fn_setSumRightValue(setRightSum) {
    setRightSum = numberWithCommas(setRightSum);
    $("#rightSum").val(setRightSum);
}




/********************** 세자리 단위 콤마 설정하기**********************/
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}




/********************** 상세전표 수정 Ajax**********************/
function fn_updateAjax(salesCode, salesDetailCode, status, establishCode, jukyo, price) {

    var sumPrice = $("#leftSum").val();

    $.ajax({
        url: "${pageContext.request.contextPath }/updateSales_detail",
        data: "salesCode=" + salesCode +
            "&salesDetailCode=" + salesDetailCode +
            "&status=" + status +
            "&establishCode=" + establishCode +
            "&jukyo=" + jukyo +
            "&price=" + price +
            "&sumPrice=" + sumPrice,
        success: function(data) {
            location.reload();
        }

    });
}

/********************** 전표 삭제 **********************/
function fn_deleteBtn() {

    var salesCode = $(".sales_detailTr").data().salescode;


    var check = confirm("삭제된 데이터는 복구가 불가능합니다. 삭제 하시겠습니까?");
    if (check) {
        // 삭제처리
        $.ajax({
            url: "${pageContext.request.contextPath }/deletetax_cal",
            data: "salesCode=" + salesCode,
            success: function(data) {

                location.reload();
            }
        });

    } else {
        alert("삭제를 취소하였습니다.");
    }
}
</script>