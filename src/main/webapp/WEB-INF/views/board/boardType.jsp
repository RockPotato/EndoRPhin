<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

		<h1 class="page-header">게시판 관리</h1>
		<form action="${pageContextPath.request.contextPath }/boardType?type=create" method="post">		
			<%-- 게시판 생성 --%>
			<table class="table table-striped">
				<tr>
					<td>게시판 이름</td>
					<td>
						<input type="text" name="boardTypeName_Insert"/>
					</td>
					<td>
						<select name="useStatus">
							<option value="1">사용</option>
							<option value="0">미사용</option>
						</select>
					</td>
					<td><button type="submit" class="btn btn-default">생성</button></td>
				</tr>
	        </table>
	    </form>
	    
	        <%-- 게시판 수정 --%>
	        <table class="table table-striped">
					<c:forEach items="${boardAllList }" var="board">
				        <form  action="${pageContextPath.request.contextPath }/boardType?type=update" method="post">
						<input type="hidden" name="boardTypeCode" value="${board.boardTypeCode }">
							<tr>
								<td>게시판 이름</td>
								<td>
									<input type="text" name="boardTypeName" value="${board.boardTypeName}">
								</td>
								<td>
									<select name="useStatus">
										<option value="1" <c:if test="${board.useStatus eq '1' }"> selected</c:if>>사용</option>
										<option value="0" <c:if test="${board.useStatus eq '0' }"> selected</c:if>>미사용</option>
									</select>
								</td>
								<td><button type="submit" id="btn_update" class="btn btn-default">수정</button></td>
							</tr>
				       	</form>
					</c:forEach>
	        </table>
            
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			//
		});
    </script>
