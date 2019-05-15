<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center> 
    <table class="table table-hover table-sm">
    	<thead>
    		<tr>
    			<td>거래처코드</td>
    			<td>거래처이름</td>
    			<td>사업자번호</td>
    		</tr>
    	</thead>
    	
    	<tbody>
    		<c:forEach items="${clientList }" var="client">
    		<tr class="clientData" data-clientname="${client.clientName }" data-clientcode="${client.clientCode }">
    			<td>${client.clientCode }</td>
    			<td>${client.clientName }</td>
    			<td>${client.salesNumber }</td>
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
</center>
    
    
    <script>
    
    // 테이블 Tr클릭 시
    $(".clientData").click(function(){
    	var value = $(this).data("clientname");
    	var codevalue = $(this).data("clientcode");
    	
    	
    	fn_clickTrAction(value, codevalue);
    });
    
    
    
    
    
    
    
// function
    
    /*tr 클릭 시, valueArea영역에 값 복사하기*/
    function fn_clickTrAction(value, codevalue){
    	$("#client_valuehArea").val(value);
    	$("#insertClient").val(value);
    	$("#insertClientCode").val(codevalue);
    	
    	
    }
    
    </script>