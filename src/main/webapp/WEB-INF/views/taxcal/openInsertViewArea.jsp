<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 분개유형 데이터 로드 -->
<input id="loadSlipType" type="hidden" value="${slipType }" />
<input id="loadSalesStatus" type="hidden" value="${salesStatus }" />
<input id="loadSupplyValue" type="hidden" value="${supplyValue }" />
<input id="loadSurtax" type="hidden" value="${surtax }" />
<input id="loadSumValue" type="hidden" value="${sumValue }" />
<input id="loadClientCode" type="hidden" value="${clientCode }" />
<input id="loadClientName" type="hidden" value="${clientName }" />
<input id="loadSlipDate" type="hidden" value="${slipDate }" />
<input id="loadDeptCode" type="hidden" value="${deptCode }" />
<input id="loadAuto" type="hidden" value="${auto }" />


<!-- 세부전표 내용 시작-->

<table border="1" style="text-align: center;">

	<thead class="thead">
		<tr>
			<th>차/대</th>
			<th colspan="2">계정과목</th>
			<th>적요</th>
			<th colspan="2">거래처</th>
			<th>차변</th>
			<th>대변</th>
		</tr>
	</thead>

	<tbody id="tbody">
		<tr>
			<td><select class="form-control-sm" id="detail_slipStatus1"></select></td>
			<td><input class="form-control-sm" id="detail_slipEstabilshCode1" 
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_slipEstabilshName1" 
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_jukyo1" type="text" /></td>
			<td><input class="form-control-sm" id="detail_clientCode1" style="width: 50px;"
				type="text" /></td>
			<!-- 거래처코드 -->
			<td><input class="form-control-sm" id="detail_clientName1" 
				type="text" /></td>
			<!-- 거래처이름 -->
			<td><input class="form-control-sm" id="detail_slipLeft1" 
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_slipRight1" 
				class="rightStatus" type="text" /></td>
		</tr>

		<tr>
			<td><select class="form-control-sm" id="detail_slipStatus2"></select></td>
			<td><input class="form-control-sm" id="detail_slipEstabilshCode2"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_slipEstabilshName2"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_jukyo2" type="text" /></td>
			<td><input class="form-control-sm" id="detail_clientCode2" style="width: 50px;"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_clientName2"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_slipLeft2"
				type="text" /></td>
			<td><input class="form-control-sm rightStatus" id="detail_slipRight2"
				type="text" /></td>
		</tr>

		<tr>
			<td><select class="form-control-sm" id="detail_slipStatus3"></select></td>
			<td><input class="form-control-sm" id="detail_slipEstabilshCode3"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_slipEstabilshName3"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_jukyo3" type="text" /></td>
			<td><input class="form-control-sm" id="detail_clientCode3" style="width: 50px;"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_clientName3"
				type="text" /></td>
			<td><input class="form-control-sm" id="detail_slipLeft3"
				type="text" /></td>
			<td><input class="form-control-sm rightStatus" id="detail_slipRight3"
				 type="text" /></td>
		</tr>
	</tbody>
</table>

<!-- 세부전표 내용 끝-->

<!-- 등록 시작 -->
<br />
<button type="button" class="bttn-unite bttn-sm bttn-warning" id="insertTaxcalBtn"
	name="insertTaxcalBtn">전표등록</button>
<!-- 등록 끝 -->

<script>
var tbodyData = "";


