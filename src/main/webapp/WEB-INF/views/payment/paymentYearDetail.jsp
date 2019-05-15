<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.payment.model.Payment_detailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10" >
	<div class="form-group">
		<table class="table table-striped">
			<thead class="thead">
				<tr style="font-size: 2px;">
					<th>사번</th>
					<th>성명</th>
					<th>직위</th>
					<th>부서명</th>
					<th>지급일</th>
					<c:forEach items="${divList}" var="vo">
						<th>${vo.deductName}</th>
					</c:forEach>
					<th>총급여액</th>
					<th>총공제액</th>
					<th>총지급액</th>
				</tr>
			</thead>
			<tbody id="mainPaymentListTbody">
				<c:forEach step="1" items="${payList}" varStatus="index" var="payVo">
					<tr class='mainTr' style="font-size: 10px;">
						<td>${payVo.userId }</td>
						<td>${payVo.usernm }</td>
						<td>${payVo.positionname }</td>
						<td>${payVo.deptname }</td>
						<td>${payVo.payDay }</td>
						<c:forEach items="${paymentDetailList[index.index]}" var="vo">
							<td><fmt:formatNumber value="${vo.deductPay}" pattern="#,###" /></td>
						</c:forEach>
						<td><fmt:formatNumber value="${payVo.totalSalary}" pattern="#,###" /></td>
						<td><fmt:formatNumber value="${payVo.totalWage}" pattern="#,###" /></td>
						<td><fmt:formatNumber value="${payVo.totalSalary-payVo.totalWage}" pattern="#,###" /></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr id="mainPaymentListTfoot">
					<td colspan="5" align="center">합계 :</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
</div>

<script>
	$(document).ready(function() {
		var total = new Array();
		$(".thead").children('tr').children('th').each(function(index, item) {
			if (index > 4)
				total.push(0);
		});
		$(".mainTr").each(function() {
			$(this).children('td').each(function(index, item) {
				if (index > 4) {
					total[index - 5] += parseInt($(item).html().replace(/,/gi,""));
				}
			})
		})
		for (var i = 0; i < total.length; i++) {
			$("#mainPaymentListTfoot").append("<td>" + total[i].toLocaleString() + "</td>");
		}
	})
</script>