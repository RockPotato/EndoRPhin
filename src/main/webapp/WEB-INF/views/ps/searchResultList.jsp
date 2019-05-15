<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${taxList }" var="list">
	<tr>
		<td> <fmt:formatDate value="${list.slipDate }" pattern="yy/MM/dd"/> </td>
		<td>${list.salesStatus }</td>
		<td class="searchSupplyValue" id="searchSupplyValue">${list.supplyValue }</td>
		<td class="searchSurtax" id="searchSurtax">${list.surtax }</td>
		<td class="searchSumValue" id="searchSumValue">${list.sumValue }</td>
		<td>${list.clientName }</td>
	</tr>

</c:forEach>


==
	<tr>
		<td colspan="2">합계</td>
		<td style="font-weight: bold;" id="setSumSupplyValue">d</td>
		<td style="font-weight: bold;" id="setSurtax">d</td>
		<td style="font-weight: bold;" id="setSumSumValue">d</td>
		<td></td>
	</tr>


	