$("document").ready(function() {
	$("#detail_slipStatus1,#detail_slipStatus2,#detail_slipStatus3").append("<option value=\'차변\'>차변</option>")
	$("#detail_slipStatus1,#detail_slipStatus2,#detail_slipStatus3").append("<option value=\'대변\'>대변</option>")
    var dist = $("#loadSalesStatus").val();

    /*분개유형 선택 시 자동분개 시스템*/

    // 과세매입
    if (dist == "과세매입") {

        // 현금
        if ($("#loadSlipType").val() == "현금") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSupplyValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());


            $("#detail_slipStatus2").val("차변");
            $("#detail_slipEstabilshCode2").val("135");
            $("#detail_slipEstabilshName2").val("부가세대급금");
            $("#detail_slipLeft2").val($("#loadSurtax").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());


            $("#detail_slipStatus3").val("대변");
            $("#detail_slipEstabilshCode3").val("101");
            $("#detail_slipEstabilshName3").val("현금");
            $("#detail_slipRight3").val($("#loadSumValue").val());

        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSupplyValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("차변");
            $("#detail_slipEstabilshCode2").val("135");
            $("#detail_slipEstabilshName2").val("부가세대급금");
            $("#detail_slipLeft2").val($("#loadSurtax").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

            $("#detail_slipStatus3").val("대변");
            $("#detail_slipEstabilshCode3").val("251");
            $("#detail_slipEstabilshName3").val("외상매입금");
            $("#detail_slipRight3").val($("#loadSumValue").val());
            $("#detail_clientCode3").val($("#loadClientCode").val());
            $("#detail_clientName3").val($("#loadClientName").val());

        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSupplyValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("차변");
            $("#detail_slipEstabilshCode2").val("135");
            $("#detail_slipEstabilshName2").val("부가세대급금");
            $("#detail_slipLeft2").val($("#loadSurtax").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSupplyValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("차변");
            $("#detail_slipEstabilshCode2").val("135");
            $("#detail_slipEstabilshName2").val("부가세대급금");
            $("#detail_slipLeft2").val($("#loadSurtax").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

            $("#detail_slipStatus3").val("대변");
            $("#detail_slipEstabilshCode3").val("253");
            $("#detail_slipEstabilshName3").val("미지급금");
            $("#detail_slipRight3").val($("#loadSumValue").val());

        }



    } else if (dist == "영세율") {
        // 현금
        if ($("#loadSlipType").val() == "현금") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("101");
            $("#detail_slipEstabilshName2").val("현금");
            $("#detail_slipRight2").val($("#loadSumValue").val());

        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("251");
            $("#detail_slipEstabilshName2").val("외상매입금");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());
        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("253");
            $("#detail_slipEstabilshName2").val("미지급금");
            $("#detail_slipRight2").val($("#loadSumValue").val());
        }


    } else if (dist == "계산서") {
        // 현금
        if ($("#loadSlipType").val() == "현금") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("101");
            $("#detail_slipEstabilshName2").val("현금");
            $("#detail_slipRight2").val($("#loadSumValue").val());

        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("251");
            $("#detail_slipEstabilshName2").val("외상매입금");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());
        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("253");
            $("#detail_slipEstabilshName2").val("미지급금");
            $("#detail_slipRight2").val($("#loadSumValue").val());
        }

    } else if (dist == "불공") {
        // 현금
        if ($("#loadSlipType").val() == "현금") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("101");
            $("#detail_slipEstabilshName2").val("현금");
            $("#detail_slipRight2").val($("#loadSumValue").val());

        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("251");
            $("#detail_slipEstabilshName2").val("외상매입금");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());


        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());
        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("146");
            $("#detail_slipEstabilshName1").val("상품");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("253");
            $("#detail_slipEstabilshName2").val("미지급금");
            $("#detail_slipRight2").val($("#loadSumValue").val());
        }

    } else if (dist == "과세매출") {
        // 현금
        if ($("#loadSlipType").val() == "현금") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("101");
            $("#detail_slipEstabilshName1").val("현금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSupplyValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

            $("#detail_slipStatus3").val("대변");
            $("#detail_slipEstabilshCode3").val("255");
            $("#detail_slipEstabilshName3").val("부가세예수금");
            $("#detail_slipRight3").val($("#loadSurtax").val());
            $("#detail_clientCode3").val($("#loadClientCode").val());
            $("#detail_clientName3").val($("#loadClientName").val());
        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSupplyValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

            $("#detail_slipStatus3").val("대변");
            $("#detail_slipEstabilshCode3").val("255");
            $("#detail_slipEstabilshName3").val("부가세예수금");
            $("#detail_slipRight3").val($("#loadSurtax").val());
            $("#detail_clientCode3").val($("#loadClientCode").val());
            $("#detail_clientName3").val($("#loadClientName").val());
        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());
        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSupplyValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());

            $("#detail_slipStatus3").val("대변");
            $("#detail_slipEstabilshCode3").val("253");
            $("#detail_slipEstabilshName3").val("미지급금");
            $("#detail_slipRight3").val($("#loadSurtax").val());
        }

    } else if (dist == "영세율매출") {
        // 현금
        if ($("#loadSlipType").val() == "현금") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("101");
            $("#detail_slipEstabilshName1").val("현금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());
        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());
        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());
        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());
        }

    } else if (dist == "계산서매출") {
        // 현금
        if ($("#loadSlipType").val() == "현금") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("101");
            $("#detail_slipEstabilshName1").val("현금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());
        }

        // 외상
        else if ($("#loadSlipType").val() == "외상") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());
        }

        // 혼합
        else if ($("#loadSlipType").val() == "혼합") {

            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());
        }

        // 카드
        else if ($("#loadSlipType").val() == "카드") {
            $("#detail_slipStatus1").val("차변");
            $("#detail_slipEstabilshCode1").val("108");
            $("#detail_slipEstabilshName1").val("외상매출금");
            $("#detail_slipLeft1").val($("#loadSumValue").val());
            $("#detail_clientCode1").val($("#loadClientCode").val());
            $("#detail_clientName1").val($("#loadClientName").val());

            $("#detail_slipStatus2").val("대변");
            $("#detail_slipEstabilshCode2").val("401");
            $("#detail_slipEstabilshName2").val("상품매출");
            $("#detail_slipRight2").val($("#loadSumValue").val());
            $("#detail_clientCode2").val($("#loadClientCode").val());
            $("#detail_clientName2").val($("#loadClientName").val());
        }
    }

    tbodyData += "<tr>";
    tbodyData += "<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
    tbodyData += "<td style='width: 40px;'><input style='width: 80px;' type='text' /></td>";
    tbodyData += "<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
    tbodyData += "<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
    tbodyData += "<td style='width: 40px;'><input style='width: 80px;' type='text' /></td>";
    tbodyData += "<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
    tbodyData += "<td style='width: 100px;'><input style='width: 100px;' type='text' /></td>";
    tbodyData += "<td style='width: 100px;'><input style='width: 100px;' type='text' /></td>";
    tbodyData += "</tr>";


});


