<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center>
<div class="form-group overScroll" style="overflow: scroll; height: 500px;">
	<table class="table table-sm table-hover">
		<thead>
			<tr>
				<td>계정과목코드</td>
				<td>계정과목명</td>
				<td>유형</td>
			</tr>
		</thead>
			
		<tbody>
			<c:forEach items="${searchResultData }" var="data">
				<tr class="establishTr" data-escode="${data.establishCode }"
										data-esname="${data.establishNameKor }">
					<td>${data.establishCode }</td>
					<td>${data.establishNameKor }</td>
					<td>${data.status}</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
</div>
</center>

<script>
	
	$(".establishTr").on("click", function(){
		var establishData = $(this).data().escode + "_" +  $(this).data().esname ;
		
		$("#searchEstablishValue").val(establishData);
		$("#selectEstablishValue").val(establishData);
		
	});
</script>