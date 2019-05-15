<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2>
			<i class="fa fa-calculator"></i>매입매출전표 관리
		</h2>

		<!-- 뷰 폼 시작-->
		<div>
			<table class="table table-hover" style="font-size: small;">
				<thead class="thead">
					<tr style="text-align: center;">
						<td style="width: 80px;">번호</td>
						<td style="width: 150px;">날짜</td>
						<td style="width: 100px;">구분</td>
						<td style="width: 120px;">공급가액</td>
						<td style="width: 120px;">부가세</td>
						<td style="width: 150px;">공급대가</td>
						<td style="width: 150px;">거래처</td>
						<td style="width: 150px;">사용부서</td>
						<td style="width: 150px;">발주번호</td>
						<td style="width: 80px;">전자</td>
						<td style="width: 80px;">분개</td>
					</tr>
				</thead>
				<tbody id="establishListTbody">

				</tbody>
			</table>

			<c:set var="lastPage"
				value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

			<nav style="text-align: center;">
				<ul id="pagination" class="pagination">
				</ul>
			</nav>
		</div>
		<hr>
		<!-- 뷰 폼 끝-->


		<!-- 입력 폼 시작-->
		<h4>
			전표 입력 <a data-toggle="modal" href="#insertTip">[[ Tip ]]</a>
		</h4>
		<table class="table-sm">
			<thead class="thead">
				<tr style="text-align: center;">
					<th style="width: 100px;">날짜</th>
					<th style="width: 80px;">구분</th>
					<th style="width: 100px;">공급가액</th>
					<th style="width: 100px;">부가세</th>
					<th style="width: 100px;">공급대가</th>
					<th colspan="2" style="width: 150px;">거래처</th>
					<th colspan="2" style="width: 150px;">부서</th>
					<th style="width: 65px;">전자</th>
					<th style="width: 65px;">분개</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input class="form-control-sm" id="insertSlipDate"
						style="width: 100px;" type="text" /></td>
					<!-- 날짜 -->
					<td><input class="form-control-sm" id="insertSalesStatus"
						style="width: 80px;" type="text" /></td>
					<!-- 구분 -->
					<td><input class="form-control-sm" id="insertSupplyValue"
						style="width: 100px;" type="text" readonly /></td>
					<!-- 공급가액 -->
					<td><input class="form-control-sm" id="insertSurTax"
						style="width: 100px;" type="text" readonly /></td>
					<!-- 부가세 -->
					<td><input class="form-control-sm" id="insertSumValue"
						style="width: 100px;" type="text" /></td>
					<!-- 공급대가 -->
					<td colspan="2">
						<div class="input-group addon">
							<input class="form-control-sm" id="insertClientCode"
								style="width: 35px;" type="text" readonly />
							<!-- 거래처코드 -->
							<input class="form-control-sm" id="insertClient"
								style="width: 115px;" type="text" />
						</div>
					</td>
					<!-- 거래처 -->
					<td colspan="2">
						<div class="input-group addon">
							<input class="form-control-sm" id="insertDeptCode"
								style="width: 35px;" type="text" readonly />
							<!-- 사용부서 -->
							<input class="form-control-sm" id="insertDept"
								style="width: 115px;" type="text" placeholder="미등록" />
						</div>
					</td>
					<!-- 사용부서 -->
					<td><input class="form-control-sm" id="insertAuto"
						style="width: 70px;" type="text" /></td>
					<!-- 전자 -->
					<td><input class="form-control-sm" id="insertSlipType"
						style="width: 70px;" type="text" /></td>
					<!-- 분개 -->
				</tr>
			</tbody>
		</table>
		<!-- 입력 폼 끝 -->


		<p style="margin-top: 30px;" />


		<!-- 전표 세부내역 분개 창 영역 -->
		<div id="insertViewArea"></div>
		<!-- 전표 세부내역 분개 창 영역 -->


		<!-- 전표 세부내역 상세보기 창 영역 -->
		<div id="detailViewArea"></div>
		<!-- 전표 세부내역 상세보기 창 영역 -->




		<!-- 매입매출코드 시작 -->
		<hr>
		<b>매입코드</b>
		<table border="1">
			<tr>
				<td style="font-size: 12px;"><c:forEach var="ph"
						items="${phCode}" varStatus="status">
						<b><font class="phKey" color="blue">${ph.key}</font></b> = 
					<span class="phValue">${ph.value}</span>||
			</c:forEach></td>
			</tr>
		</table>




		<br /> <br /> <b>매출코드</b> <br />
		<table border="1">
			<tr>
				<td style="font-size: 12px;"><c:forEach var="sc"
						items="${scCode}" varStatus="status">
						<b><font class="scKey" color="red">${sc.key}</font></b>  =
					<span class="scValue">${sc.value}</span> ||
			</c:forEach></td>
			</tr>
		</table>
		<!-- 매입매출코드 끝 -->


		<!-- 전자여부 시작-->
		<br /> <br /> <b>전자여부</b> <br />
		<table border="1">
			<tr>
				<td style="font-size: 12px;"><b><font color="green">0</font></b>
					= 일반 || <b><font color="green">1</font></b> = 전자</td>
			</tr>
		</table>
		<!-- 전자여부 끝-->


		<!-- 분개유형 시작-->
		<br /> <br /> <b>분개유형</b> <br />
		<table border="1">
			<tr>
				<td style="font-size: 12px;"><b><font color="orange">1</font></b>
					= 현금 || <b><font color="orange">2</font></b> = 외상 || <b><font
						color="orange">3</font></b> = 혼합 || <b><font color="orange">4</font></b>
					= 카드</td>
			</tr>
		</table>
		<!-- 분개유형 끝-->

	</div>
