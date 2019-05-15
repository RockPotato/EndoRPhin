<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i> 급여 등록</h2>
		<form action="/addPayment" id="searchFrm">
			<table>
				<tr>
					<td>사원명 검색 :</td>
					<td><input type="text" class="search-query form-control"
						id="searchPay" name="searchPaymentName" placeholder="Search" /></td>
					<td>
						<button class="bttn-fill bttn-md bttn-warning" type="button"
							id="searchBtn">
							<span class=" glyphicon glyphicon-search">검색</span>
						</button>
					</td>
				</tr>
			</table>
		</form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>사원번호</th>
					<th>직급명</th>
					<th>사원명</th>
					<th>부서명</th>
					<th>총급여액</th>
					<th>총공제액</th>
					<th>입사일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${paymentList}" var="vo">
					<tr class="payTr" data-userid="${vo.userId }">
						<td><a href="#detailLayer" data-toggle="modal"
							data-target="#my80sizeModal"
							class="bttn-stretch bttn-md bttn-warning paymentDetail">${vo.userId}</a></td>
						<c:set var="totalSalarysum"
							value="${totalSalarysum+vo.totalSalary}" />
						<c:set var="totalWagesum" value="${totalWagesum+vo.totalWage}" />
						<td>${vo.positionname}</td>
						<td>${vo.usernm}</td>
						<td>${vo.deptname}</td>
						<td><fmt:formatNumber value="${vo.totalSalary }" pattern="#,###" /></td>
						<td><fmt:formatNumber value="${vo.totalWage }" pattern="#,###" /></td>
						<td>${vo.joincompany}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot align="center">
				<tr>
					<td>계</td>
					<td>총 급여 :</td>
					<td colspan="2"><fmt:formatNumber value="${totalSalarysum }" pattern="#,###" /></td>
					<td>총 공제 :</td>
					<td colspan="2"><fmt:formatNumber value="${totalWagesum }" pattern="#,###" /></td>
				</tr>
			</tfoot>
		</table>
		<c:set var="lastPage"
			value="${Integer(paymentCnt/pageSize + (paymentCnt%pageSize > 0 ? 1 : 0))}" />
		<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		<c:choose>
			<c:when test="${page == 1 }">
				<li class="disabled"><a class="bttn-minimal bttn-md bttn-warning" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/addPayment" aria-label="Previous" class="bttn-minimal bttn-md bttn-warning">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="1" end="${lastPage }" var="i">
			<c:set var="active" value="" />
			<c:if test="${i == page }">
				<c:set var="active" value="active" />
			</c:if>
		
			<li class="${active }"><a class="bttn-minimal bttn-md bttn-warning"
				href="/addPayment?page=${i}">${i}</a></li>
		</c:forEach>
		
		
		<c:choose>
			<c:when test="${page == lastPage }">
				<li class="disabled"><a class="bttn-minimal bttn-md bttn-warning" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li><a class="bttn-minimal bttn-md bttn-warning" href="/addPayment?page=${lastPage}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
		</nav>
	</div>
</div>

<!-- 80% size Modal  등록 모달 창-->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog"
	aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-lg">
			<div class="modal-header modalSketchedHeader">
				<h4 class="modal-title" id="myModalLabel">급여 등록</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<table class="table table-hover" style="font-size: 5px">
						<tr>
							<th><label>사번</label></th>
							<td><input class="form-control modalUserInfo" readonly="readonly"
								size="12" /></td>
							<th><label>직급</label></th>
							<td><input class="form-control modalUserInfo" readonly="readonly"
								size="12" /></td>
							<th><label>이름</label></th>
							<td><input class="form-control modalUserInfo" readonly="readonly"
								size="12" /></td>
							<th><label>부서</label></th>
							<td><input class="form-control modalUserInfo" readonly="readonly"
								size="12" /></td>
						</tr>
					</table>
				</div>

				<div class="form-group">
					<label for="InputEmail">급여내역</label>
					<div style="overflow: scroll; width: 750px; height: 200px;">
						<table class="table table-hover">
							<thead>
								<tr id="firModalProductThead">
								</tr>
							</thead>
							<tbody id="firModalProductTbody">

							</tbody>
						</table>
					</div>
					<a data-toggle="modal" href="#myModal4"
						class="bttn-simple bttn-warning" id="modalAddProduct">급여 등록</a>
				</div>

				<div class="form-group">
					<label for="InputEmail">공제내역</label>
					<div style="overflow: scroll; width: 750px; height: 200px;">
						<table class="table table-hover">
							<thead>
								<tr id="firModalDeductThead">
									<th>공제일</th>
								</tr>
							</thead>
							<tbody id="firModalDeductTbody">

							</tbody>
						</table>
					</div>
					<a data-toggle="modal" href="#myModal4"
						class="bttn-simple bttn-warning" id="modalAddDeduct">공제 등록</a>
				</div>
				<div class="form-group">
					<label for="InputEmail">원천징수내역</label>
					<div style="overflow: scroll; width: 750px; height: 200px;">
						<table class="table table-hover">
							<thead>
								<tr id="firModalWithholdThead">
									<th>공제일</th>
								</tr>
							</thead>
							<tbody id="firModalWithholdTbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- second modal (상세 등록 화면) -->
