<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>거래처 상세정보</h3>
<hr><br />

<table>
	<tr>
		<td><label class="tx">거래처 코드 : </label></td>
		<td><input type="text" id="ccCode" readonly="readonly" /></td>
		
		<td><label class="tx">거래처 이름 : </label></td>
		<td><input type="text" id="ccName" readonly="readonly" /> </td>
	</tr>

	<tr>
		<td><label class="tx">사업자 번호 : </label></td>
		<td><input type="text" id="cSalesNumber" readonly="readonly" /> </td>
		
		<td><label class="tx">대표자 이름 : </label></td>
		<td><input type="text" id="cManager" readonly="readonly" /> </td>
	</tr>
	
	<tr>
		<td><label class="tx">전화번호 : </label></td>
		<td><input type="text" id="cTelephone" readonly="readonly" /></td>
		
		<td><label class="tx">팩스번호 : </label></td>
		<td><input type="text" id="cFaxNumber" readonly="readonly" /></td>
	</tr> 
	
	<tr>
		<td><label class="tx">이메일 주소 : </label></td>
		<td><input type="text" id="cManagerEmail" readonly="readonly" /></td>
		
		<td><label class="tx">업 태 : </label></td>
		<td><input type="text" id="cBusiness" readonly="readonly" /></td>
	</tr> 
	
	<tr>
		<td><label class="tx">소 재 지 : </label></td>
		<td colspan="3"><input style="width: 347px;" type="text" id="cPlace" readonly="readonly" /></td>
	</tr>
	
	<tr>
		<td><label class="tx">비 고 : </label></td>
		<td colspan="3"><input style="width: 347px;" type="text" id="비고" readonly="readonly" /></td>
	</tr>
	
	<tr>
		<td><label class="tx">사업자 유형 : </label></td>
		<td><input type="text" id="cBusinessType" readonly="readonly" /></td>
		
		<td><label class="tx">사업자 상태 : </label></td>
		<td><input type="text" id="cUseStatus" readonly="readonly" /></td>
	</tr>
	
</table>

	<hr><br />
	<h4>은행정보</h4>
<table>
	<tr>
		<td><label class="tx2">은 행 명 : </label></td>
		<td colspan="3"><input style="width: 300px;" type="text" id="cBankname" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><label class="tx2">계 좌 번 호 : </label></td>
		<td colspan="3"><input style="width: 300px;" type="text" id="cAccountNumber" readonly="readonly" /></td>
	</tr>

</table>
	

	




<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>

	$(document).ready(function(){
		var cCode 			= $("#ccCode", opener.document).val();
		var cName 			= $("#ccName", opener.document).val();
		var cSalesNumber 	= $("#cSalesNumber", opener.document).val();
		var cManager		= $("#cManager", opener.document).val();
		var cTelephone		= $("#cTelephone", opener.document).val();
		var cFaxNumber		= $("#cFaxNumber", opener.document).val();
		var cManagerEmail	= $("#cManagerEmail", opener.document).val();
		var cBusiness		= $("#cBusiness", opener.document).val();
		var cPlace			= $("#cPlace", opener.document).val();
		var cRelate			= $("#cRelate", opener.document).val();
		var cBusinessType	= $("#cBusinessType", opener.document).val();
		var cBankname		= $("#cBankname", opener.document).val();
		var cAccountNumber	= $("#cAccountNumber", opener.document).val();
		var cUseStatus		= $("#cUseStatus", opener.document).val();
		
		
		$("#ccCode").val(cCode);
		$("#ccName").val(cName);
		$("#cSalesNumber").val(cSalesNumber);
		$("#cManager").val(cManager);
		$("#cTelephone").val(cTelephone);
		$("#cFaxNumber").val(cFaxNumber);
		$("#cManagerEmail").val(cManagerEmail);
		$("#cPlace").val(cPlace);
		$("#cRelate").val(cPlace);
		$("#cBusinessType").val(cBusinessType);
		$("#cBankname").val(cBankname);
		$("#cAccountNumber").val(cAccountNumber);
		
		
		if(cUseStatus == 0){
			$("#cUseStatus").val("거래불가");
		} else {
			$("#cUseStatus").val("거래가능");
		}
		
	});
	

</script>

</body>
</html>