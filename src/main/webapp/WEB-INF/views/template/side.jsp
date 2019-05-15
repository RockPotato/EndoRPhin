<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-3 col-md-2 sidebar">
          <br><br><br>
          <ul class="nav nav-sidebar">
       		<c:forEach items="${boardAllList}" var="board" >
	       			<c:if test="${board.useStatus == '1'}">
				<li><a href="<%= request.getContextPath()%>/boardPage?boardTypeCode=${ board.boardTypeCode }">${board.boardTypeName } </a></li>
				</c:if>
			</c:forEach>
          </ul>
</div>