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
			<i class="fa fa-calculator"></i>완료함
		</h2>
			<label for="date">Tip.기안이 완료된 문서 목록으로, 완료/반려의 상태를 확인&nbsp;
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
						</div></td>
						<td><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								&nbsp;<input class="form-control" id="endDate" name="endDate"placeholder="YYYY/MM/DD" type="text" style="width: 245px "/>
							</div></td>
					</tr>
					<tr>
						<td><br><label style="margin-right: 20px">문서종류</label></td>
						<td><select class="form-control " id="documentTypes" name="documentTypes" style="width: 270px;">
								<option value="품의서" selected="selected">품의서</option>
								<option value="기안서">기안서</option>
								<option value="발주서">발주서</option>
						</select></td>
						<td><div class="input-group">
							<div class="input-group-addon"><label >제목</label></div>
							<input   class="form-control"type="text" id="search_title" name="search_title" style="width: 230px" onkeydown="Enter_Check();" /> &nbsp;&nbsp;</div></td>
						<td><button id="searchBtn" name="searchBtn"class="btn btn-secondary" style="color: #ffffff;">검색</button></td>
					</tr>
					<tr><td><br><br></td></tr>
				</table>
			</div>
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td>
						<td>문서번호</td>
						<td>문서종류</td>
						<td>신청일</td>
						<td>작성자</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody id="documentTbody">
					<c:forEach items="${completeList }" var="vo">
						<tr>
							 <c:set var="dates" >
								<fmt:formatDate value="${vo.presentDate  }" pattern="yyyy/MM/dd" />
							</c:set>		
							<td><input type="checkbox" name="checkRow" value=${vo.documentNumber }></td>					
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
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary " onclick="javascript:myclick();">삭제</button>
		</div>
	</div>
</div>
<!--------------------상세보기 ------------------>
<div class="modal fade" id="documentDetail" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
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
				<div class="modal-footer">
					<button type="button"  class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
 	<form id="completeDelete" action="/completeDelete">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		
<script>
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
	        		textTr += "<td><a href=\'/documentDownload?filecode="+data.filesList[i].filecode
	        						+"\'>"+data.filesList[i].filename+"</a></td>";
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
	                    $("#signDiv").show();
	                else if(val == 2)
	                	   $("#signDiv").hide();
	      	  });
	        }
	    });
	});
}


/* 전체선택 */
function allCheck() {
	if ($("#th_allCheck").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}

/* 선택 완료된 기안문서 삭제 */
function myclick() {
	var checkRow = '';
	$("input[name=checkRow]:checked").each(function() {
		checkRow += $(this).val()+",";
	});
		checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
		$("#checkRow").val(checkRow);
	
		if(checkRow === ""){		
		alert("체크박스를 선택하세요");
		return false;
	}
	
	$("#completeDelete").submit();
}



function Enter_Check(){
    
    if(event.keyCode == 13){ // 엔터키의 코드는 13입니다.
    	$("#searchBtn").click();
    }
}		


/* 검색 */
	$("#searchBtn").on("click", function(){
			
	$.ajax({
		url 	: "/searchComplete",
		data 	:"startDate=" + $("#startDate").val()+"&"+"endDate="+ $("#endDate").val()+"&"
				  +"documentTypes="+$("#documentTypes").val()+"&"+"search_title="+$("#search_title").val(),
	    success: function(data) {
	    
	    $("#startDate","#startDate","#type","#search_title").val("");
	      console.log(data);
		  var tbodyText="";
   	  for(var i = 0; i < data.completeList.length; i++){
   		
   		  var vo = data.completeList[i];
   		var voPresentDate =new Date(parseInt(vo.presentDate));
   		  tbodyText+="<tr>"
   		  	+"<td><input type=\"checkbox\" name=\"checkRow\" value=\""+vo.documentNumber+"\"></td>"
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
	 $(document).ready(function() {
	     var date_input = $('input[name="startDate"]');
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

	     $('#startDate').datepicker('setDate', 'today');
	     $('#endDate').datepicker('setDate', 'today');
	     $('#presentDate').datepicker('setDate', 'today');
	     detailEvent();
	 });
	 </script>


