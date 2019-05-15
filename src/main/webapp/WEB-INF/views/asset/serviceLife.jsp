<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${straight }" var="str" >
      <tr>
     	 <td><label class="number"></label></td>
     	 <td>${str.key }</td>
    	 <td>${str.value }</td>
	  </tr>      
</c:forEach>

<script>
	
	$("document").ready(function(){
		$(".number").each(function(index,item){
			$(item).html(index+2);
		});
	});
</script>

