<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${establishList }" var="vo">
	<tr>
		<td><input type="checkbox" name="checkRow"
			value="${vo.establishCode }"></td>
		<td><a class="bttn-stretch bttn-md bttn-warning detailView"
			href="#esDetail" data-establishcode="${vo.establishCode }"
			data-establishnamekor="${vo.establishNameKor}"
			data-establishnameeng="${vo.establishNameEng}"
			data-status="${vo.status}" data-toggle="modal">${vo.establishCode}</a></td>
		<td>${vo.establishNameKor}</td>
		<td>${vo.establishNameEng}</td>
		<td>${vo.status}</td>
		<c:choose>
			<c:when test="${vo.useStatus == 1 }">
				<td><font color="blue">사용가능</font></td>
			</c:when>

			<c:otherwise>
				<td><font color="red">거래불가</font></td>
			</c:otherwise>
		</c:choose>
	</tr>
</c:forEach>
