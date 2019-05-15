<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link href="css/document.css" rel="stylesheet" type="text/css">
<br>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2>
			<i class="fa fa-calculator"></i>기안상신함
		</h2>
			<label for="date">Tip.품의서, 기안서, 발주서 등 3종의 양식 상신&nbsp;
			<span class="asteriskField" style="size: 12px">!</span></label>
		<div class="bootstrap-iso">
			<div class="container-fluid">
				<table>
						<tr><td><br><br></td></tr>
					<tr>
						<td><label for="date" style="margin-left: 10px;">작성일
								<span class="asteriskField">*</span></label></td>
						<td><div class="input-group" style="margin-right: 20px" >
								<div class="input-group-addon"  >
									<i class="fa fa-calendar"></i>
								</div>
								<input class="form-control" id="startDate" name="startDate"placeholder="YYYY/MM/DD" type="text" style="width: 230px;"/>&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;
							</div>
						</td>
						<td><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								&nbsp;<input class="form-control" id="endDate" name="endDate"placeholder="YYYY/MM/DD" type="text" style="width: 245px "/>
							</div>
						</td>
					</tr>
					<tr>
						<td><br><label  style="margin-right: 20px">문서종류</label></td>
						<td><select class="form-control " id="documentTypes" name="documentTypes" style="width: 270px;">
								<option value="품의서" selected="selected">품의서</option>
								<option value="기안서">기안서</option>
								<option value="발주서">발주서</option>
						</select></td>
						<td><div class="input-group">
							<div class="input-group-addon"><label >제목</label></div>
							<input   class="form-control"type="text" id="search_title" name="search_title" style="width: 230px" onkeydown="Enter_Check();" />&nbsp;&nbsp;</div></td>
						<td><button id="searchBtn" name="searchBtn"class="btn btn-secondary" style="color: #ffffff;">검색</button></td>
					</tr>
						<tr><td><br><br></td></tr>
				</table>
			</div>
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<td>문서번호</td>
						<td>문서종류</td>
						<td>신청일</td>
						<td>작성자</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody id="documentTbody">
			
					<c:forEach items="${documentList }" var="vo">
				    	<c:if test ="${sessionScope.employeeVo.userId !=null }">
						<c:if test="${sessionScope.employeeVo.userNm == vo.presentUser}"> 
						<tr>
							 <c:set var="dates" >
								<fmt:formatDate value="${vo.presentDate }" pattern="yyyy/MM/dd" />
							</c:set>							
							<td><a class="bttn-stretch bttn-warning detailView" href="#documentDetail" 
																				 data-documentnumber="${vo.documentNumber }" 
																				 data-title="${vo.title }" 
																				 data-preservation="${vo.preservation }" 
																				 data-presentdate="${dates }" 
																				 data-tempsortation="${vo.tempSortation }" 
																				 data-completesortation="${vo.completeSortation }" 
																				 data-presentuser="${vo.presentUser }" 
																				 data-presentdepartment="${vo.presentDepartment }" 
																				 data-documenttype="${vo.documentType }"
																				 data-userid="${vo.userId }"
																				 data-toggle="modal">${vo.documentNumber }</a>
																				 <div style="display: none;">${vo.contents }</div></td>
							<td>${vo.documentType }</td>
							<td><fmt:formatDate value="${vo.presentDate }" pattern="yyyy-MM-dd" /></td>
							<td>${vo.presentUser }</td>
							<td>${vo.title }</td>
						</tr>
					</c:if>
					</c:if> 
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="modal-footer">
			<select class="form-control " id="documentType" name="documentType" style="width: 150px;">
				<option value="품의서" selected="selected">품의서</option>
				<option value="기안서">기안서</option>
				<option value="발주서">발주서</option>
			</select>
			<button type="button" class="btn btn-secondary " data-toggle="modal" data-target="#my80sizeModal3" onclick="javascript:documentInsert();">문서작성</button>
			<input type="hidden" id="buttons" name="buttons">
		</div>
	
	</div>
