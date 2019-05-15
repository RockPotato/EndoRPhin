<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center>
	<table class="table table-hover table-sm">
    	<thead>
    		<tr>
    			<td>부서코드</td>
    			<td>부서이름</td>
    		</tr>
    	</thead>
    	
    	<tbody>
    		<c:forEach items="${deptList }" var="dept">
    		<tr class="deptData" data-deptname="${dept.deptName }" data-deptcode="${dept.deptCode }">
    			<td>${dept.deptCode }</td>
    			<td>${dept.deptName }</td>
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
</center>


   <script>
    
    // 테이블 Tr클릭 시
    $(".deptData").click(function(){
    	var value = $(this).data("deptname");
    	var codeValue = $(this).data("deptcode");
    	
    	fn_clickTrAction(value, codeValue);
    });
    
    
    
    
    
    
    
// function
    
    /*tr 클릭 시, valueArea영역에 값 복사하기*/
    function fn_clickTrAction(value, codeValue){
    	$("#dept_valuehArea").val(value);
    	$("#insertDept").val(value);
    	$("#insertDeptCode").val(codeValue);
    }
    
    </script>