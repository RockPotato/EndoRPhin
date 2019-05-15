<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${establishList }" var="vo">
	<tr class="sanggakTr" data-establishcode="${vo.establishCode }">
		<td>${vo.establishCode}</td>
		<td>${vo.status}</td>
		<td>${vo.establishNameKor}</td>
	</tr>
</c:forEach>
<script>
	
/*감가 상각선택 */
	$(".sanggakTr").on("click", function() {
		var sanggakCode = $(this).data("establishcode");

		$("#sanggakName_s").val(sanggakCode);
		$("#sanggakCode").val(sanggakCode);
		
	});
</script>