<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:forEach items="${list }" var="l">

	<tr>
		<c:choose>
			<c:when test="${l.debit-l.credit >= 0}">
				<td style="text-align: center; font-weight: bold;"><fmt:formatNumber value="${l.debit-l.credit }" pattern="#,###"/></td>
			</c:when>
			<c:otherwise>
				<td style="text-align: center; font-weight: bold;">0</td>
			</c:otherwise>
		</c:choose>
		<td style="text-align: center;"><fmt:formatNumber value="${l.debit }" pattern="#,###"/></td>
		<td style="text-align: center;">${l.establishName }</td>
		<td style="text-align: center;"><fmt:formatNumber value="${l.credit }" pattern="#,###"/></td>
		<c:choose>
			<c:when test="${l.debit-l.credit <= 0}">
				<<td style="text-align: center; font-weight: bold;"><fmt:formatNumber value="${(l.debit-l.credit)*-1 }" pattern="#,###"/></td>
			</c:when>
			<c:otherwise>
				<td style="text-align: center; font-weight: bold;">0</td>
			</c:otherwise>
		</c:choose>
	</tr>

</c:forEach> 