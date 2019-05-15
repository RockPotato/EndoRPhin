<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${dateList_p }" var="vo">
	<c:set var="date"><fmt:formatDate value="${vo.slipDate  }" pattern="yyyy-MM-dd" /></c:set>
		<tr>
			<td><input type="checkbox" name="checkRow" value=${vo.slipNumber }></td>
			<td><a class="bttn-stretch bttn-md bttn-warning detailView detailView" href="#deptDetail" data-slipnumber="${vo.slipNumber }" 
														 data-slipdate="${date }" 
														 data-jukyo="${vo.jukyo }"
														 data-total="${vo.total }"
														 data-departmentname="${vo.departmentName }"
														 data-toggle="modal">${vo.slipNumber}</a></td>
														
			<td><fmt:formatDate value="${vo.slipDate }" pattern="yyyy-MM-dd"/></td>
			<td>${vo.jukyo }</td>
			<td>${vo.total }</td>
			<td>${vo.departmentName }</td>
		</tr>	
</c:forEach>

================seperator================
<%-- <c:set var="lastPage" value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />


<nav style="text-align:center;">
	<ul class="pagination">
		<c:choose>
			<c:when test="${page == 1 }">
				<li class="disabled">
					<a aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:when>	
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath }/searchAjax_p" aria-label="Previous"></a>
				<span aria-hidden="true">&laquo;</span>
			</li>
		</c:otherwise>		
		</c:choose>
		
		<c:forEach begin="1" end="${lastPage }" var="i">
			<c:set var="active" value="" />
			 <c:if test="${i == page }" >
			 	<c:set var ="active" value="active"/>
			 </c:if>
			 
			 <li class="${active }">
			 	<a href="javascript:paaprovuarPageList(${i})">${i}</a>
			 </li>
		</c:forEach>
	<c:choose>
		<c:when test="${page == lastPages }" >
			<li class="disabled">
			<a aria-labe="Next">
			<span aria-hidden="true">&raqua;</span>
			 </a></li>
		</c:when>
		<c:otherwise>
			<li><a href="javascript:paaprovuarPageList(${lastPage })" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</nav> --%>