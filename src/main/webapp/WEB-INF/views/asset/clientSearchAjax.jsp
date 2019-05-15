<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${clientList }" var="vo">
	<tr class="clientTr" data-clientnm="${vo.clientName }">
		<td>${vo.clientCode}</td>
		<td>${vo.clientName}</td>
	</tr>
</c:forEach>

<script>
	/*거래처선택 */
	$(".clientTr").on("click", function() {
		var clientName = $(this).data("clientnm");

		$("#clientN").val(clientName);
		$("#clientName").val(clientName);
		
	});
</script>