</div>
<!--------------------상세보기 ------------------>
<div class="modal fade" id="documentDetail" tabindex="-1" role="dialog"	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
	
		<div class="modal-content">
			<div class="modal-header"  style="background:#6C757D;" >
			<table>
				<tr><td><div id="de_documentType" style="color: #ffffff;" ></div></td></tr>
			</table>
			</div>
			<div class="doc_contents">
				<div class='doc_paper'>
					<table>
						<tr>
							<td class='board_blank'><div style='width: 64px'></div></td>
							<td class='board_blank'><div style='width: 134px'></div></td>
							<td class='board_blank'><div style='width: 317px'></div></td>
							<td class='board_blank'><div style='width: 64px'></div></td>
							<td class='board_blank'><div style='width: 134px'></div></td>
						</tr>
						<tr>
							<th rowspan='2' colspan='3' class='paper_title'><div id="de_documentType2"></div></th>
							<th>문서번호</th>
							<td><div id="de_documentNumber"></div></td>
						</tr>
						<tr>
							<th>보존연한</th> 
							<td><div id="de_preservation"></div></td>
						<tr>
							<th>기안부서</th>
							<td><div id="de_presentDepartment"></div></td>
							<td rowspan='2' colspan='3' class='paper_table'>
								<table style='width: 100%;'>
									<tr>
										<th rowspan='3' style='width: 5%'>기<br />안<br />부<br />서</th>
										<th>결재</th><th>결재</th>
										<th>결재</th><th>결재</th>
										<th>결재</th>
									</tr>
									<tr id="signArea" style='height: 50px; color: red;'></tr>
									<tr id="signIdArea" style='height: 20px; background: #E9ECEF;'></tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>기안자</th>
							<td><div id="de_presentUser"></div></td>
						<tr>
							<th>기안일자</th>
							<td><div id="de_presentDate"></div></td>
							<td rowspan='2' colspan='3' class='paper_table'>
								<table style='width: 100%;'>
									<tr>
										<th rowspan='3' style='width: 5%'>참<br />조<br />부<br />서
										</th>
										<th>결재</th><th>결재</th>
										<th>결재</th><th>결재</th>
										<th>결재</th>
									</tr>
									<tr id="accountUserArea" style='height: 50px; color: red;'></tr>
									<tr id="accountSignArea" style='height: 20px; background: #E9ECEF;' ></tr>
								</table>
						</tr>
						<tr>
							<th>협조부서</th>
							<td></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan='4'><div id="de_title"></div></td>
						</tr>
						<tr>
							<td colspan='5' class='board_contents'>
								<div class='board_contents_txt'>
								</div>
								<div id="de_contents"></div>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="5" id="filesTd"></td>
						</tr>
						</table> 
				</div>
			</div>
		</div>
	</div>
</div>

