<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-group">
				<h2>
					<strong><i class="fa fa-calculator"></i>급여 전표 입력</strong>
				</h2>
			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-group">
				<form id="insertSlipFrm" action="/writeSlipPayment" method="post">
					<input type="hidden" name="paydayMonth" value="${paydayMonth}">
					<table class="table table-striped">
						<thead class="thead">
							<tr>
								<th>계정과목</th>
								<th>거래처</th>
								<th>부서</th>
								<th>적요</th>
								<th>차변</th>
								<th>대변</th>
							</tr>
						</thead>
						<tbody id="mainPaymentListTbody">
							<c:forEach var="i" begin="0" end="${fn:length(deptList)-1}">
								<tr>
									<td><input name="establishCode"
										value="${establish[i].establishCode}" type="hidden" />${establish[i].establishNameKor}</td>
									<td><input name="clientCard" value="기타" type="hidden" />기타</td>
									<td>${deptList[i]}</td>
									<td>급여</td>
									<td><input class="debitText form-control" name='price'
										type="text" value="${totalSalary[i]}" /></td>
									<c:set var="allSalary" value="${allSalary+totalSalary[i]}" />
									<td><input name="status" value="0" type="hidden" />0</td>
								</tr>
							</c:forEach>

							<c:forEach var="i" begin="0"
								end="${fn:length(divList)*fn:length(deptList)-1}">
								<c:set var="divCheck" value="false" />
								<c:forEach items="${divList}" var="vo">
									<c:if test="${vo.deductCode==detail4Slip[i].deductCode}">
										<c:set var="deductName" value="${vo.deductName }" />
										<c:set var="divCheck" value="true" />
									</c:if>
								</c:forEach>
								<c:if test="${divCheck==true}">
									<tr>
										<td><input name="establishCode" value="254" type="hidden" />예수금</td>
										<td><input name="clientCard" value="기타" type="hidden" />기타</td>
										<td>${detail4Slip[i].deptname}</td>
										<td>${deductName}</td>
										<td><input name="status" value="1" type="hidden" />0</td>
										<td><input class="creditText form-control" name='price'
											type="text" value="${detail4Slip[i].deductPay}" /></td>
										<c:set var="allWage"
											value="${allWage+detail4Slip[i].deductPay}" />
									</tr>
								</c:if>
							</c:forEach>
							<tr>
								<td><input name="establishCode" value="103" type="hidden" />보통예금</td>
								<td><input name="clientCard" value="은행" type="hidden" />신한은행</td>
								<td>전체</td>
								<td>실지급액</td>
								<td><input name="status" value="1" type="hidden" />0</td>
								<td><input type="text" name='price'
									class="creditText form-control" value="${allSalary-allWage}" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"></td>
								<td><input class="form-control" name="total" id="allDebit"
									type="text" readonly="readonly" value="${allSalary}" /></td>
								<td><input class="form-control" id="allCredit" type="text"
									readonly="readonly" value="${allSalary}" /></td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
			<input style="margin-left: auto !important; background-color: #6E6867;"
				class="btn btn-info" id="submitBtn" value="전표 등록" type="button" />
		</div>
	</div>
	

<!-- <div class="container">
	<div class="row">
				<form action="/paymentPersonalExceldown" id="personalFrm">
				<button style="margin-left: 705px; background-color: #6E6867;"
					class="btn btn-info">Excel</button>
				</form>
	</div>
</div> -->

<script>
	var allDebit,allCredit;
	$(document).ready(function(){
		allDebit=$("#allDebit").val();
		allCredit=$("#allCredit").val();
		$(".debitText").on("change",function(){
			allDebit=0;
			$('.debitText').each(function(){
				allDebit+=parseInt($(this).val());
			});
			$("#allDebit").val(allDebit);
		});
		$(".creditText").on("change",function(){
			allCredit=0;
			$('.creditText').each(function(){
				allCredit+=parseInt($(this).val());
			});
			$("#allCredit").val(allCredit);
		});
	});
	$("#submitBtn").click(function(){
		if(allDebit!=allCredit){
			alert("차변과 대변이 일치하지 않습니다.");
			return false;
		}else if(!confirm("전표를 등록하시겠습니까?"))
			return false;	
		$("#insertSlipFrm").submit();
	})
</script>
