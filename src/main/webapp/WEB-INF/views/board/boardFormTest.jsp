<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<body>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <c:set var="boardNo" value="${boardInfo.boardNo}" />
            <form name="form" id="frm" action="boardSave" method="post" enctype="multipart/form-data">
                <table class="table table-striped">
                    <c:choose>
                        <c:when test="${boardNo eq null}">
                            <h2><strong><i class="fas fa-pen-alt"></i>게시글 등록</strong></h2>
                        </c:when>
                        <c:otherwise>
                            <h2><strong><i class="fas fa-pen-alt"></i>게시글 수정</strong></h2>
                        </c:otherwise>
                    </c:choose>
                    <colgroup>
                        <col width='15%' />
                        <col width='*%' />
                    </colgroup>
                    <tbody>
<!--                                         <tr> -->
<!--                                             <td>작성자</td>  -->
<%--                                             <td><input type="text" id="userId" name="userId" size="20" maxlength="20" value="${boardInfo.userId}"></td>  --%>
<!--                                         </tr> -->
                        <tr>
                            <th>제목</th>
                            <td><input id="title" type="text" name="title" size="70" maxlength="250" value="${boardInfo.title}"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea id="smarteditor" name="contents" rows="10" cols="85">${boardInfo.contents}</textarea></td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <c:forEach var="listview" items="${listview}" varStatus="attachCnt">
                                    <input type="checkbox" name="removeList" value="${listview.attachCode}">
                                    <a href="download?attachCode=${listview.attachCode }">${listview.attachName }</a>
                                </c:forEach>

<!--                                 <input type="file" name="attachFile" multiple="" /> -->
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div id="fileDiv">
                	<p>
                		<input type="file" id="attachFile" name="attachFile" multiple="" >
                		<a href="#this" id="gfv_count" class="btn" id="delete" name="delete">
                			<button class="bttn-jelly bttn-warning">삭제</button>
                		</a>
                	</p>
                </div>
                <br>
                <a href="#this" class="btn" id="addFile"><button class="bttn-jelly bttn-warning">파일추가</button></a>
<!--                 <a href="#" onclick="fn_formSubmit()"><button class="bttn-jelly bttn-warning">저장</button></a> -->
                <button type="button" id="savebtn" class="bttn-jelly bttn-warning">저장</button>
                <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
                <input type="hidden" name="boardNo" value="${boardInfo.boardNo}">
            </form>
        </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="${pageContext.servletContext.contextPath }/css/dashboard.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath }/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/SE2/js/HuskyEZCreator.js"></script>

<script>
//     function fn_formSubmit() {
//         var form = document.form;

//             if (form.title.value=="") {
//                 alert("글 제목을 입력해주세요.");
//                 form.title.focus();
//                 return;
//             }
//             if (form.contents.value=="") {
//                 alert("글 내용을 입력해주세요.");
//                 form.contents.focus();
//                 return;
//             }

//         // 게시글 
//         if ($("#title").val().trim() == "") {
//             alert("글 제목을 입력해주세요.");
//             $("#title").focus();
//             return false;
//         }
        
//         if ($("#contents").val().trim() == "") {
//             alert("글 내용을 입력해주세요.");
//             $("#contents").focus();
//             return false;
//         }

//         form.submit();
//     }
    
    var gfv_count = 1;
    var max_count = 5;

    function fn_addFile(){
    	var str = "<p><input type='file' name='attachFile' ><a href='#this' id='"+ (gfv_count++) +"' class='deletebtn' name='delete'><button class='bttn-jelly bttn-warning'>삭제</button></a></p>";
    		
    	$("#fileDiv").append(str);
    	
    	$("#"+(gfv_count-1)).on("click", function(e){ //삭제 버튼 
    		e.preventDefault();
    		fn_deleteFile($(this));
    	});
   	 }
    
    $("#addFile").on("click", function(e){ //파일 추가 버튼
    	e.preventDefault();
	    if(gfv_count < max_count){
	    	fn_addFile();
	    }else{
	    	alert("더 이상 추가할수 없습니다.");
	    	return;
	    }
    });
    
    
    //삭제 실행
    function fn_deleteFile(obj){
    	gfv_count--;
    	obj.parent().remove();
    }
    
    var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
    var contextPath = "${pageContext.request.contextPath }";
    
    $(document).ready(function() {
    	// Editor Setting
    	nhn.husky.EZCreator.createInIFrame({
    		oAppRef : oEditors, // 전역변수 명과 동일해야 함.
    		elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
    		sSkinURI : contextPath + "/SE2/SmartEditor2Skin.html", // Editor HTML
    		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
    		htParams : {
    			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
    			bUseToolbar : true,
    			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
    			bUseVerticalResizer : true,
    			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    			bUseModeChanger : true, 
    		}
    	});

    	// 전송버튼 클릭이벤트
    	$("#savebtn").click(function(){
    		if(confirm("저장하시겠습니까?")) {
    			// id가 smarteditor인 textarea에 에디터에서 대입
    			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

    			// 이부분에 에디터 validation 검증
    			if(validation()) {
    				$("#frm").submit();
    			}
    		}
    	})
    });

    // 필수값 Check
    function validation(){
    	var contents = $.trim(oEditors[0].getContents());
    	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
    		alert("내용을 입력하세요.");
    		oEditors.getById['smarteditor'].exec('FOCUS');
    		return false;
    	} 
    	if($("#title").val().trim() == "") {
	        alert("글 제목을 입력해주세요.");
	        $("#title").focus();
	        return false;
    	}

    	return true;
    }
</script>