<!-- --------------------문서작성-------------------------------------->
<div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		 <div class="modal-content"> 
 			<div class="modal-header" style="background:#6C757D;"  >
 			<table>
				<tr>
				    <td colspan="5"><div id="de_documentType1" style="color: #ffffff;" ></div></td>
					<td colspan="2"><button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button></td>
				</tr>
			</table>
			</div>
		<form action="/insertDocument" id="insertDocumentFrm" method="post" enctype="multipart/form-data">
		<div class="modal-body">
				<div class="modal-body">
				<table>
					<tr>
						<td><label>문서번호</label></td> 
						<td><input type="text" id="documentNumber" name="documentNumber" readonly class="form-control" style="background: #F4EBE7;"style="width: 130px"> </td>
						<td><label>&nbsp;&nbsp;보존년한&nbsp;&nbsp;</label> </td>
						<td><select class="form-control " id="preservation" name="preservation"style="width: 100px;">
							<option value="5년" selected="selected">5년</option>
							<option value="4년">4년</option>
							<option value="3년">3년</option>
							<option value="2년">2년</option>
							<option value="1년">1년</option>
						</select></td>
					</tr>
					<tr>
						<input type="hidden" id="presentDepartment" name="presentDepartment" value="${vo.deptCode}" >
						<td><label>기안부서</label> </td>
						<td ><input type="text"  class="form-control" readonly value="${deptName}" ></td>
						<td><label>&nbsp;&nbsp;기안자
							<span class="asteriskField">*</span></label></td>
						<td><input type="text" id="presentUser" name="presentUser" class="form-control" readonly style="width: 200px" value="${userName}" /></td>
					</tr>
					<tr> 
						<td colspan="1"><label for="presentDate">기안일자&nbsp;
								<span class="asteriskField">*</span></label></td>
						<td><div class="input-group">
								<input class="form-control-sm" id="presentDate" name="presentDate" placeholder="YYYY/MM/DD" type="text" style="width: 180px" />&nbsp;
									<i class="fa fa-calendar"></i>
							</div></td>
					</tr>
					<tr>
						<td><label>제목&nbsp;&nbsp;
							<span class="asteriskField">*</span></label></td>  
						<td  colspan="4"><input type="text" id="title" name="title" style="width: 480px" class="form-control"></td>
					</tr>
				</table>
				<br>
					<textarea id="contents" name="contents"  rows="10" cols="150" style="width: 730px; height: 500px;"></textarea>
						 <table>
						 <tr>
						    <th>첨부파일</th>
						   	 <td> <a href="#this" class="btn" id="addFile">
                				<button class="btn btn-secondary btn-sm">파일추가</button></a>
                            <td>
                            </td>
                        </tr>
            		</table>
                	<div id="fileDiv">
            		<table>
                		<tr>
                			<td><a href="#this" id="gfv_count" id="delete"></a></td>
                		</tr>		
                	</table>
                	 </div>
                 </div>
               </div>
               <input type="hidden" id="tempSortation" name="tempSortation" value="0">
               <input type="hidden" id="completeSortation" name="completeSortation" value="1">
               <input type="hidden" id="sortation" name="sortation" value="0">
               <input type="hidden" id="checkRow" name="checkRow" >
               <input type="hidden" id="documentTypeFrm" name="documentTypeFrm" >
               <input type="hidden" id="checkRow_ref" name="checkRow_ref" >
			</form>
			<div class="modal-footer">
				<button type="button" id="selectSignBtn" class="btn btn-outline-secondary" data-toggle="modal"  data-target="#my80sizeModal4" value="${positionCode}" >결재선 지정</button>
				<button type="button" id="referenceBtn" class="btn btn-outline-secondary" data-toggle="modal"  data-target="#my80sizeModal5" value="${positionCode}" >참조선 지정</button>
				<button type="button" id="signBtn"  class="btn btn-secondary " id="signBtn" name="signBtn"onclick="selectSignClick();">결제상신</button>
				<button type="button" class="btn btn-secondary" id="temporarilyBtn" >임시저장</button>
			</div>
  		</div> 
	</div>
</div>

