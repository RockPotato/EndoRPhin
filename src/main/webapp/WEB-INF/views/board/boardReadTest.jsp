<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<body>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-striped">
                <h2><strong><i class="fas fa-pen-alt"></i>게시글 상세조회</strong></h2>
                <colgroup>
                    <col width='15%' />
                    <col width='*%' />
                </colgroup>
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td><input id="title" type="text" name="title" size="70" maxlength="200" value="${boardInfo.title}" readonly></td>
                        <td>조회수 : <input id="userId" type="text" name="title" size="30" maxlength="200" value="${boardInfo.views}" readonly></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input id="userId" type="text" name="title" size="70" maxlength="200" value="${boardInfo.userId}" readonly></td>
                        <td>작성일 : <input id="userId" type="text" name="title" size="30" maxlength="200" value="${boardInfo.postDate}" readonly></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                         <td colspan='2'><textarea id="contents" name="contents" rows="10" cols="100" readonly>${boardInfo.contents}</textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</td>
                        <td>
                            <c:forEach items="${listview }" var="listview" varStatus="status">
                                <a href="/download?filecode=${listview.filecode }">${listview.filename }</a>
                            </c:forEach>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <a href="#" onclick="history.back(-1)"><button class="bttn-jelly bttn-warning">돌아가기</button></a>
            <a href="boardDelete?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">삭제</button></a>
            <a href="boardForm?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">수정</button></a>
            <p>&nbsp;</p>
            <div style="border: 1px solid; width: 600px; padding: 5px">
                <form id="form" name="form" action="boardReplySave" method="post">
                    <input type="hidden" id="boardNo" name="boardNo" value="${boardInfo.boardNo}">
                    작성자: <input type="text" id="commentUser" name="commentUser" size="20" maxlength="20"> <br />
                    <textarea  id="commentContents" name="commentContents" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
                    <a href="#" onclick="fn_formSubmit()"><button type="button" class="bttn-jelly bttn-warning">저장</button></a>
                    <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
                </form>
            </div>
            <c:forEach var="replylist" items="${replylist}" varStatus="status">
                <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;">
                    <c:out value="${replylist.commentUser}" />
                    <fmt:formatDate value="${replylist.commentDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                    <a href="#" onclick="fn_replyDelete('<c:out value=" ${replylist.commentNo}" />')"><button type="button" class="bttn-jelly bttn-warning">삭제</button></a>
                    <a href="#" onclick="fn_replyUpdate('<c:out value=" ${replylist.commentNo}" />')"><button type="button" class="bttn-jelly bttn-warning">수정</button></a>
                    <br />
                    <div id="reply<c:out value=" ${replylist.commentNo}" />">
                        <c:out value="${replylist.commentContents}" />
                    </div>
                </div>
            </c:forEach>

        <div id="replyDiv" style="width: 99%; display:none">
            <form id="form2" name="form2" action="boardReplySave" method="post">
                <input type="hidden" id="boardNo2" name="boardNo" value="<c:out value=" ${boardInfo.boardNo}" />">
                <input type="hidden" id="commentNo2" name="commentNo">
                <textarea id="commentContents2" name="commentContents" rows="3" cols="60" maxlength="500"></textarea>
                <a href="#" onclick="fn_replyUpdateSave()">저장</a>
                <a href="#" onclick="fn_replyUpdateCancel()">취소</a>
                <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
            </form>
        </div>
    </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
   	function fn_formSubmit() {

        if ($("#commentUser").val().trim() == "") {
            alert("작성자를 입력해주세요.");
            $("#commentUser").focus();
            return false;
        }
        
        if ($("#commentContents").val().trim() == "") {
            alert("내용을 입력해주세요.");
            $("#commentContents").focus();
            return false;
        }

        $("#form").submit();
    }

    function fn_replyDelete(commentNo) {
        if (!confirm("삭제하시겠습니까?")) {
            return;
        }
//         var form = document.form2;
//         form2.action = "boardReplyDelete";
//         form2.commentNo.value = commentNo;
		$("#form2").attr("action","boardReplyDelete");
		$("#commentNo2").val(commentNo);
        $("#form2").submit();
    }
    
    var updatecommentNo = updatecommentContents = null;
    function fn_replyUpdate(commentNo) {
//         var form = document.form2;
//         var reply = document.getElementById("reply" + commentNo);
//         var replyDiv = document.getElementById("replyDiv");
//         replyDiv.style.display = "";

//         if (updatecommentNo) {
//             document.body.appendChild(replyDiv);
//             var oldReno = document.getElementById("reply" + updatecommentNo);
//             oldReno.innerText = updatecommentContents;
//         }

//         form.commentNo.value = commentNo;
//         form.commentContents.value = reply.innerText;
//         reply.innerText = "";
//         reply.appendChild(replyDiv);
//         updatecommentNo = commentNo;
//         updatecommentContents = form.commentContents.value;
//         form.contents.focus();
        
        $("#replyDiv").show();
    	
    	if (updatecommentNo) {
    		$("#replyDiv").appendTo(document.body);
    		$("#reply"+updatecommentNo).text(updatecommentContents);
    	} 
    	
    	$("#commentNo2").val(commentNo);
    	$("#commentContents2").val($("#reply"+commentNo).text());
    	$("#reply"+commentNo).text("");
    	$("#replyDiv").appendTo($("#reply"+commentNo));
    	$("#commentContents2").focus();
    	updatecommentNo   = commentNo;
    	updatecommentContents = $("#commentContents2").val();

    }

    function fn_replyUpdateSave() {
//         var form = document.form2;
        if ($("#commentContents2").val().trim() == "") {
            alert("글 내용을 입력해주세요.");
//             form.commentContents.focus();
            $("#commentContents2").focus();
            return;
        }

//         form.action = "boardReplySave";
//         form.submit();
        $("#form2").attr("action", "boardReplySave");
    	$("#form2").submit();	
    }

    function fn_replyUpdateCancel() {
//         var form = document.form2;
//         var replyDiv = document.getElementById("replyDiv");
//         document.body.appendChild(replyDiv);
//         replyDiv.style.display = "none";

//         var oldcommentNo = document.getElementById("reply" + updatecommentContents);
//         oldReno.innerText = updatecommentContents;
//         updatecommentContents = updatecommentContents = null;

    	hideDiv("#replyDiv");
    	
    	$("#reply"+updatecommentNo).text(updatecommentContents);
    	updatecommentNo = updatecommentContents = null;
    }
    
    function hideDiv(id){
    	$(id).hide();
    	$(id).appendTo(document.body);
    }

    var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
    var contextPath = "${pageContext.request.contextPath }";
    
    $(document).ready(function() {
    	// Editor Setting
    	nhn.husky.EZCreator.createInIFrame({
    		oAppRef : oEditors, // 전역변수 명과 동일해야 함.
    		elPlaceHolder : "contents", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
    		sSkinURI : contextPath + "/SE2/SmartEditor2Skin.html", // Editor HTML
    		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
    		htParams : {
    			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
    			bUseToolbar : false,
    			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
    			bUseVerticalResizer : true,
    			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    			bUseModeChanger : true, 
    		}
    	});
    });

    </script>