<div class="modal fade" id="myModal4" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="secondModalTitle"></h4>
				<button id="secondAddClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="container"></div>
			<div class="modal-body">
				<h3>작성일</h3>
				<input type="text" id="datepicker">
				<div style="overflow: scroll; width: 100%; height: 400px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>항목코드</th>
								<th>항목명</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody id="secondModalTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
				<a href="#" class="btn" id="secondModalAddSave">등록</a>
			</div>
		</div>
	</div>
</div>

<!-- second modal (상세 수정 화면) -->
<div class="modal fade" id="myModal3" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="secondModalTitle"></h4>
				<button id="secondUpdClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
					
			</div>
			<div class="container"></div>
			<div class="modal-body">
				<h3>작성일</h3>
				<input type="text" id="datepicker1">
				<div style="overflow: scroll; width: 100%; height: 400px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>항목코드</th>
								<th>항목명</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody id="secondModalUpdTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn" id="secondUpdClose">Close</a>
				<a href="#" class="btn" id="secondModalUpd">수정</a> <a href="#"
					class="btn" id="secondModalDel">삭제</a>
			</div>
		</div>
	</div>
</div>



<script>




var deproductList;

$("#searchBtn").on("click", function() {
    if ($("#searchPay").val() != "") {
        $("#searchFrm").submit();
    } else
        alert("문자를 입력하세요!")
})

$("#modalAddProduct").click(function() {
    $("#secondModalTitle").html("급여");
    $("#secondModalUpdTbody").empty();
    secondModalDataInput(deproductList, 1, $("#secondModalTbody"));
})
$("#modalAddDeduct").click(function() {
    $("#secondModalTitle").html("공제");
    $("#secondModalUpdTbody").empty();
    secondModalDataInput(deproductList, 2, $("#secondModalTbody"));
})

function secondAddClose() {
    $("#secondUpdClose").click();
    $("#secondUpdClose1").click();

    $("#secondAddClose").click();
    $("#secondAddClose1").click();
};

$("#secondModalAddSave").click(function() {
    secondModalEvent();
    secondAddClose();
});

$("#secondModalUpd").click(function() {
    secondModalUpdEvent();
    secondAddClose();
});

$("#secondModalDel").click(function() {
    $.ajax({
        method: "post",
        url: "/deletePayment",
        data: {
            paycode: $(this).val(),
            userid: $(".modalUserInfo").eq(0).val()
        },
        success: function(data) {
            dataInput(data);
        }
    });
    secondAddClose();
})

function secondModalEvent() {
    var check = confirm('등록하시겠습니까?');
    if (check & parseInt($("#totalMoney").val()) > 0) {
        var dateSplit = $("#datepicker").val().split('-');
        var tempList = new Array();
        var paydate = dateSplit[0] + dateSplit[1] + dateSplit[2];
        var userId = $(".modalUserInfo").val();
        tempList.push(userId);
        tempList.push(paydate);
        var decdList = new Array();
        var decdPayList = new Array();

        $(".secondMoney").each(function() {
            if (parseInt($(this).val()) > 0) {
                decdList.push($(this).data('decd'));
                decdPayList.push($(this).val());
            }
        });

        $.ajax({
            method: "post",
            url: "/insertAndUpdatePayment",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({
                userid: userId,
                payday: paydate,
                decdMap: decdList,
                decdPayList: decdPayList
            }),
            success: function(data) {
                if (data.msg == false) {
                    alert("해당 월에 지급한 내역이 있어 등록되지 않았습니다.");
                }else{
	                dataInput(data);
	                location.reload();
                }
            }
        })

    } else {
        alert("값이 입력되지않아 취소되었습니다.");
    }
}

