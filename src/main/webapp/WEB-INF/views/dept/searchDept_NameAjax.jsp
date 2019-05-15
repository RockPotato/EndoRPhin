<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${deptList }" var="vo">	
 <tr>
	<td><input type="checkbox" name="checkRow" value="${vo.deptCode }" ></td>
	<td><a class="detailView" href="#deptDetail" data-upd_deptcode="${vo.deptCode }" 
												 data-upd_deptname="${vo.deptName }"
												 data-upd_companycode="${vo.companyCode }"
												 data-upd_usestatus="${vo.useStatus }"
												 data-toggle="modal">${vo.deptCode}</a></td>
												
	<td>${vo.deptName }</td>
	<td>${vo.companyCode }</td>
	<c:choose>
		<c:when test="${vo.useStatus == 1}">
			<td>사용</td>
		</c:when>
		<c:otherwise>
			<td><font color="red"> 미사용</font></td>
		</c:otherwise>
	</c:choose>
	<td></td>
	</tr>		 
</c:forEach>
