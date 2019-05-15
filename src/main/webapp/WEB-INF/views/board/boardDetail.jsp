<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>


a {
	color: black !important;
	text-decoration: none;
	outline: none
}

</style>



<h1 class="page-header">게시글 상세화면</h1>
<form id="frm" class="form-horizontal" role="form" enctype="multipart/form-data">

	<div class="container-fluid">
		<label class="col-sm-3 control-label">제목</label>
		<div class="col-sm-9">
			<label class="control-label" >${post.title }</label>
		</div>
		
		<label class="col-sm-3 control-label">작성자</label>
		<div class="col-sm-9">
			<label class="control-label" >${post.userId }</label>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-3 control-label">내용</label>
		<div class="col-sm-9">
			<label class="control-label" >${post.contents }</label>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-3 control-label">작성일</label>
		<div class="col-sm-9">
			<label class="control-label"><fmt:formatDate value="${post.postDate }" pattern="yyyy-MM-dd HH:mm:ss"/></label>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-3 control-label">파일</label>
		<div class="col-sm-9">
			<c:forEach items="${attachList }" var="attach">
				<a href="/attachDownload?attachCode=${attach.attachCode }">${attach.attachName }</a>
			</c:forEach>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-3 col-sm-9">
			
			<a href="${pageContext.request.contextPath }/postUpdate?boardNo=${post.boardNo }&boardTypeCode=${boardTypeCode}&boardTypeName=${boardTypeName }">
				<button id="btn_modify" type="button" class="btn btn-default" style="display:inline;">수정</button>
			</a>
			
			<a href="${pageContext.request.contextPath }/deletepost?boardNo=${post.boardNo}&boardTypeName=${boardTypeName }&boardTypeCode=${boardTypeCode }">
				<button id="btn_delete" type="button" class="btn btn-default" style="display:inline;">삭제</button>
			</a>
		</div>
	</div>
	
</form>

<form id="frm_cmtInsert" class="form-horizontal" role="form" action="${pageContext.request.contextPath }/writecomment" method="post">

	<input type="hidden" id="userId" name="userId" value="${post.userId }">
	<input type="hidden" id="boardNo" name="boardNo" value="${post.boardNo }">
	<input type="hidden" id="boardTypeName" name="boardTypeName" value="${boardTypeName }">
	
	<div class="form-group">
		<label class="col-sm-3 control-label">댓글 작성</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="commentContents" name="commentContents" placeholder="댓글을 작성해주세요." style="display:inline;"/>
		</div>
		<button id="btn_comment" type="submit" class="btn btn-default" style="display:inline;" >작성</button>
	</div>
</form>

<table class="table table-striped">
	<c:forEach items="${commentList }" var="comment">
		<form id="frm_cmtUpdate" class="form-horizontal" role="form" action="${pageContext.request.contextPath }/deletecomment" method="post">
			<input type="hidden" id="boardNo" name="boardNo" value="${post.boardNo }">
			<input type="hidden" id="boardTypeName" name="boardTypeCode" value="${boardTypeCode }">
			<input type="hidden" id="boardTypeName" name="boardTypeName" value="${boardTypeName }">
			
					<tr data-postNo="${comment.commentNo }">
						<td>${comment.commentContents }</td>
						<td>${comment.commentUser }</td>
						<td><fmt:formatDate value="${comment.commentDate }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
						<td>
							<button id="btn_cmtDelete" name="btn_cmtDelete" type="submit" class="btn btn-default" style="display:inline;">삭제</button>
							<input type="hidden" id="commentNo" name="commentNo" value="${comment.commentNo }">
						</td>
					</tr>
		</form>
	</c:forEach>
</table>
		

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--  JQuery가 먼저 load된 후 bootstrap이 로드 된다. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	if("${sessionScope.employeeVo.userId}"=="${post.userId}"){
		$("#btn_delete").show();
		$("#btn_modify").show();
		$("button[name=btn_cmtDelete]").show();
	} else {
		$("#btn_delete").hide();
		$("#btn_modify").hide();
		$("button[name=btn_cmtDelete]").hide();
	}
})
		


</script>
    
  </body>
</html>