function secondModalUpdEvent() {
    var check = confirm('수정하시겠습니까?');
    if (check) {
        var dateSplit = $("#datepicker1").val().split('-');
        var tempList = new Array();
        var paydate = dateSplit[0] + dateSplit[1] + dateSplit[2];
        var userId = $(".modalUserInfo").val();
        tempList.push(userId);
        tempList.push(paydate);
        var decdList = new Array();
        var decdPayList = new Array();
        $(".secondMoney").each(function() {
            if (parseInt($(this).val()) > 0) {
                decdList.push($(this).data('decd'));
                decdPayList.push($(this).val());
            }
        });

        $.ajax({
            method: "post",
            url: "/updatePaymentDetailAjax",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({
                userid: userId,
                payday: paydate,
                payCode: $('#secondModalDel').val(),
                deprostatus: $('#secondModalUpd').data('deprostatus'),
                decdMap: decdList,
                decdPayList: decdPayList
            }),
            success: function(data) {
                if (data.msg == false) {
                    alert("해당 월에 지급한 내역이 있어 등록되지 않았습니다.");
                }else{
	                dataInput(data);
	                location.reload();            	
                }
            }
        })

    }
}
$(".paymentDetail").click(
    function() {
        $(".modalUserInfo").eq(0).val($(this).html());
        for (var i = 1; i < 4; i++) {
            $(".modalUserInfo").eq(i).val(
                $(this).closest(".payTr").children("td").eq(i)
                .html());
        }
        $.ajax({
            method: "get",
            url: "/getPaymentList",
            data: "userid=" + $(this).html(),
            success: function(data) {
                dataInput(data);
                deproductList = data.divList;
            }
        });
    })

function secondDetailUpd(modalUpd, deprostatus) {
    $("#secondModalDel").val(modalUpd);
    $.ajax({
        method: "get",
        url: "/getPaymentList",
        data: "payCode=" + modalUpd,
        success: function(data) {
            secondModalDataInput(deproductList, deprostatus,
                $("#secondModalUpdTbody"));
            secondDetailInit(data, deprostatus);
        }
    });
}

function secondDetailInit(data, deprostatus) {
    $("#secondModalTbody").empty();
    $(".secondMoney").each(
        function() {
            for (var i = 0; i < data.paymentDetailList.length; i++) {
                if (data.paymentDetailList[i].deductCode == $(this)
                    .data('decd')) {
                    $(this).val(data.paymentDetailList[i].deductPay);
                }
            }
            $('#totalMoney').val(
                parseInt($('#totalMoney').val()) +
                parseInt($(this).val()));
        });
}

function secondMethodInput() {
    $(".modalUpdProduct").click(function() {
        $('#datepicker1').datepicker('setDate', $(this).html());

        $('#secondModalUpd').data('deprostatus', 1);
        secondDetailUpd($(this).data('paycd'), 1);
    })

    $(".modalUpdDeduct").click(function() {
        $('#datepicker1').datepicker('setDate', $(this).html());
        $('#secondModalUpd').data('deprostatus', 2);
        secondDetailUpd($(this).data('paycd'), 2);
    })
}

$(document)
    .ready(
        function() {
            $("#datepicker1")
                .datepicker({
                    dateFormat: 'yy-mm-dd',
                    showOn: "both",
                    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
                    showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                        ,
                    showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
                        ,
                    buttonImageOnly: true
                });
        });

function secondModalDataInput(deproductList, deprostatus, modalSelect) {
    modalSelect.empty();
    for (var i = 0; i < deproductList.length; i++) {
        if (deproductList[i].deprostatus == 1) {
            modalSelect.append("<tr class=\'secondProductAdd\'>");
        } else if (deproductList[i].deprostatus == 2) {
            modalSelect.append("<tr class=\'secondDeductAdd\'>");
        } else if (deproductList[i].deprostatus == 3) {
            modalSelect.append("<tr class=\'secondWithholdAdd\'>");
        }

        if (deproductList[i].deprostatus == deprostatus) {
            modalSelect.append("<td>" + deproductList[i].deductCode +
                "</td>");
            modalSelect.append("<td>" + deproductList[i].deductName +
                "</td>");
            modalSelect
                .append("<td>" +
                    "<input data-decd=\'" + deproductList[i].deductCode + "\' value=0 type=\'text\' class=\'secondMoney\'/>" +
                    "</td>");
        }
        modalSelect.append("</tr>");
    }
    modalSelect
        .append("<tr><td></td><td>총금액</td><td>" +
            "<input type=\'text\' value=0 readonly=\'readonly\' id='totalMoney'/></td></tr>");
    $(".secondMoney").each(function() {
        if (parseInt($(this).data('decd')) >= 5000) {
            $(this).attr('readonly', 'readonly');
        }
    })
    $(".secondMoney").on(
        "change",
        function() {
            $('#totalMoney').val(parseInt(0));
            $(".secondMoney").each(
                function() {
                    if (jQuery.isNumeric($(this).val())) {
                        $('#totalMoney').val(
                            parseInt($('#totalMoney').val()) +
                            parseInt($(this).val()));
                    } else {
                        alert('input number');
                        $(this).val("0");
                    }
                })
        });
}