</div>

<!-- hidden input Area 시작-->
<input type="hidden" id="client_hidden" data-toggle="modal"
	data-target="#client_search" />
<input type="hidden" id="dept_hidden" data-toggle="modal"
	data-target="#dept_search" />
<input type="hidden" id="orderCode_hidden" data-toggle="modal"
	data-target="#orderCode_search" />

<!-- hidden input Area 끝-->


<!-- Modal Area 시작-->
<!-- 거래처 검색 modal window -->
<div class="modal modal-center fade" id="client_search" tabindex="4"
	role="dialog" aria-labelledby="my80sizeCenterModalLabel">
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
				<div class="input-group input-group-sm" style="width: 400px;">
					<label for="client_searchArea">거래처 이름&nbsp;&nbsp;&nbsp;</label> <input class="form-control"
						type="text" id="client_searchArea" name="client_searchArea" /> <button
						type="button" id="client_searchAreaBtn" class="bttn-bordered bttn-sm bttn-primary"
						name="client_searchAreaBtn">검색</button>
				</div>

				<div class="input-group input-group-sm" style="width: 400px;">
					<label for="InputEmail">현재선택된 거래처&nbsp;&nbsp;&nbsp;</label> <input
						type="text" id="client_valuehArea" name="client_valuehArea" class="form-control"
						readonly />
					<button type="button" class="bttn-bordered bttn-sm bttn-primary"
						id="client_valuehAreaBtn" class="btn valuehAreaBtn"
						data-dismiss="modal">확인</button>
				</div>
				<div id="client_searchDataArea"></div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!--전표입력 팁 -->
<div class="modal modal-center fade" id="insertTip" tabindex="4"
	role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">전표입력 Tip!</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="form-group">
					<label for="InputEmail">1. 하단의 내용을 보고 <font color="blue">매입코드</font>와
						<font color="red">매출코드</font>를 정확히 입력해주세요.
					</label>
				</div>

				<div class="form-group">
					<label for="InputEmail">2. 세금계산서를 발행한 거래는 <b>과세</b>, <br>
						&nbsp;&nbsp;&nbsp;&nbsp;계산서를 발행한 거래는 <b>면세</b> 거래 입니다.
					</label>
				</div>

				<div class="form-group">
					<label for="InputEmail">3. <b>공급대가</b>를 입력하면 <br />&nbsp;&nbsp;&nbsp;&nbsp;
						자동으로 공급가액과 부가세액을 계산합니다.
					</label>
				</div>

				<div class="form-group">
					<label for="InputEmail">4. 거래처와 부서는 검색을 통해 입력이 가능합니다.</label>
				</div>

				<div class="form-group">
					<label for="InputEmail">5. <font color="blue">국세청
							전자세금계산서</font>를 발행한 경우 전자여부는 '여' 입니다.
					</label>
				</div>

			</div>

			<div class="modal-footer">
				<button type="button" class="bttn-unite bttn-sm bttn-warning"
					 data-dismiss="modal">확인</button>
			</div>

		</div>
	</div>
</div>

<!-- 부서 검색 modal window -->
<div class="modal modal-center fade" id="dept_search" tabindex="4"
	role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">부서 검색</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="input-group input-group-sm" style="width: 400px;">
					<label for="InputEmail">부서명&nbsp;&nbsp;&nbsp;</label> 
				    <input class="form-control"
						type="text" id="dept_searchArea" name="dept_searchArea" /> 
					<button type="button" id="dept_searchAreaBtn" name="dept_searchAreaBtn"
							class="bttn-bordered bttn-sm bttn-primary">검색</button> 
				</div>

				<div class="input-group input-group-sm" style="width: 400px;">
					<label for="InputEmail">선택 부서&nbsp;&nbsp;&nbsp;</label> 
				    <input type="text" class="form-control"
						id="dept_valuehArea" name="dept_valuehArea" readonly />
					<button type="button"
						id="dept_valuehAreaBtn" class="bttn-bordered bttn-sm bttn-primary valuehAreaBtn"
						data-dismiss="modal">확인</button>
				</div>

				<div id="dept_searchDataArea"></div>

			</div>

			<div class="modal-footer"></div>

		</div>
	</div>
