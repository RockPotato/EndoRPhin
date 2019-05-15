<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
   	<c:forEach items="${establishList }" var="vo">
   	
   		<tr>
   			<td><input type="checkbox" name="checkRow" value="${vo.establishCode }" ></td>
   			<td><a class="bttn-stretch bttn-md bttn-warning detailView" href="#esDetail"  data-establishcode="${vo.establishCode }" 
   														data-establishnamekor="${vo.establishNameKor}" 
   														data-establishnameeng="${vo.establishNameEng}" 
   														data-status="${vo.status}" 
   														data-toggle="modal">${vo.establishCode}</a></td>
   			<td>${vo.establishNameKor}</td>
   			<td>${vo.establishNameEng}</td>
   			<td>${vo.status}</td>
   			<c:choose>
				<c:when test="${vo.useStatus == 1 }">
					<td><font color="blue">사용가능</font></td>
				</c:when>
	
				<c:otherwise>
					<td><font color="red">사용불가</font></td>
				</c:otherwise>
			</c:choose>
   		</tr>
   	
   	</c:forEach>
   	
   	
   	

   	
================seperator================


   	
<c:set var="lastPage"
	value="${Integer(establishCnt/pageSize + (establishCnt%pageSize > 0 ? 1 : 0))}" />

<c:choose>
	<c:when test="${page == 1 }">
		<li class="disabled"><a class="bttn-minimal bttn-md bttn-warning" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="${cp }/establishview" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>

<c:forEach begin="1" end="${lastPage }" var="i">
	<c:set var="active" value="" />
	<c:if test="${i == page }">
		<c:set var="active" value="active" />
	</c:if>

	<li class="${active }"><a class="bttn-minimal bttn-md bttn-warning"
		href="javascript:getEstablishPageList(${i})">${i}</a></li>
</c:forEach>


<c:choose>
	<c:when test="${page == lastPage }">
		<li class="disabled"><a class="bttn-minimal bttn-md bttn-warning" aria-label="Next"> <span
				aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a class="bttn-minimal bttn-md bttn-warning" href="javascript:getEstablishPageList(${lastPage})"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>