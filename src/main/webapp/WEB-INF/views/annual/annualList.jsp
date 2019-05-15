<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
select {
	width: 200px;
}
</style>

<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10" style="width: 100%">

		<div class="form-group">
			<h2>
				<strong><i class="fa fa-book"></i> 연차 이력 등록</strong>
			</h2>
		</div>


		<form action="${cp}/attitude/searchAttitude">
			<table class="table table-hover">
				<thead class="thead">
					<tr>
						<th><select id="thisYear" name="thisYear" class="form-control">

								<%
									Calendar calList = Calendar.getInstance();
									calList.get(calList.YEAR);
								%>

								<option value="">전체년도</option>
								<option value="<%=calList.get(calList.YEAR)%>"><%=calList.get(calList.YEAR)%></option>
								<option value="<%=calList.get(calList.YEAR) - 1%>"><%=calList.get(calList.YEAR) - 1%></option>
								<option value="<%=calList.get(calList.YEAR) - 2%>"><%=calList.get(calList.YEAR) - 2%></option>
								<option value="<%=calList.get(calList.YEAR) - 3%>"><%=calList.get(calList.YEAR) - 3%></option>
								<option value="<%=calList.get(calList.YEAR) - 4%>"><%=calList.get(calList.YEAR) - 4%></option>
						</select></th>
						<th>직원명 <input id="annualName" type="text" name="search" class="form-control" placeholder="Search"></th>
						<th><button id="searchAnnual" type="button"
								style="background-color: #6E6867;" class="btn btn-info">검색</button>
						</th>
					</tr>
				</thead>
			</table>
		</form>

	</div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10" style="width: 100%;">
		<div class="form-group">
			<table class="table table-hover" style="text-align: center;">
				<thead class="thead">
					<tr>
						<th>체크</th>
						<th>적용년도</th>
						<th>사원번호</th>
						<th>성명</th>
						<th>부서명</th>
						<th>근속년수</th>
						<th>연차발생일자</th>
						<th>발생연차수</th>
						<th>연차사용일수</th>
						<th>잔여연차</th>
					</tr>
				</thead>
				<tbody id="mytbody">
					<c:forEach items="${allAnnual}" var="allAnnual">
						<tr class="boardTr" data-userId="${allAnnual}">

							<td><input type="checkbox" name="check"
								style="width: 30px; height: 30px;"></td>
							<td>${allAnnual.year }</td>
							<td>${allAnnual.userid }</td>
							<td>${allAnnual.usernm }</td>
							<td>${allAnnual.deptname }</td>
							<td>${allAnnual.continuousYear }</td>
							<td>${allAnnual.annualdate }</td>
							<td>${allAnnual.occurannual }</td>
							<td>${allAnnual.userdate }</td>
							<td>${allAnnual.residual }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

                              
<!--  연차 이력 등록 -->

	<div class="row">
		<div class="col-md-1"></div>		
		<div class="col-md-8" style="width: 100%">

			<button style="background-color: #6E6867;" class="btn btn-info"
				id="cancleBtn">연차 이력 삭제</button>
		</div>
		<div class="col-md-1">
			<button style="background-color: #6E6867;"
				class="btn btn-info" data-toggle="modal" data-target="#annualInsert">신규등록</button>
				</div>
				<div class="col-md-1">
			<a href="${cp}/annual/AnnualInsertAuto"><button style="background-color: #6E6867;"
				class="btn btn-info">자동등록</button></a>
	</div>
	</div>
                                          

<!--  연차 이력 등록 모달창 실행  -->
<%@ include file="annualInsert.jsp"%>
<!--  연차 이력 등록 모달창 종료  -->
<!--  사원불러오기  모달창 실행  -->
<%@ include file="emplLoading.jsp"%>
<!--  사원불러오기 모달창 종료  -->




<script>
	
	//연차 이력 검색
	$("#searchAnnual").click(function() {
		
		
		
		 var Annualchecked = new Array();
		
		var annualselect = $("#thisYear option:selected").val();
		var userName = $("#annualName").val();  
		
		Annualchecked.push(annualselect);
		Annualchecked.push(userName);
		
		var annualSearch = Annualchecked;
		$("#annualSearch").val(annualSearch);
		$("#frmAnnual").submit();
		
		});
	
	
	
	$(document).ready(function() {
		
		
		 //server side 에서 비교
		<c:if test="${msg != null}">
		alert("${msg}");
		</c:if> 
		
		
		 //사용자 tr 태그 클릭시 이벤트 핸들러
		$("#cancleBtn").click(function() {

			var tdArr = new Array();
			var checkbox = $("input[name=check]:checked");
		
			checkbox.each(function(i) {
		
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
			
			var userid =  td.eq(2).text();
			var year   =  td.eq(6).text();
			
			tdArr.push(userid);
			tdArr.push(year);
			
			});
			
			var delete_no = tdArr;
			$("#delete_no").val(delete_no);
			$("#frm").submit();
			
			
		}); 
		

	});
	
		
	</script>


<form id="frm" action="${cp}/annual/deleteAnnual" method="get">
	<input type="hidden" id="delete_no" name="delete_no" />
</form>
<form id="frmAnnual" action="${cp}/annual/annualSearch" method="get">
	<input type="hidden" id="annualSearch" name="annualSearch" />
</form>


</body>
</html>