<!----------------------------결재선 지정 모달창  ---------------------->

  <div class="modal fade" id="my80sizeModal4" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header " style="background:#6C757D;">
			<h4 style="color: #ffffff;" >| 결재선 지정</h4>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
		  </div>
			<div class="modal-body"><center>
			<table><thead>
					<tr>
						<td><label>부서명&nbsp;</label></td>
						<td><input class="form-control" name="deptNm" id="deptNm" style="width: 200px; height: 25px;"   onkeydown="Enter_Check();" /></td>
						<td><label>&nbsp;&nbsp;사원명 &nbsp;&nbsp;</label></td>
						<td><input class="form-control" name="usernm" id="usernm" style="width: 200px; height: 25px;" onkeydown="Enter_Check();" /></td>
						<td><button type="button" class="btn btn-outline-secondary" id="deptSearchBtn"name="deptSearchBtn">검색</button></td>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:750px; height:250px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th></th>
						<th>직원명</th>
						<th>부서</th>
						<th>직급</th>
			
				</thead>
				<tbody id="emTbody">
				<c:forEach items="${employeeList }" var="vo">
					<tr class="emTr" data-usernm="${vo.userNm }">
						<td><input type="checkbox" name="checkRow" value="${vo.userId }" ></td>
						<td>${vo.userNm}</td>
						<td>${vo.deptname}</td>
						<td>${vo.positionname}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
     		<table class="brd_write2">
              	<tr>
                     <td>
                         <div style="padding-top:10px; text-align:center">
                            <button  class="btn btn-secondary btn-sm" id="btnSelectEmployee">▼</button>
                            <button  class="btn btn-secondary btn-sm"class="rbDecorated"  name="btnDeleteEmployee" id="btnDeleteEmployee" onclick="deleteClick();">▲</button>
                         </div>
					</td>
				</tr>
			</table>
			<table class="table table-sm" ><br>
				<thead class="thead" >
					<tr>
						<th></th>
						<th>직원명</th>
						<th>부서</th>
						<th>직급</th>
					</tr>
				</thead>
				<tbody id="clinetTbody">
					<tr>
						<td><div class="col-lg-12" id="ex3_Result0" ></div></td>
						<td><div class="col-lg-12" id="ex3_Result1" ></div></td>
						<td><div class="col-lg-12" id="ex3_Result2" ></div></td>
						<td><div class="col-lg-12" id="ex3_Result3" ></div></td> 
					</tr>
				</tbody>
			</table>
			<div class="modal-footer">
			  <button type="button"  id="insertBtn" class="btn btn-outline-secondary " onclick=" insertclick();">결재라인 저장</button>
			</div> 
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> 
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
			</div>
			<center>
		</div>
	</div>
	
	
<!----------------------------참조선 지정 모달창  ---------------------->
  <div class="modal fade" id="my80sizeModal5" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header " style="background:#6C757D;">
			<h4 style="color: #ffffff;" >| 결재선 지정</h4>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
		  </div>
			<div class="modal-body">
			<center>
			<table>
				<thead>
					<tr>
						<td><label>부서명&nbsp;</label></td>
						<td><input class="form-control" name="deptNm1" id="deptNm1" style="width: 200px; height: 25px;" onkeydown="Enter_Check();"/></td>
						<td><label>&nbsp;&nbsp;사원명 &nbsp;&nbsp;</label></td>
						<td><input class="form-control" name="usernm1" id="usernm1" style="width: 200px; height: 25px;"onkeydown="Enter_Check();" /></td>
						<td><button type="button" class="btn btn-outline-secondary" id="refSearchBtn">검색</button></td>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:750px; height:250px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th></th>
						<th>직원명</th>
						<th>부서</th>
						<th>직급</th>
					</tr>
				</thead>
				<tbody id="empolyeeTbody">
				</tbody>
			</table>
			</div>
     		<table class="brd_write2">
              	<tr>
                    <td>
                        <div style="padding-top:10px; text-align:center">
                           <button  class="btn btn-secondary btn-sm" id="btnSelect">▼</button>
                           <button  class="btn btn-secondary btn-sm"class="rbDecorated"  name="btnDelete" id="btnDelete" onclick="deleteClick2();">▲</button>
                        </div>
					</td>
				</tr>
			</table>
			<table class="table table-sm" ><br>
				<thead class="thead" >
					<tr>
						<th></th>
						<th>직원명</th>
						<th>부서</th>
						<th>직급</th>
					</tr>
				</thead>
				<tbody id="clinetTbody">
					<tr>
						<td><div class="col-lg-12" id="Result0" ></div></td>
						<td><div class="col-lg-12" id="Result1" ></div></td>
						<td><div class="col-lg-12" id="Result2" ></div></td>
						<td><div class="col-lg-12" id="Result3" ></div></td> 
					</tr>
				</tbody>
			</table>
			<div class="modal-footer">
			  <button type="button" class="btn btn-outline-secondary " onclick=" referInsertclick();">참조라인 저장</button>
			</div> 
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> 
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
			</div>
			<center>
		</div>
	</div>
