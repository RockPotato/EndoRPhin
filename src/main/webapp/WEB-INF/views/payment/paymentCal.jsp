<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.input-group-text{
 	color:#fff !important;
 	border-color : #6E6867 !important;
	background-color: #6E6867 !important;
}
</style>
	<div class="row">
		<div class="col-md-1" style="width: 100%">
		</div>
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<h2>
					<strong><i class="fa fa-calculator"></i> 급여명세서</strong>
				</h2>
			</div>
			<form action="/paymentCal" method="get">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th>
								<div class="input-group">
									<span class="input-group-text">년도</span> 
									<select name="paydayYear" class="form-control"></select>
									 <span class="input-group-text">월</span>
									<select name="paydayMonth" class="form-control">
									</select>
								</div>
							</th>
							<th><button class="bttn-fill bttn-md bttn-warning" type="submit">검색</button></th>
					</thead>
				</table>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th>년도</th>
							<th>월</th>
							<th>총급여액</th>
							<th>총공제액</th>
							<th>총지급액</th>
							<th>장부반영</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach items="${paymentList}" var="vo">
							<tr>
								<c:set var="totalSalarySum" value="${totalSalarySum+vo.totalSalary}"/>
								<c:set var="totalWageSum" value="${totalWageSum+vo.totalWage}"/>
								<c:set var="totalResult" value="${totalResult+vo.totalSalary-vo.totalWage}"/>
								<td><a href="#" class="bttn-stretch bttn-md bttn-warning gotoDetail" data-year="${fn:split(vo.payDay,'-')[0]}${fn:split(vo.payDay,'-')[1]}">
								${fn:split(vo.payDay,'-')[0]}</a></td>
								<td>${fn:split(vo.payDay,'-')[1]}</td>
								<td><fmt:formatNumber value="${vo.totalSalary }" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${vo.totalWage}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${vo.totalSalary-vo.totalWage}" pattern="#,###" /></td>
								<c:if test="${vo.deadline!=null}">
									<td class="deadlineCheck">예</td>
								</c:if>
								<c:if test="${vo.deadline==null}">
									<td class="deadlineCheck">아니오</td>
								</c:if>
							<tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" align="center">계</td>
							<td><fmt:formatNumber value="${totalSalarySum}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${totalWageSum}" pattern="#,###" /></td>
							<td colspan="2"><fmt:formatNumber value="${totalResult}" pattern="#,###" /></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
<form action="/paymentYearDetail" id="gotoDetailFrm">
</form>
	<div class="row">
		<div class="col-md-10"></div>
		<select id="deptDivSel">
			<option selected="selected" value="0">회사 전체</option>
			<option value="1">부서별</option>
		</select>
		<button style="background-color: #6E6867;" data-toggle="modal"
			class="btn btn-info" id="cogInputBtn">장부반영</button>
	</div>

<div class="modal" id="myModal" data-backdrop="static" aria-hidden="true" style="display: none; z-index: 1080;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header modalSketchedHeader">
              <h4 class="modal-title" id="secondModalTitle"></h4>
              <button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3>전표 등록 기준</h3>
            	<div style="overflow:scroll; width:450px; height:200px;">
	            	<form action="/gotoSlipInput" id="gotoslipFrm" method="post">
	            	</form>
            	</div>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
              <a href="#" class="btn" id="secondModalAddSave">등록</a>
            </div>
          </div>
        </div>
    </div>

<script>
	$(".gotoDetail").click(function(){
		$("#gotoDetailFrm").append("<input name=\'paydayYear\' type=\'hidden\' value=\'"+$(this).data('year')+"\' />");
		$("#gotoDetailFrm").submit();
	});
	$("#cogInputBtn").on('click',function(){
		if($(".deadlineCheck").html()=='예'){
			alert("이미 반영되었습니다.");
			return false;
		}
		$('#gotoslipFrm').html("<table><thead><tr><th>부서코드</th><th>부서명</th><th>총급여액</th><th>계정과목명</th></tr></thead><tbody id=\'secondModalTbody\'></tbody></table>");
		var paydayMonth =$("select[name=paydayYear]").val()+$("select[name=paydayMonth]").val();
		$.ajax({
			method : "post",
			url : "/getPaymentForSlip",
			data : {
				deptDiv : $("#deptDivSel").val(),
				paydayMonth : paydayMonth
			},
			success : function(data) {
				var establishSelect = "<select name=\'establishSelect\' class=\'establishSelect\'>"
				for (var i = 0; i < data.allEstablish.length; i++) {
					establishSelect +="<option value=\'"+data.allEstablish[i].establishCode+"\'>"+data.allEstablish[i].establishNameKor+"</option>";
				}
				establishSelect += "</select>"
				for (var i = 0; i < data.deptList.length; i++) {
					$('#secondModalTbody').append("<tr>");
					if(data.deptList[i].deptcode==null){
						data.deptList[i].deptcode="999";
						data.deptList[i].deptname="회사전체";
					}
					$('#secondModalTbody').append("<td>"+data.deptList[i].deptcode
							+"<input type=\'hidden\' name=\'deptName\' value=\'"+data.deptList[i].deptname
								+"\' />"+"</td>");
					$('#secondModalTbody').append("<td>"+data.deptList[i].deptname+"</td>");
					$('#secondModalTbody').append("<td>"+data.deptList[i].totalSalary
							+"<input type=\'hidden\' name=\'totalSalary\' value=\'"+data.deptList[i].totalSalary+"\' />"+"</td>");
					$('#secondModalTbody').append("<td>"+establishSelect+"</td>");
					$('#secondModalTbody').append("</tr>");
				}
				for (var i = 0; i < data.payCodeList.length; i++) {
					$("#gotoslipFrm").append("<input type=\'hidden\' name=\'payCode\' value=\'"+data.payCodeList[i].payCode
							+"\' />");
				}
					$("#gotoslipFrm").append("<input type=\'hidden\' name=\'paydayMonth\' value=\'"+paydayMonth
							+"\' />");
			}
		});
		$("#myModal").modal('show');
		
	});
	$(document).ready(function(){
		for (var i = -3; i < 3; i++) {
			$("select[name=paydayYear]").append("<option value="+(new Date().getFullYear()+i)+">"
					+(new Date().getFullYear()+i)+"년</option>");
		}
		for (var i = 1; i <= 12; i++) {
			if(i<10){
				$("select[name=paydayMonth]").append("<option value="+'0'+i+">"
						+i+"월</option>");
			}else
				$("select[name=paydayMonth]").append("<option value="+i+">"
						+i+"월</option>");
		}
		if("${paydayYear}"!=""){
			$("select[name=paydayYear]").val('${paydayYear}');
			$("select[name=paydayMonth]").val('${paydayMonth}');
		}else{
			$("select[name=paydayYear]").val(new Date().getFullYear());
			if(new Date().getMonth()+1<10){
				$("select[name=paydayMonth]").val("0"+(new Date().getMonth()+1));
			}else{
				$("select[name=paydayMonth]").val(new Date().getMonth()+1);
			}
		}
		
			
		$('#secondModalAddSave').click(function(){
			$("#gotoslipFrm").append();
			$('#gotoslipFrm').submit();
		})
	});

</script>
