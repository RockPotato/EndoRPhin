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
	<div class="col-md-8" style="width: 100%">

		<div class="form-group">
			<h2>
				<strong><i class="fa fa-book"></i> 근태 항목</strong>
			</h2>
		</div>

		<form action="${cp}/attitude/searchAttitude">
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<th><label>근태명</label></th>
						<th><input class="form-control" type="text" name="search">
						</th>
						<th>
							<button type="submit" style="background-color: #6E6867;"
								class="btn btn-info">검색</button>
						</th>
					</tr>
				</thead>
			</table>
		</form>

	</div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-8" style="width: 100%">
		<div class="form-group">
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<th>선택</th>
						<th>근태코드</th>
						<th>근태명</th>
						<th>유무급</th>
						<th>기준일수</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="mytbody">
					<c:forEach items="${allAttitude}" var="allAttitude">
						<tr class="boardTr" data-userId="${allAttitude.attitudeCode}">
							<td><input type="checkbox" name="check"
								value="${allAttitude.attitudeCode}"
								style="width: 30px; height: 30px;"></td>

							<td><button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#attitudeEdit">${allAttitude.attitudeCode }</button></td>
							<td>${allAttitude.attitudeName }</td>
							<td>${allAttitude.paidStatus }</td>
							<td>${allAttitude.baseDays }</td>
							<td>${allAttitude.relate }</td>
						</tr>
					</c:forEach>
				</tbody>


			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-7">
		<button style="background-color: #6E6867;" class="btn btn-info"
			id="cancleBtn">근태항목삭제</button>
	</div>
	<div class="col-md-3">
		<button style="background-color: #6E6867;" class="btn btn-info"
			data-toggle="modal" data-target="#attitudeInsert">신규등록</button>
	</div>
</div>


<!--  근태 항목 등록 모달창 실행  -->
<%@ include file="attitudeInsert.jsp"%>

<!--  근태 항목 등록 모달창 종료  -->

<!--  근태 항목 등록 모달창 실행  -->
<%@ include file="attitudeEdit.jsp"%>

<!--  근태 항목 등록 모달창 종료  -->


<script>
	
	/*근테정보 수정하기*/
	$("#mytbody").on("click", ".boardTr", function(){
		$.ajax({
			url			: "${pageContext.request.contextPath }/attitude/updateAttitude" ,
			method		: "get",
			data		: "userId="+$(this).data().userid,
			success		: function(searchAttitude) {
				 $("#attitudeCodeE").val(searchAttitude.attitudeCode); 
				 $("#attitudeNameE").val(searchAttitude.attitudeName);
		         $("#paidStatusE").val(searchAttitude.paidStatus);
				 $("#baseDaysE").val(searchAttitude.baseDays);
				 $("#relateE").val(searchAttitude.relate);
				 
			} 
		});
	});
	
	/*코드중복체크*/
	$("#emplCheck").on("click", function(){
		$.ajax({
			url			: "${pageContext.request.contextPath }/attitude/AttitudeIdAjax" ,
			method		: "post",
			data		: "userId="+$("#attitudeCode").val(),
			success		: function(userIdCode) {
				transDupl(userIdCode);
				
			}
		});
	});
	var duplicateCode = "";
	
	function transDupl(userIdCode){
		if(userIdCode == 1){
			insertFlag = "1";
			duplicateCode = "<b><font color='blue'>사용가능한 직책/직급 코드 입니다. </font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (userIdCode == 0){
			duplicateCode = "<b><font color='red'>중복된 직책/직급 코드 가 있습니다.</font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (userIdCode == "WS"){
			duplicateCode = "<b><font color='red'>직책/직급 코드를 입력하세요.</font></b>";
			$("#duplicate").html(duplicateCode);
		}
		
	}
	
	$(document).ready(function() {
		
		 //server side 에서 비교
		<c:if test="${msg != null}">
		alert("${msg}");
		</c:if> 
		
		 //사용자 tr 태그 클릭시 이벤트 핸들러
		$("#cancleBtn").click(function() {

			$('input:checkbox[name="check"]:checked').each(function() {
				var delete_no = $(this).val();
				$("#delete_no").val(delete_no);
				$("#frm").submit();
			
			});

		}); 
	});
	</script>


<form id="frm" action="${cp}/attitude/deleteAttitude" method="get">
	<input type="hidden" id="delete_no" name="delete_no" />
</form>

</body>
</html>