function dataInput(data) {
    var deductName = new Map();

    $(
            "#firModalProductThead,#firModalProductTbody,#firModalDeductThead,#firModalDeductTbody,#firModalWithholdThead,#firModalWithholdTbody")
        .html("");
    $("#firModalProductThead,#firModalDeductThead,#firModalWithholdThead")
        .append("<th>적용일</th>");
    for (var i = 0; i < data.divList.length; i++) {
        deductName.set(data.divList[i].deductCode, 0);
        if (data.divList[i].deprostatus == 1) {
            $("#firModalProductThead").append(
                "<th>" + data.divList[i].deductName + "</th>");
        } else if (data.divList[i].deprostatus == 2) {
            $("#firModalDeductThead").append(
                "<th>" + data.divList[i].deductName + "</th>");
        } else if (data.divList[i].deprostatus == 3) {
            $("#firModalWithholdThead").append(
                "<th>" + data.divList[i].deductName + "</th>");
        }
        deductName.set(data.divList[i].deductCode, 0);
    }

    $("#firModalProductThead").append("<th>총급여액</th><th>총 과세액</th>");
    $("#firModalDeductThead,#firModalWithholdThead")
        .append("<th>총공제액</th>");

    if (data.hasOwnProperty('paymentList')) {

        for (var i = 0; i < data.paymentList.length; i++) {
            $("#firModalDeductTbody").append("<tr>");
            $("#firModalProductTbody").append("<tr>");
            $("#firModalWithholdTbody").append("<tr>");
            $("#firModalDeductTbody")
                .append(
                    "<td><a data-toggle=\'modal\' data-payCd=\'" +
                    data.paymentList[i].payCode + "\' href=\'#myModal3\' class=\'bttn-md bttn-warning modalUpdDeduct\'>" +
                    data.paymentList[i].payDay +
                    "</a></td>");
            $("#firModalProductTbody")
                .append(
                    "<td><a data-toggle=\'modal\' data-payCd=\'" +
                    data.paymentList[i].payCode + "\' href=\'#myModal3\' class=\'bttn-md bttn-warning modalUpdProduct\'>" +
                    data.paymentList[i].payDay +
                    "</a></td>");
            $("#firModalWithholdTbody").append(
                "<td>" + data.paymentList[i].payDay + "</td>");
            for (var a = 0; a < data.paymentList.length; a++) {
                if (data.paymentDetailList[a].length == 0) {
                    break;
                } else if (data.paymentDetailList[a][0].payCode == data.paymentList[i].payCode) {
                    deductName = setDNT(data, deductName, a);
                }
            }

            for (var j = 0; j < data.divList.length; j++) {
                if (data.divList[j].deprostatus == 1) {
                    $("#firModalProductTbody")
                        .append(
                            "<td>" +
                            deductName
                            .get(data.divList[j].deductCode) +
                            "</td>");
                } else if (data.divList[j].deprostatus == 2) {
                    $("#firModalDeductTbody")
                        .append(
                            "<td>" +
                            deductName
                            .get(data.divList[j].deductCode) +
                            "</td>");
                } else if (data.divList[j].deprostatus == 3) {
                    $("#firModalWithholdTbody")
                        .append(
                            "<td>" +
                            deductName
                            .get(data.divList[j].deductCode) +
                            "</td>");
                }
            }
            deductName = new Map();
            for (var a = 0; a < data.divList.length; a++) {
                deductName.set(data.divList[a].deductCode, 0);
            }
            $("#firModalProductTbody").append(
                "<td>" + Number(data.paymentList[i].totalSalary).toLocaleString('en') + "</td>");
            $("#firModalProductTbody").append(
                "<td>" + Number(data.paymentList[i].taxamount).toLocaleString('en') + "</td>");
            $("#firModalDeductTbody,#firModalWithholdTbody").append(
                "<td>" + Number(data.paymentList[i].totalWage).toLocaleString('en') + "</td>");

            $("#firModalWithholdTbody,#firModalDeductTbody,#firModalProductTbody")
                .append("</tr>");
        }
    }
    secondMethodInput();
}

function setDNT(data, deductName, a) {

    for (var i = 0; i < data.paymentDetailList[a].length; i++) {
        deductName.set(data.paymentDetailList[a][i].deductCode,
            data.paymentDetailList[a][i].deductPay);
    }
    return deductName;
}
</script>
<script type="text/javascript" src="/js/datepicker.js"></script>