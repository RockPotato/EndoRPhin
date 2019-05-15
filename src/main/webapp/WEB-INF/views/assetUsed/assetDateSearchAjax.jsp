<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${depreciationList }" var="vo">	
	 <tr>
		<td>${vo.assetName }</td>  
		<td>${vo.assetCode }</td>	
		<td><fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy-MM-dd"/></td>
																
					<td>${vo.acquisitionPrice }</td>
					<td>${vo.depreciation }</td>	
					<td>${vo.accumulated }</td>									
		<td>${vo.residualvalue }</td>
		<td>${vo.serviceLife }</td>
			<td><input type="button" value="장부반영" id="applybtn" name="applybtn" onclick="apply_click()"/></td>
	 </tr>
</c:forEach>