<script>

function Enter_Check(){
    
    if(event.keyCode == 13){ // 엔터키의 코드는 13입니다.
    	$("#deptSearchBtn").click();  
    	$("#refSearchBtn").click();  
    	$("#searchBtn").click();
    }
}
function detailEvent(){
$(".detailView").off("click");
$(".detailView").on("click", function() {
    $("#de_presentDepartment").html($(this).data("presentdepartment"));
    $("#de_presentUser").html($(this).data("presentuser"));
    $("#de_presentDate").html($(this).data("presentdate"));
    $("#de_documentType").html($(this).data("documenttype"));
    $("#de_documentNumber").html($(this).data("documentnumber"));
    $("#de_preservation").html($(this).data("preservation"));
    $("#de_title").html($(this).data("title"));
    $("#de_contents").html($(this).siblings('div').html());
    $("#de_documentType2").html($(this).data("documenttype"));
    $.ajax({
        url: "/selectDocument",
        data: "documentNumber=" + $(this).data("documentnumber"),
        success: function(data) {
        	var refCheck=0;
        	var sorCheck=0;
            var textTr ="" ;
        	for(var i = 0; i< data.filesList.length; i++){
        		textTr += "<a href=\'/documentDownload?filecode="+data.filesList[i].filecode
        						+"\'>"+data.filesList[i].filename+"</a><br>";
           }
     	  $("#filesTd").html(textTr);
        	
            $("#accountUserArea, #accountSignArea,#signArea, #signIdArea").html(' ');
            for (var i = 0; i < data.selectList.length; i++) {
            	if(data.selectDocument_ref[i].sortation !='참조'){
            		refCheck++;
	                if (data.selectDocument_ref[i].sortation == '0') {
	                    $("#signArea").append("<th style='height: 50px;'></th>");
	                }
	                else {
	                    $("#signArea").append("<th style='height: 50px;'>" + data.selectDocument_ref[i].sortation + "</th>");
	                }
	                $("#signIdArea").append("<th style='height: 20px;'>" + data.selectDocument_ref[i].usernm + "</th>");
            	}else{
            		sorCheck++;
	               	 $("#accountUserArea").append("<th style='height: 50px;'>" + data.selectDocument_ref[i].sortation + "</th>");
	                 $("#accountSignArea").append("<th style='height: 20px;'>" + data.selectDocument_ref[i].usernm + "</th>");
            	}
          	 }
         
            for (var i = 0; i < 5 - sorCheck; i++) {
                $("#accountUserArea").append("<th style='height: 50px;'></th>");
                $("#accountSignArea").append("<th style='height: 20px;'></th>");
           }
            for (var i = 0; i < 5 - refCheck; i++) {
            	$("#signArea").append("<th style='height: 50px;'></th>");
                $("#signIdArea").append("<th style='height: 20px;'></th>");
			}
            $.each(data, function(idx, val) {
                if (val == 1)
                	 $("#signDiv").show()
                else if(val == 2)
                    $("#signDiv").hide();
                else{
                	 $("#signDiv").show()
                }
            });
        }
    });
});
}
/*참조지정  */
function documentInsert() {
	$('#contents').summernote({
		height : 300, 
	    minHeight : null,
	    maxHeight : null,
	    focus : true,
	    lang : 'ko-KR' 
});
   $.ajax({
   	  url: "/getDocumentRefList",
   	  data : "check="+$("#documentType").val(),
   	  success: function(data) {
   		  var tbodyText="";
       	  for(var i = 0; i < data.distributionList.length; i++){
       		  var vo = data.distributionList[i];
       		  tbodyText+="<tr class=\'employeetTr\' data-usernm=\'"+vo.userNm+"\'>"
	      			+"<td><input name=\'checkRow_ref\' type=\'checkbox\' value=\'"+vo.userId+"\'></td>"
	      			+"<td>"+vo.userNm+"</td>"
	      			+"<td>"+vo.deptname+"</td>"
	      			+"<td>"+vo.positionname+"</td>"
	      			+"</tr>";
             }
       	  $("#empolyeeTbody").html(tbodyText);
       	  $("#de_documentType1").html(data.check);
   	  }
   });
}


 /* 임시저장 등록 */
