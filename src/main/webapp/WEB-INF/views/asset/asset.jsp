<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3><i class="fa fa-calculator" style="margin-top: 30px"></i>고정자산 등록</h3>	
		<table style="margin-top: 20px">
			<tr>
				<td>
					<div class="input-group">
						<span  class="input-group-text">고정자산 코드</span>
						<input class="form-control" name="assetCodeS" id="assetCodeS"  onkeydown="Enter_Check();"style="width: 250px;" />
						<input type="button" id="seachBtn" value="검색" class="btn btn-secondary btn-sm" />
					</div>
				</td>
				</tr>
		</table>
		<table class="table table-striped"  style="margin-top: 20px">
			<thead class="thead">
				<tr>
					<th>자산코드</th>
					<th>계정명</th>
					<th>자산명</th>
					<th>취득일</th>
					<th>취득가액</th>
					<th>장부반영</th>
				</tr>
			</thead>	
			<tbody id="assetListTbody">
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
			</tbody>
			<tfoot align="center" >
				<tr>
					<td colspan="2">부가세 대급금 </td>
					<td colspan="2"><fmt:formatNumber value="${sum}" pattern="#,###"/>원</td>
				</tr>
			</tfoot>
		</table>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" onclick="fn_detail();">등록</button>
		</div>
	</div>
</div>

<!-----------------계정과목 검색 모달창 ---------------->	
<div class="modal fade" id="my80sizeModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">		
		<div class="modal-content modal-80size">
          <div class="modal-header" style="background:#6C757D; height: 50px" >
			<h6 style="color: #ffffff;">| 계정과목 조회</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		  </div>
			<div class="modal-body" align="center">
			<table>
				<thead>
					<tr>
						<th>계정과목명&nbsp;&nbsp;&nbsp;
							<input type="text" id="establishNameKor" name="establishNameKor" onkeydown="Enter_Check();">
							<button type="button" class="btn btn-secondary btn-sm" id="searchE_Btn" >검색</button></th>
					</tr>
					<tr>
						<th>선택된 계정과목명
							<input type="text" id="sel_account"   style="width: 145; " >
							<button type="button" class="btn btn-secondary btn-sm buttons"  data-dismiss="modal">확인</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:650px; height:230px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>계정코드</th>
						<th>중분류명</th>
						<th>계정과목명</th>
				</thead>
				<tbody id="establishTbody">
				<c:forEach items="${establishList }" var="vo">
					<tr class="establishTr" data-establishnmkor="${vo.establishNameKor }">
						<td>${vo.establishCode}</td>
						<td>${vo.status}</td>
						<td>${vo.establishNameKor}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
			</div>
		</div>
	</div>
</div>
<!----------------- 거래처명 검색 모달창 ---------------->	
<div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header" style="background:#6C757D; height: 50px" >
			<h6  style="color: #ffffff;">| 거래처 조회</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
		  </div>
			<div class="modal-body" align="center">
			<table>
				<thead>
					<tr>
						<th>거래처명&nbsp;&nbsp;&nbsp;
						<input  type="text" id="cName" name="cName" onkeydown="Enter_Check();">
						<button type="button" class="btn btn-secondary btn-sm" id="searchC_Btn">검색</button></th>
					</tr>
					<tr>
						<th>선택된 거래처명
						<input type="text" id="clientN" style="width: 145; "  >
						<button type="button"  class="btn btn-secondary btn-sm buttons"  data-dismiss="modal">확인</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:650px; height:230px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>코드</th>
						<th>코드명</th>
			
				</thead>
				<tbody id="clinetTbody">
				<c:forEach items="${clientList }" var="vo">
					<tr class="clientTr" data-clientnm="${vo.clientName }">
						<td>${vo.clientCode}</td>
						<td>${vo.clientName}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="modal-footer">
			  <button type="button"class="btn btn-secondary btn-sm buttons" data-dismiss="modal">닫기</button>
			   <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
			</div>
		</div>
	</div>
