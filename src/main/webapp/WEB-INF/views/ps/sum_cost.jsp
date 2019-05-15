<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:forEach items="${list }" var="l">
	<tr>
		<td style="text-align: center;">$</td>
		<c:choose>
			<c:when test="${l.status == 0 }">
				<td style="text-align: center;"><fmt:formatNumber value="${l.price }" pattern="#,###"/></td>
				<td style="text-align: center;">${l.establishCode }</td>
				<td style="text-align: center;"></td>
			</c:when>
			<c:otherwise>
				<td style="text-align: center;"></td>
				<td style="text-align: center;">${l.establishCode }</td>
				<td style="text-align: center;"><fmt:formatNumber value="${l.price }" pattern="#,###"/></td>
			</c:otherwise>
		</c:choose>
		<td style="text-align: center;">11111</td>
	</tr>

</c:forEach> 