$("#temporarilyBtn").on("click", function() {
     $("#documentTypeFrm").val($("#documentType").val());
	 $("#tempSortation").val("1");
	 $("#completeSortation").val("0");
	 $("#documentTypeFrm").val($("#documentType").val());
     $("#checkRow").val($("#checkRow").val());
     $("#checkRow_ref").val($("#checkRow_ref").val());
 	   
     alert("기안작성이 완료되었습니다.");
 	 $("#insertDocumentFrm").submit();
     
});

/* 기안함 등록 */
function selectSignClick() {
	
    if (checkRow === "") {
        alert("결재선이 지정되어 있지 않습니다.");
        return false;
    }
    if (checkRow_ref === "") {
        alert("참조선이 지정되어 있지 않습니다.");
        return false;
    }
    $("#documentTypeFrm").val($("#documentType").val());
    $("#checkRow").val($("#checkRow").val());
    $("#checkRow_ref").val($("#checkRow_ref").val());
    
	    alert("기안작성이 완료되었습니다.");
	    $("#insertDocumentFrm").submit();
}


/* 첨부파일  */
var gfv_count = 1;
var max_count = 5;

function fn_addFile() {
    var str = "<p><input type='file' name='uploadFile' multiple ><a href='#this' id='" +
        (gfv_count++) + "' class='deletebtn' name='delete'><button class='btn btn-secondary btn-sm'>삭제</button></a></p>";

    $("#fileDiv").append(str);

    $("#" + (gfv_count - 1)).on("click", function(e) { //삭제 버튼 
        e.preventDefault();
        fn_deleteFile($(this));
    });
}
$("#addFile").on("click", function(e) { //파일 추가 버튼
    e.preventDefault();
    if (gfv_count < max_count) {
        fn_addFile();
    } else {
        alert("더 이상 추가할수 없습니다.");
        return;
    }
});
//삭제 실행
function fn_deleteFile(obj) {
    gfv_count--;
    obj.parent().remove();
}

var checkRow = '';

function insertclick() {
	
    $("input[name=checkRow]:checked").each(function() {
        checkRow += $(this).val() + ",";
    });
    checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  

    $("#checkRow").val(checkRow);
    $('.buttons').trigger('click');

}
// 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
$("#btnSelectEmployee").click(function() {

    var rowData = new Array();
    var tdArr0 = new Array(); var tdArr1 = new Array();
    var tdArr2 = new Array(); var tdArr3 = new Array();
    var checkbox = $("input[name=checkRow]:checked");

    checkbox.each(function(i) {
        var tr = checkbox.parent().parent().eq(i);
        var td = tr.children();

        rowData.push(tr.text()); // 체크된 row의 모든 값을 배열에 담는다.

        var check = td.eq(0).html() + "<br> ";
        var name = td.eq(1).text() + "<br> ";
        var dept = td.eq(2).text() + "<br> ";
        var position = td.eq(3).text() + "<br>  ";

        tdArr0.push(check);
        tdArr1.push(name);
        tdArr2.push(dept);
        tdArr3.push(position);

        $("#ex3_Result0").html(tdArr0); $("#ex3_Result1").html(tdArr1);
        $("#ex3_Result2").html(tdArr2);  $("#ex3_Result3").html(tdArr3);
    });
});

