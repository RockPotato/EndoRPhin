<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${assetList }" var="vo">	
	 <tr>
		 <c:set var="dates" >
			<fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy/MM/dd" />
		</c:set>
		<td><a class="bttn-stretch bttn-warning detailView" href="#deptDetail" data-assetcode="${vo.assetCode }" 
													 data-acquisitiondate="${vo.acquisitionDate }"
													 data-purchasecode="${vo.purchaseCode }"
													 data-sanggakway="${vo.sanggakWay }"
													 data-acquisitionprice="${vo.acquisitionPrice }"
													 data-accountname="${vo.accountName }"
													 data-clientname="${vo.clientName }"  
													 data-assetname="${vo.assetName }"
													 data-residualvalue="${vo.residualvalue }"
													 data-jukyo="${vo.jukyo }"
													 data-sanggakcode="${vo.sanggakCode }"
													 data-depreciation="${vo.depreciation }"
													 data-accumulated="${vo.accumulated }" 
													 data-toggle="modal">${vo.assetCode }</a></td>
					<c:set var = "sum" value = "${sum+vo.acquisitionPrice/1.1 }" />
					<td>${vo.assetName }</td>	
					<td>${vo.accountName }</td>								
		<td><fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy-MM-dd"/></td>
		<td><fmt:formatNumber value="${vo.acquisitionPrice }" pattern="#,###"/></td>
		<td><c:if test="${vo.jangbu == null}">
		<a class="bttn-stretch bttn-warning apply" data-assetcode1="${vo.assetCode }" 
														data-acquisitionprice1="${vo.acquisitionPrice }"
														data-acquisitiondate1="${dates }"
														data-clientname1="${vo.clientName }"
														data-sanggakcode1="${vo.accountName }"
														data-jukyo1="${vo.jukyo }"
													    data-purchasecode1="${vo.purchaseCode }">장부반영</a>
														
		</c:if></td>
 		</tr>
 	<div id="insertArea"></div>
</c:forEach>

<script>
/* 등록 클릭했을 때 */
function fn_detail(){
		$.ajax({
			url : "${pageContext.request.contextPath}/getAssetInsertBtn",
			success : function(data){
				$("#insertArea").html(data);	
				$("#assetCode").focus();
			}
		});
	} 

/* 상세보기  */
$(".detailView").on("click", function(){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/getAssetModifyBtn",
			data : "assetCode="+ $(this).data().assetcode,
					
			
			success : function(data){
				$("#insertArea").html(data);	
				$("#assetCode").focus();
				$("#assetCode").val($(this).data().assetcode);
				$("#purchaseCode").val($(this).data().purchasecode);
				$("#sanggakWay").val($(this).data().sanggakway);
				$("#acquisitionPrice").val($(this).data().acquisitionprice);
				$("#acquisitionDate").val($(this).data().acquisitiondate);
		}
	});
});

/* 장부반영 */
$(".apply").on("click",function(){
	var acquisitionPrice = $(this).data().acquisitionprice1;
	
	var supplyValue = parseInt(parseInt(acquisitionPrice)/1.1);
	var surtax 	 	= parseInt(acquisitionPrice - supplyValue);
	
	var sumValue	= supplyValue + surtax;
	$.ajax({
		url:"${pageContext.request.contextPath}/applyTax_cal",
		data : "acquisitionPrice="+supplyValue
				+"&"+"acquisitionDate="+$(this).data().acquisitiondate1
				+"&"+"surtax="+surtax
				+"&"+"sumValue="+sumValue
				+"&"+"jukyo="+$(this).data().jukyo1
				+"&"+"establishCode="+$(this).data().sanggakcode1
				+"&"+"clientName="+$(this).data().clientname1
				+"&"+"purchaseCode="+$(this).data().purchasecode1
				+"&"+"assetCode="+$(this).data().assetcode1,
				
		success:function(data){
			alert("장부반영이 완료되었습니다.");
			location.replace('/taxcalview');
				
		}
	});
});

</script>