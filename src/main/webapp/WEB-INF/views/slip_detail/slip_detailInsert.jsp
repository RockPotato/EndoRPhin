<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tr>
	<td><input name="slipdate" class="form-control input-sm slipdate" type="text" value="${slipDate }" readonly/></td>
	<td>
		<c:choose>
			<c:when test="${status == 0 }">
				<input type="text" class="form-control input-sm" value="차변" readonly />
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control input-sm" value="대변" readonly />
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="status" value="${status}">
	</td>
	
		<td><input type="text" class="form-control input-sm" value="${establish }" readonly/>
		<input type="hidden" name="establishCode" value="${fn:split(establish,'_')[0]}" readonly/></td>
		<td><input type="text" class="form-control input-sm" value="${client}" readonly/>
		<input type="hidden" name="clientCard" value="${fn:split(client,'_')[1] }" readonly/></td>
		<td><input name="departmentName" class="form-control input-sm departmentName" type="text" value="${dept }" readonly/></td>
		<td><input name="jukyo" class="form-control input-sm slipJukyo" type="text" value="${juckyo }" readonly/></td>
	<td>
		<c:choose>
			<c:when test="${status == 0 }">
				<input name="price" class="form-control input-sm left" type="text" value="${price }" readonly/>
			</c:when>
			<c:otherwise>
				<input name="price" class="form-control input-sm right" type="text" value="${price }" readonly/>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