function deleteClick() {
    $("#ex3_Result0").html("");  $("#ex3_Result1").html("");
    $("#ex3_Result2").html("");  $("#ex3_Result3").html("");
}

function deleteClick() {
	$("#ex3_Result0,#ex3_Result1,#ex3_Result2,#ex3_Result3 ").html("");
}

/*----------참조선지정  --------------*/
var checkRow_ref = '';
function referInsertclick() {
	$("input[name=checkRow_ref]:checked").each(function() {
		checkRow_ref += $(this).val() + ",";
	});
	checkRow_ref = checkRow_ref.substring(0, checkRow_ref.lastIndexOf(",")); //맨끝 콤마 지우기  
	
	$("#checkRow_ref").val(checkRow_ref);
	$('.buttons').trigger('click');

}
$("#btnSelect").click(function() {
	var rowData = new Array(); var tdArr0 = new Array();
	var tdArr1 = new Array();  var tdArr2 = new Array();
	var tdArr3 = new Array();

	var checkbox = $("input[name=checkRow_ref]:checked");

	checkbox.each(function(i) {
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
	
		rowData.push(tr.text());	// 체크된 row의 모든 값을 배열에 담는다.

		var check = td.eq(0).html() + "<br> ";
		var name = td.eq(1).text() + "<br> ";
		var dept = td.eq(2).text() + "<br> ";
		var position = td.eq(3).text() + "<br>  ";

		tdArr0.push(check);
		tdArr1.push(name);
		tdArr2.push(dept);
		tdArr3.push(position);

		$("#Result0").html(tdArr0); $("#Result1").html(tdArr1);
		$("#Result2").html(tdArr2); $("#Result3").html(tdArr3);
	});
});

function deleteClick2() {
	$("#Result0,#Result1,#Result2,#Result3 ").html("");
}