</div>


<!----------------- 감가상각계정 검색 모달창 ---------------->	
  <div class="modal fade" id="my80sizeModal4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		 <div class="modal-content"> 
          <div class="modal-header" style="background:#6C757D; height: 50px" >
			<h6 style="color: #ffffff;">| 감가상각계정 조회</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		  </div>
			<div class="modal-body" align="center">
			<table>
				<thead>
					<tr>
						<th>감가상각계정명&nbsp;&nbsp;&nbsp;
							<input  class="form-control-sm" type="text" id="sanggakName" name="sanggakName" onkeydown="Enter_Check();">
							<button type="button" class="btn btn-secondary btn-sm"  id="searchS_Btn" >검색</button></th>
					</tr>
					<tr>
						<th>선택된 감가상각계정코드
							<input class="form-control-sm"  style="width: 122; " type="text"  id="sanggakName_s" name="sanggakName_s" onkeydown="Enter_Check();">
							<button type="button"class="btn btn-secondary btn-sm buttons"  data-dismiss="modal">확인</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:650px; height:230px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>계정코드</th>
						<th>중분류명</th>
						<th>계정과목명</th>
				</thead>
					<tbody id="sanggakTbody">
				<c:forEach items="${establishList }" var="vo">
					<tr class="sanggakTr" data-establishcode="${vo.establishCode }">
						<td>${vo.establishCode}</td>
						<td>${vo.status}</td>
						<td>${vo.establishNameKor}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="modal-footer">
			  <button type="button"class="btn btn-secondary btn-sm buttons" data-dismiss="modal">닫기</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
			</div>
		</div>
	</div>
</div>

	<script>
	
	function Enter_Check(){
	       
	    if(event.keyCode == 13){ // 엔터키의 코드는 13입니다.
	    	$("#searchE_Btn").click();  
	    	$("#searchC_Btn").click();  
	    	$("#searchS_Btn").click();  
	    	$("#seachBtn").click();  
	    }
	}
    /*계정과목 검색  */
 	$("#searchE_Btn").on("click", function(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/establishSearch",
 			data : "establishNameKor="+$("#establishNameKor").val(),
 			success : function(data){
 				$("#establishNameKor").val("");
 				$("#establishTbody").html(data);
 			}
  		});
 	});
    
    /* 거래처검색  */
 	$("#searchC_Btn").on("click", function(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/clientSearch",
 			data : "cName="+$("#cName").val(),
 			success : function(data){
 				$("#cName").val("");
 				$("#clinetTbody").html(data);
 			}
  		});
 	});
    /* 감가상각계정 검색  */
 	$("#searchS_Btn").on("click", function(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/sanggakSearch",
 			data : "sanggakName="+$("#sanggakName").val(),
 			success : function(data){
 				$("#sanggakName").val("");
 				$("#sanggakTbody").html(data);
 			}
  		});
 	});
 
     /*계정과목선택 */
	$(".establishTr").on("click", function(){
		
		var establishnamekor = $(this).data("establishnmkor");
		
		$("#sel_account").val(establishnamekor);
		$("#accountName").val(establishnamekor);
		$('.buttons').trigger('click');
	});
	
  	/*거래처선택 */
	$(".clientTr").on("click", function() {
		var clientName = $(this).data("clientnm");

		$("#clientN").val(clientName);
		$("#clientName").val(clientName);
		$('.buttons').trigger('click');
	});
	
 	/*감가 상각선택 */
 	$(".sanggakTr").on("click", function() {
 		var sanggakCode = $(this).data("establishcode");

 		$("#sanggakName_s").val(sanggakCode);
		$("#sanggakCode").val(sanggakCode);
 	});
     
   
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
	/*코드 검색  */
	$("#seachBtn").on("click",function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/assetSearch",
			data : "assetCodeS="+$("#assetCodeS").val(),
		
			success : function(data){
				$("#assetCodeS").val("");
				$("#assetListTbody").html(data);
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
	

 	