//키다운 엔터
$(".rightStatus").keypress(function(e) {
    fn_appendTbodyData(e);
});

function fn_appendTbodyData(e) {
    if (e.which == 13) {
        $("#tbody").append(tbodyData);
    }
}

// 전표등록
var flag;

$("#insertTaxcalBtn").on("click", function() {

    var salesStatus = $("#loadSalesStatus").val();
    var sumValue = $("#loadSumValue").val();
    
    flag = fn_validationSalesStatus(salesStatus);
    flag = fn_validationSumValue(sumValue);

    // validation 통과
    if (flag === 1) {
        fn_insertTax_calAndDetail();
    }

});

/* 유효성 검사 파트*/

//매입매출 구분 유효성 체크
function fn_validationSalesStatus(salesStatus) {

    if (salesStatus === "") {
        alert("매입매출 코드가 입력되지 않았습니다.");
        return 0;
    } else {
        return 1;
    }
}

// 공급대가
function fn_validationSumValue(sumValue) {
    if (sumValue === "") {
        alert("공급대가가 없습니다.");
        return 0;
    } else {
        return 1;
    }
}

/* 전표 등록 코드 */
function fn_insertTax_calAndDetail() {

    var insertSlipDate = $("#loadSlipDate").val();
    var insertSupplyValue = $("#loadSupplyValue").val();
    var insertSalesStatus = $("#loadSalesStatus").val();
    var insertDeptCode = $("#loadDeptCode").val();
    var insertSurtax = $("#loadSurtax").val();
    var insertClientName = $("#loadClientName").val();
    var insertSumValue_check = $("#loadSumValue").val();
    var insertAuto = $("#loadAuto").val();
    var insertEntryType = $("#loadSlipType").val();

    if (insertDeptCode == "") {
        insertDeptCode = "999";
    }

    if (insertClientName == "") {
        insertClientName = "미등록";
    }

    /*tax_cal Insert Query  실행 후, Location을 통해 redirect를 하는 Ajax*/
    $.ajax({
        url: "${pageContext.request.contextPath }/inesrtTax_calAjax",
        data: "insertSlipDate=" + insertSlipDate +
            "&insertSupplyValue=" + insertSupplyValue +
            "&insertSalesStatus=" + insertSalesStatus +
            "&insertDeptCode=" + insertDeptCode +
            "&insertSurtax=" + insertSurtax +
            "&insertClientName=" + insertClientName +
            "&insertSumValue=" + insertSumValue_check +
            "&insertAuto=" + insertAuto +
            "&insertEntryType=" + insertEntryType,
        success: function(data) {

            fn_insertSales_detail(data);
        }
    });
}


/* 전표 상세정보 입력*/
function fn_insertSales_detail(data) {


    var status1 = $("#detail_slipStatus1").val();
    var price1 = $("#detail_slipLeft1").val() + $("#detail_slipRight1").val();
    var establishCode1 = $("#detail_slipEstabilshName1").val();
    var jukyo1 = $("#detail_jukyo1").val();
    var salesCode1 = data;
    fn_insertQuertyPlay(status1, price1, establishCode1, jukyo1, salesCode1);

    var status2 = $("#detail_slipStatus2").val();
    var price2 = $("#detail_slipLeft2").val() + $("#detail_slipRight2").val();
    var establishCode2 = $("#detail_slipEstabilshName2").val();
    var jukyo2 = $("#detail_jukyo2").val();
    var salesCode2 = data;
    fn_insertQuertyPlay(status2, price2, establishCode2, jukyo2, salesCode2);

    var status3 = $("#detail_slipStatus3").val();
    var price3 = $("#detail_slipLeft3").val() + $("#detail_slipRight3").val();
    var establishCode3 = $("#detail_slipEstabilshName3").val();
    var jukyo3 = $("#detail_jukyo3").val();
    var salesCode3 = data;
    fn_insertQuertyPlay(status3, price3, establishCode3, jukyo3, salesCode3);

}

function fn_insertQuertyPlay(status, price, establishCode, jukyo, salesCode) {
    $.ajax({
        url: "${pageContext.request.contextPath }/inesrtSales_detail",
        data: "status=" + status +
            "&price=" + price +
            "&establishCode=" + establishCode +
            "&jukyo=" + jukyo +
            "&salesCode=" + salesCode,
        success: function(data) {
            

            location.reload();
        }
    });

}	
</script>