/* 인사 검색 */
	$("#deptSearchBtn").on("click", function(){
	$.ajax({
   		url 	: "${pageContext.request.contextPath }/deptSearchAjax",
   		data 	:"deptNm=" + $("#deptNm").val()+"&"
   				 +"usernm="+ $("#usernm").val(),
   		success : function(data){
   		  $("#deptNm","#usernm").val("");
  			 var tbodyText="";
         	  for(var i = 0; i < data.empolyeeList.length; i++){
         		  var vo = data.empolyeeList[i];
         		  tbodyText+="<tr class=\'emTr\' data-usernm=\'"+vo.userNm+"\'>"
  	      			+"<td><input name=\'checkRow\' type=\'checkbox\' value=\'"+vo.userId+"\'></td>"
  	      			+"<td>"+vo.userNm+"</td>"
  	      			+"<td>"+vo.deptname+"</td>"
  	      			+"<td>"+vo.positionname+"</td>"
  	      			+"</tr>";
               }
         	  $("#emTbody").html(tbodyText);
   		}
   	});
  });
 	/* 참조검색 */
	$("#refSearchBtn").on("click", function(){
	$.ajax({
   		url 	: "${pageContext.request.contextPath }/refSearchAjax",
   		data 	:"deptNm1=" + $("#deptNm1").val()+"&"  +"usernm1="+ $("#usernm1").val()+"&"  +"check="+$("#documentType").val(),
  	    success: function(data) {
  	    $("#deptNm1","#usernm1").val("");
  	    	
   		  var tbodyText="";
       	  for(var i = 0; i < data.distributionList.length; i++){
       		  var vo = data.distributionList[i];
       		  tbodyText+="<tr class=\'employeetTr\' data-usernm=\'"+vo.userNm+"\'>"
	      			+"<td><input name=\'checkRow_ref\' type=\'checkbox\' value=\'"+vo.userId+"\'></td>"
	      			+"<td>"+vo.userNm+"</td>"
	      			+"<td>"+vo.deptname+"</td>"
	      			+"<td>"+vo.positionname+"</td>"
	      			+"</tr>";
             }
       	  $("#empolyeeTbody").html(tbodyText);
   	  }
   	});
   });
 	
 	/* 검색 */
	$("#searchBtn").on("click", function(){
	$.ajax({
   		url 	: "${pageContext.request.contextPath }getDocumentSearch",
   		data 	:"startDate=" + $("#startDate").val()+"&"+"endDate="+ $("#endDate").val()+"&"
   				  +"documentTypes="+$("#documentTypes").val()+"&"+"search_title="+$("#search_title").val(),
  	    success: function(data) {
  	    
  	    $("#startDate","#startDate","#type","#search_title").val("");
  	    	
   		  var tbodyText="";
       	  for(var i = 0; i < data.documentList.length; i++){
       		  var vo = data.documentList[i];
       		var voPresentDate =new Date(parseInt(vo.presentDate));
       		  tbodyText+="<tr>"
       			+"<td><a href=\'#documentDetail\' class=\'bttn-stretch bttn-warning detailView\' data-toggle=\'modal\' data-documentnumber=\'"+vo.documentNumber+
       			"\'data-title=\'"+vo.title+"\'data-preservation=\'"+vo.preservation+"\'data-contents=\'"+vo.contents+
       			"\'data-presentuser=\'"+vo.presentUser+"\'data-documenttype=\'"+vo.documentType+"\'data-presentdepartment=\'"+vo.presentDepartment+
       			"\'data-presentdate=\'"+parsingPresentDate(voPresentDate,true)+"\'>"
       			  +vo.documentNumber+"</a></td>"
	      			+"<td>"+vo.documentType+"</td>"
	      			+"<td>"+parsingPresentDate(voPresentDate,true)+"</td>"
	      			+"<td>"+vo.presentUser+"</td>"
	      			+"<td>"+vo.title+"</td>"
	      			+"</tr>";
             }
       	  $("#documentTbody").html(tbodyText);
       	detailEvent();
   	  }
   	});
   });
 	
	 function parsingPresentDate(voPresentDate,dataCheck){
		var month;
		var date;
		if(voPresentDate.getMonth()+1<10){
			month="0"+(voPresentDate.getMonth()+1);
		}else{
			month=voPresentDate.getMonth()+1;
		}
		if(voPresentDate.getDate()<10){
			date = "0"+voPresentDate.getDate();
		}else{
			date =voPresentDate.getDate();
		}
		if(dataCheck)
			return voPresentDate.getFullYear()+"-"+month+"-"+date;
		else
			return voPresentDate.getFullYear()+"/"+month+"/"+date;
	}
/*달력 3개입력받을 거 있음  */
$(document).ready(function() {
    var date_input = $('input[name="startDate"]'); //our date input has the name "date"
    var container = $('.bootstrap-iso form').length > 0 ? $(
        '.bootstrap-iso form').parent() : "body";
    date_input.datepicker({
        dateFormat: 'yy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
        
    });
    var date_input = $('input[name="endDate"]'); //our date input has the name "date"
    var container = $('.bootstrap-iso form').length > 0 ? $(
        '.bootstrap-iso form').parent() : "body";
    date_input.datepicker({
        dateFormat: 'yy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
    });

    var date_input = $('input[name="presentDate"]'); //our date input has the name "date"
    var container = $('.bootstrap-iso form').length > 0 ? $(
        '.bootstrap-iso form').parent() : "body";
    date_input.datepicker({
        dateFormat: 'yy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
    });
    $('#startDate').datepicker('setDate', 'today');
    $('#endDate').datepicker('setDate', 'today');
    $('#presentDate').datepicker('setDate', 'today');
    detailEvent();
});
</script>