</div>

<!-- Modal Area 끝-->

<script>
//날짜 로드 처리 시작=========================================================================
$("document").ready(function() {
    $(function() {
        //input을 datepicker로 선언
        $("#insertSlipDate").datepicker({
            dateFormat: 'yy/mm/dd' //Input Display Format 변경
                ,
            showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,
            showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
                ,
            changeYear: true //콤보박스에서 년 선택 가능
                ,
            changeMonth: true //콤보박스에서 월 선택 가능                
                ,
            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,
            buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,
            buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,
            yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,
            monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
                ,
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                ,
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                ,
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,
            minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,
            maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });

        //초기값을 오늘 날짜로 설정
        $('#insertSlipDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });
});

//날짜 로드 처리 끝=========================================================================


// 페이징 처리 시작=========================================================================

/*페이지 로드 시 1페이지를 로드*/
$("document").ready(function() {
    getTax_calPageList(1);

});

/*페이지 로드 시 호출하는 Ajax*/
function getTax_calPageList(page) {
    $.ajax({
        url: "${pageContext.request.contextPath }/getTax_calPageList",
        data: "page=" + page,
        success: function(data) {

            var htmlArr = data
                .split("================seperator================");

            $("#establishListTbody").html(htmlArr[0]);
            $("#pagination").html(htmlArr[1]);

        }
    });
}

//페이징 처리 끝=========================================================================


// Status Code Map
var statusCodeMap = new Map();


// 매입매출전표 입력 - 구분 엔터키 실행
$("#insertSalesStatus").keypress(function(e) {
    fn_salesSet(e);
});
// 공급대가 금액 입력 - 엔터키 실행
$("#insertSumValue").keypress(function(e) {
    fn_distinguishValue(e);
});

/********************************************/

// 거래처 키다운 & 마우스 클릭 : 키다운
$("#insertClient").keypress(function(e) {
    fn_findClient();
});
// 거래처 키다운 & 마우스 클릭 : 마우스클릭
$("#insertClient").click(function() {
    fn_findClient();
});

/********************************************/

// 부서 키다운 & 마우스 클릭 : 키다운
$("#insertDept").keypress(function(e) {
    fn_findDept();
});
// 부서 키다운 & 마우스 클릭 : 마우스클릭
$("#insertDept").click(function() {
    fn_findDept();
});

/********************************************/

// 발주번호 키다운 & 마우스 클릭 : 키다운
$("#insertOrderCode").keypress(function(e) {
    fn_findOrderCode();
});
// 발주번호 키다운 & 마우스 클릭 : 마우스클릭
$("#insertOrderCode").click(function() {
    fn_findOrderCode();
});

/********************************************/

// 전자여부 자동변경
$("#insertAuto").keypress(function(e) {
    var value = $(this).val();
    fn_setAutoCode(e, value);
});

/********************************************/

// 분개유형 자동변경
$("#insertSlipType").keypress(function(e) {
    var value = $(this).val();
    fn_setSlipType(e, value);

});

/********************************************/

// function

/*매입매출 구분 셋팅*/
function fn_salesSet(e) {
    if (e.which == 13) {

        // 파라미터 index, item
        $(".scKey").each(function(i, item) {
            statusCodeMap.set($(this).html(), $(".scValue").eq(i).html());
        });

        // 파라미터 index, item
        $(".phKey").each(function(i, item) {
            statusCodeMap.set($(this).html(), $(".phValue").eq(i).html());
        });

        $("#insertSumValue").focus();
        $("#insertSalesStatus").val(statusCodeMap.get($("#insertSalesStatus").val()));
    }
}

/*공급대가 데이터를 활용하여 공급가액과 부가세액 셋팅*/
function fn_distinguishValue(e) {
    if (e.which == 13) {
        var supplyValue = parseInt($("#insertSumValue").val() / 1.1);
        var surTax = parseInt($("#insertSumValue").val() - supplyValue);
        var sumValue = $("#insertSumValue").val();

        supplyValue = fn_numberWithCommas(supplyValue + "");
        surTax = fn_numberWithCommas(surTax + "");
        sumValue = fn_numberWithCommas(sumValue + "");

        $("#insertSupplyValue").val(supplyValue);
        $("#insertSurTax").val(surTax);
        $("#insertSumValue").val(sumValue);
        $("#insertClient").focus();

    }

}

/*원단위 콤마 변환*/
function fn_numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


/*거래처 검색*/
function fn_findClient() {
    $("#client_hidden").trigger("click");

    // Client Data 접근 Ajax
    $.ajax({
        url: "${pageContext.request.contextPath }/findClient",
        success: function(data) {
            $("#client_searchDataArea").html(data);
        }
    });
}


/*부서 검색*/
function fn_findDept() {
    $("#dept_hidden").trigger("click");

    // Dept Data 접근 Ajax
    $.ajax({
        url: "${pageContext.request.contextPath }/findDept",
        success: function(data) {
            $("#dept_searchDataArea").html(data);
        }
    });
}

/*발주번호 검색*/
function fn_findOrderCode() {
    $("#orderCode_hidden").trigger("click");

    // OrderCode Data 접근 Ajax  [[개발예정]]
    $.ajax({
        url: "${pageContext.request.contextPath }/findOrderCode",
        success: function(data) {
            $("#orderCode_searchDataArea").html(data);
        }
    });
}


/*전자여부 셋팅*/
function fn_setAutoCode(e, value) {
    if (e.which == 13) {
        if (value == 0) {
            $("#insertAuto").val("부");
            $("#insertSlipType").focus();
        } else if (value == 1) {
            $("#insertAuto").val("여");
            $("#insertSlipType").focus();
        } else {
            $("#insertAuto").val("");
        }
    } else {
        // 작동 하지 않음
    }
}


/*분개유형 셋팅*/
function fn_setSlipType(e, value) {
    if (e.which == 13) {
        if (value == 1) {
            $("#insertSlipType").val("현금");
            fn_openInsertViewAreaLoad();
        } else if (value == 2) {
            $("#insertSlipType").val("외상");
            fn_openInsertViewAreaLoad();
        } else if (value == 3) {
            $("#insertSlipType").val("혼합");
            fn_openInsertViewAreaLoad();
        } else if (value == 4) {
            $("#insertSlipType").val("카드");
            fn_openInsertViewAreaLoad();
        } else {
            $("#insertAuto").val("");
        }
    } else {
        // 작동 하지 않음
    }
}

/*상세보기. Tr 클릭 시 div 데이터 추가*/
function fn_salesDetailView(salesCode) {

    $.ajax({
        url: "${pageContext.request.contextPath }/sales_detailView",
        data: "salesCode=" + salesCode,
        success: function(data) {

            $("#detailViewArea").html(data);

        }
    });
}

/*입력창 오픈 : Ajax*/
function fn_openInsertViewAreaLoad() {

    var slipType = $("#insertSlipType").val();
    var salesStatus = $("#insertSalesStatus").val();
    var supplyValue = $("#insertSupplyValue").val();
    var surtax = $("#insertSurTax").val();
    var sumValue = $("#insertSumValue").val();
    var clientCode = $("#insertClientCode").val();
    var clientName = $("#insertClient").val();
    var slipDate = $("#insertSlipDate").val();
    var deptCode = $("#insertDeptCode").val();
    var auto = $("#insertAuto").val();

    $.ajax({
        url: "${pageContext.request.contextPath }/openInsertViewAreaLoad",
        data: "slipType=" + slipType +
            "&salesStatus=" + salesStatus +
            "&supplyValue=" + supplyValue +
            "&surtax=" + surtax +
            "&sumValue=" + sumValue +
            "&clientCode=" + clientCode +
            "&clientName=" + clientName +
            "&slipDate=" + slipDate +
            "&deptCode=" + deptCode +
            "&auto=" + auto,
        success: function(data) {
            $("#insertViewArea").html(data);
            fn_openInsertViewArea();

        }
    });
}

/*전표데이터 컨트롤러로 전송하는 Ajax  전표 데이터 전송 완료 , 전표상세데이터 전송*/
function fn_openInsertViewArea() {

    var slipDate = $("#insertSlipDate").val();
    var supplyValue = $("#insertSupplyValue").val();
    var surtax = $("#insertSurTax").val();
    var sumValue = $("#insertSumValue").val();
    var salesStatus = $("#insertSalesStatus").val();
    var clientName = $("#insertClient").val();
    var deptName = $("#insertDept").val();
    var auto = $("#insertAuto").val();
    var slipType = $("#insertSlipType").val();

    $.ajax({
        url: "${pageContext.request.contextPath }/openInsertViewArea",
        data: "slipDate=" + slipDate +
            "&supplyValue=" + supplyValue +
            "&surtax=" + surtax +
            "&sumValue=" + sumValue +
            "&salesStatus=" + salesStatus +
            "&clientName=" + clientName +
            "&deptName=" + deptName +
            "&auto=" + auto +
            "&slipType=" + slipType,
        success: function(data) {
            
        }
    });

}
</script>
