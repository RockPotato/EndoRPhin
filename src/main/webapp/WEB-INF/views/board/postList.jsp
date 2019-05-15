<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<h1 class="page-header">${boardTypeName }</h1>
		<table class="table table-striped">
              <thead class="thead">
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
              
				<c:forEach items="${postList }" var="post">
							<tr class="postTr" data-boardNo="${post.boardNo }" data-boardTypeName="${boardTypeName }">
								<td>${post.boardNo }</td>
								<td>${post.title }</td>
								<td>${post.userId }</td>
								<td><fmt:formatDate value="${post.postDate }" pattern="yyyy/MM/dd"/></td>
							</tr>
				</c:forEach>
			  </tbody>
        </table>
         <form action="${pageContext.request.contextPath }/postInsert" method="get">
            	<input type="hidden" id="boardTypeCode" name="boardTypeCode" value="${boardTypeCode }">
            	<input type="hidden" id="boardTypeName" name="boardTypeName" value="${boardTypeName }">
	            <button type="submit" class="btn btn-default">글 작성</button>
         </form>
         
          <c:set var="lastPage" value="${Integer(postCnt/pageSize + (postCnt%pageSize > 0 ? 1 : 0)) }"/>
          
          
  
		<nav style="text-align: center">
			<ul class="pagination">
			
				<c:choose>
					<c:when test="${page == 1 }">
						<li class="disabled">
							<a aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${pageContext.request.contextPath }/postList?boardTypeCode=${boardTypeCode }&boardTypeName=${boardTypeName }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page == 1}">
						<li class="disabled">
							<a aria-label="Previous">
								<span aria-hidden="true">&lt;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${pageContext.request.contextPath }/postList?boardTypeCode=${boardTypeCode }&boardTypeName=${boardTypeName }&page=${page-1 }"aria-label="Previous">
								<span aria-hidden="true">&lt;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>			
				<c:forEach begin="1" end="${lastPage }" var="i">
					<c:set var="active" value=""/>
					<c:if test="${i == page }">
						<c:set var="active" value="active"/>
					</c:if> 
					<li class="${active }">
						<a href="${pageContext.request.contextPath }/postList?boardTypeCode=${boardTypeCode }&boardTypeName=${boardTypeName }&page=${i }">${i }</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${page == lastPage }">
						<li class="disabled">
							<a aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/postList?boardTypeCode=${boardTypeCode}&boardTypeName=${boardTypeName }&page=${page+1 }" aria-label="Previous">
								<span aria-hidden="true">&gt;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page == lastPage }">
						<li class="disabled">
							<a aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${pageContext.request.contextPath }/postList?boardTypeCode=${boardTypeCode }&boardTypeName=${boardTypeName }&page=${lastPage }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav> 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--  JQuery가 먼저 load된 후 bootstrap이 로드 된다. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	
    $(document).ready(function(){
		$(".postTr").on("click", function(){
			var boardNo = $(this).data("boardno");
			var boardTypeName = $(this).data("boardtypename");

			$("#boardNo").val(boardNo);
			$("#boardTypeName").val(boardTypeName);
			$("#frm").submit();
		});
	});
    	
    </script>
    
    <form id="frm" action="${pageContext.request.contextPath}/boardDetail" method="get">
  	  <input type="hidden" id="boardNo" name="boardNo" />
  	  <input type="hidden" id="boardTypeName" name="boardTypeName" value="${boardTypeName }">
  	  <input type="hidden" id="boardTypeName" name="boardTypeCode" value="${boardTypeCode }">
    </form>
          
              
          