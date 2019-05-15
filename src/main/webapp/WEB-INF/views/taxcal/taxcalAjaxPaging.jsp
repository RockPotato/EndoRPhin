<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
   	<c:forEach items="${tax_calList }" var="vo">
   		
   		<tr class="tax_calTr" data-salescode="${vo.salesCode }" onmouseover="this.style.backgroundColor='#BDBDBD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="text-align: center;">
   		
			<td style="width: 80px;">${vo.salesCode }</td>
			<td style="width: 150px;"><fmt:formatDate value="${vo.slipDate }" pattern="yy/MM/dd"/></td>
			<td class="viewStatus" style="width: 100px;">${vo.salesStatus }</td>
			<td style="width: 120px;">${vo.supplyValue }</td>
			<td style="width: 120px;">${vo.surtax }</td>
			<td style="width: 150px;"><b>${vo.sumValue }</b></td>
			<td style="width: 150px;">${vo.clientName }</td>
			<td style="width: 150px;">${vo.deptCode }</td>
			<td style="width: 150px;">${vo.orderCode }</td>
			<td style="width: 80px;">${vo.auto }</td>
			<td style="width: 80px;">${vo.entryType }</td>
   			
   		</tr>
   	
   	</c:forEach>
   	
   	<script>
	// Tr클릭 시 액션
	$(".tax_calTr").on("click", function(){
		fn_salesDetailView($(this).data().salescode);
	});
	</script>
   	

   	
================seperator================


   	
<c:set var="lastPage"
	value="${Integer(tax_calCnt/pageSize + (tax_calCnt%pageSize > 0 ? 1 : 0))}" />

<c:choose>
	<c:when test="${page == 1 }">
		<li class="disabled"><a class="bttn-minimal bttn-warning" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a class="bttn-minimal bttn-warning" href="${pageContext.request.contextPath }/taxcalview" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>

<c:forEach begin="1" end="${lastPage }" var="i">
	<c:set var="active" value="" />
	<c:if test="${i == page }">
		<c:set var="active" value="active" />
	</c:if>

	<li class="${active }"><a class="bttn-minimal bttn-warning"
		href="javascript:getTax_calPageList(${i})">${i}</a></li>
</c:forEach>


<c:choose>
	<c:when test="${page == lastPage }">
		<li class="disabled"><a class="bttn-minimal bttn-warning" aria-label="Next"> <span
				aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a class="bttn-minimal bttn-warning" href="javascript:getTax_calPageList(${lastPage})"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>