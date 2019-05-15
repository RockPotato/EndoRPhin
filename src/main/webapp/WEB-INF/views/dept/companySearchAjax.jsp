<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach items="${companyList }" var="vo">
		<tr class="companyTr" data-selcompanycode="${vo.companyCode }"
			>
			<td>${vo.companyCode}</td>
			<td>${vo.companyName}</td>
		</tr>
	</c:forEach>

<script>
$(".companyTr").on("click", function(){
	var companyCode1 = $(this).data().selcompanycode;
	$("#selcompany").val(companyCode1);
	$("#companyCode").val(companyCode1);
});
	</script>