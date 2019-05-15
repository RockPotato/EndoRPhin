<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
<div class="form-group">
	<table class="table table-hover table-sm">
		<thead>
			<tr>
				<td>거래처코드</td>
				<td>거래처명</td>
				<td>사업자번호</td>
			</tr>
		</thead>
			
		<tbody>
			<c:forEach items="${searchResultClient }" var="data">
				<tr class="clientTr" data-clientcode="${data.clientCode }"
										data-clientname="${data.clientName }">
					<td>${data.clientCode }</td>
					<td>${data.clientName }</td>
					<td>${data.salesNumber }</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
</div>
</center>

<script>
	
	$(".clientTr").on("click", function(){
		var clientData = $(this).data().clientcode + "_" +  $(this).data().clientname;
		
		$("#searchClientValue").val(clientData);
		$("#selectClientValue").val(clientData);
		
	});
</script>