<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.payment.model.Payment_detailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row">
	<div class="col-md-11" style="width: 100%; margin-left: 20px;">
		<div class="form-group">
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<th>사번</th>
						<th>성명</th>
						<th>부서명</th>
						<c:forEach items="${divList}" var="vo">
							<th>${vo.deductName}</th>
						</c:forEach>
						<th>총급여액</th>
						<th>총공제액</th>
						<th>총지급액</th>
					</tr>
				</thead>
				<tbody id="mainPaymentListTbody">
					<c:forEach step="1" items="${payList}" varStatus="index"
						var="payVo">
						<tr class='mainTr'>
							<td>${payVo.userId }</td>
							<td>${payVo.usernm }</td>
							<td>${payVo.deptname }</td>
							<c:forEach items="${divList}" var="vo">
								<c:set var="divcheck" value="false" />
								<c:forEach items="${paymentDetailList}" var="pdList">
									<c:forEach items="${pdList}" var="pdvo">
										<c:if
											test="${vo.deductCode==pdvo.deductCode and payVo.payCode==pdvo.payCode}">
											<td><fmt:formatNumber value="${pdvo.deductPay}" pattern="#,###" /></td>
											<c:set var="divcheck" value="true" />
										</c:if>
									</c:forEach>
								</c:forEach>
								<c:if test="${divcheck==false}">
									<td>0</td>
								</c:if>
							</c:forEach>
							<td><fmt:formatNumber value="${payVo.totalSalary}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${payVo.totalWage}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${payVo.totalSalary-payVo.totalWage}" pattern="#,###" /></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr id="mainPaymentListTfoot">
						<td colspan="3" align="center">합계 :</td>
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
			if (index > 2)
				total.push(0);
		});
		$(".mainTr").each(function() {
			$(this).children('td').each(function(index, item) {
				if (index > 2) {
					total[index - 3] += parseInt($(item).html().replace(/,/gi,""));
				}
			})
		})
		for (var i = 0; i < total.length; i++) {
			$("#mainPaymentListTfoot").append("<td>" + total[i].toLocaleString() + "</td>");
		}
	})
</script>