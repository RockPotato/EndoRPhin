<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${companyList }" var="vo">
	<tr class="upd_companyTr" data-upd_selcompanycode="${vo.companyCode }">
		<td>${vo.companyCode}</td>
		<td>${vo.companyName}</td>
	</tr>
</c:forEach>

<script>
		$(".upd_companyTr").on("click", function(){
			
			var companyCode1 = $(this).data().upd_selcompanycode;
			$("#selcompany2").val(companyCode1);
			$("#upd_companyCode").val(companyCode1);
		});
</script>