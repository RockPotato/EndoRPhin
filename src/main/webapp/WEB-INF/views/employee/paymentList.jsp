<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="search_box">
	<div class="search_brd src_ty1">
		<table class="brd_write2">
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tbody>
				<tr>
					<th>사원명</th>
					<td><span class="telerik_bx"> <span
							id="ctl00_ContentPlaceHolder1__employeename_wrapper"
							class="riSingle RadInput" style="width: 160px;"><input
								id="ctl00_ContentPlaceHolder1__employeename"
								name="ctl00$ContentPlaceHolder1$_employeename" size="20"
								type="text" value="" class=" "><input
								id="ctl00_ContentPlaceHolder1__employeename_ClientState"
								name="ctl00_ContentPlaceHolder1__employeename_ClientState"
								type="hidden" autocomplete="off"
								value="{&quot;enabled&quot;:true,&quot;emptyMessage&quot;:&quot;&quot;,&quot;validationText&quot;:&quot;&quot;,&quot;valueAsString&quot;:&quot;&quot;,&quot;lastSetTextBoxValue&quot;:&quot;&quot;}"></span>
					</span></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="search_btn">
		<span id="ctl00_ContentPlaceHolder1_btnSearch"
			class="RadButton RadButton_ rbSkinnedButton btn_src" idx="0"
			tabindex="0"><input class="rbDecorated" type="submit"
			name="ctl00$ContentPlaceHolder1$btnSearch"
			id="ctl00_ContentPlaceHolder1_btnSearch_input" value="검색"
			tabindex="-1"><input
			id="ctl00_ContentPlaceHolder1_btnSearch_ClientState"
			name="ctl00_ContentPlaceHolder1_btnSearch_ClientState" type="hidden"
			autocomplete="off"></span>
	</div>
</div>


<table class="table table-striped"
	style="font-weight: normal; font-size: 1.3em;">
	<thead>
		<tr id="ctl00_ContentPlaceHolder1_RadGridIncome_ctl00__0"
			style="white-space: nowrap;">
			<td>선택</td>
			<td>급여코드</td>
			<td>급여액</td>
			<td>공제액</td>
			<td class="col_ct">비고</td>
			<td class="col_ct">급여일</td>
			<td>&nbsp;</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${paymentList}" var="paymentVo">
			<tr class="rgRow"
				id="ctl00_ContentPlaceHolder1_RadGridIncome_ctl00__0"
				style="white-space: nowrap;">
				<td class="col_ct"><input type="checkbox"></td>
				<td class="col_ct"><a href="#">${paymentVo.payCode}</a></td>
				<td>${paymentVo.totalWage}</td>
				<td>${paymentVo.totalSalary}</td>
				<td class="col_ct">${paymentVo.relate}</td>
				<td class="col_ct">${paymentVo.payDay}</td>
				<td>&nbsp;</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

