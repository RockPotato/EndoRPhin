<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계정과목 검색</title>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
</head>
<body>
	<input type="hidden" value="${check}" id="check"/>
	<form action="/searchEstablish" id="searchFrm" method="post">
		<table>
			<tr>
				<td>과목명 검색 :</td>
				<td><input type="text" class="search-query form-control"
					id="searchPay" name="establishNameKor" placeholder="Search" /></td>
				<td>
				<input class="search-query form-control" type="submit" value="검색" />
				</td>
			</tr>
		</table>
	</form>
	<div style="overflow: scroll; height: 500px;">
		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th>계정과목코드</th>
					<th>계정과목명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${establishList}" var="vo">
					<tr class="selectEstablish">
						<td>${vo.establishCode }</td>
						<td>${vo.establishNameKor }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
	$(".selectEstablish").click(function(){
		if($("#check").val()=='new'){
			opener.document.getElementById("establishCode").value = $(this).children("td").html();
			window.close();
		}else{
			opener.document.getElementById("dialogEstablishCode").value = $(this).children("td").html();
			window.close();
		}
	});
</script>
</html>