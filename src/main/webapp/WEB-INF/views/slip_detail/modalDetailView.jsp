<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${data }" var="data">
	<tr>
		<td><input class="form-control font6" type="text" value="000${data.slipDetailNo }" readonly/></td>
		<td><input class="form-control font6" type="text" value="${data.establishCode }" readonly /></td>
		<td><input class="form-control font6" type="text" value="${data.clientCard }" readonly /></td>
		<c:choose>
			<c:when test="${data.status  == 0 }">
				<td><input class="form-control left" type="text" value="${data.price }" readonly/></td>
				<td><input class="form-control" type="text" readonly/></td>
			</c:when>

			<c:otherwise>
				<td><input class="form-control" type="text" readonly/></td>
				<td><input class="form-control right" type="text" value="${data.price }" readonly/></td>
			</c:otherwise>
		</c:choose>
	</tr>
</c:forEach>
