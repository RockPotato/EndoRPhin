<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--테이블 리스트출력  -->
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3><i class="fa fa-calculator" style="margin-top: 20px"></i>승인 전표 </h3>
		<table>
			<tr>
				<td><h5>전표일자</h5></td>
				<td><input class="search-query form-control" name="before_slipDate" id="before_slipDate" type="text" /></td>
				<td><h4>~</h4></td>
				<td><input class="search-query form-control" name="after_slipDate" id="after_slipDate" type="text"/></td>
				<td><input class="bttn-fill bttn-warning" type="button" id="serachBtn" value="검색" /></td>
			</tr>
		</table>
		<br>
		<table class="table table-hover">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th>
					<th>전표번호</th>
					<th>전표일자</th>
					<th>적요</th>
					<th>전표금액</th>
					<th>사용부서</th>
				</tr>
			</thead>
			<tbody id="deptListTbody">
			</tbody>
		</table>

		<c:set var="lastPage"
			value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

		<nav style="text-align: center;">
			<ul id="pagination" class="pagination">
			</ul>
		</nav>

<!--------------(삭제,등록) 버튼 ------------------->
		
		<button class="bttn-jelly bttn-md bttn-warning" name="upd_btn"  id="upd_btn" type="button" value="0" onclick="myclick()">승인 취소 </button>
	</div>
</div>
			
	<!-----------------상세보기  모달창 ---------------->	
	
	<div class="modal fade" id="approvalDetail" role="approvalDetail" aria-hidden="true"> 
   		<div class="modal-dialog">
   			 <div class="modal-content"> 
	   			<div class="modal-header modalSketchedHeader" style="height: 52px"> 
	   				<h5>전표조회</h5>
	   				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	   				<h4 class="modal-title" id="myModalLabel"></h4>
	   			</div> 
	   			<div class="modal-body"> 
	   				<div class="input-group">
	   					<span class="input-group-text">전표번호</span>
	   					<input type="text" class="form-control" id="slipnumber_d" name="slipnumber_d" style="background: #fff" readonly>
	   					<span class="input-group-text">전표일자</span> 
	   					<input type="text" class="form-control" name="slipdate_d" id="slipdate_d"  style="background: #fff"readonly > 
	   				</div>
	   				<div class="input-group">
	   					<span class="input-group-text">전표금액</span> 
	   					<input type="text" class="form-control" name="total_d" id="total_d" style="background: #fff" readonly /> 
	   				</div>
	   				<div class="input-group">
	   					<span class="input-group-text">전표유형</span> 
	   					<input type="text" class="form-control" name="departmentname_d" id="departmentname_d"style="background: #fff" readonly /> 
	   				</div>
	   				<div class="input-group">
	   					<span class="input-group-text" style="width: 90px">적요</span> 
	   					<input type="text" class="form-control" id="jukyo_d" name="jukyo_d" style="background: #fff" readonly/>
	   				</div>
	   			<div class="modal-footer">
					<button type="button" class="btn btn-secondary"  data-dismiss="modal">닫기</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>

	<!---------------승인---------------->

 	<form id="update_frm" action="${pageContext.request.contextPath }/updateSlip">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		

 	<form id="useFrm" action="${pageConext.request.contextPath }/useDept">
		<input type="hidden"  id="frm_usestatus" name="frm_usestatus">
		<input type="hidden"  id="frm_deptCode" name="frm_deptCode" >
	</form>
	
    <!---------------------------------------------->
	<script>
 	
	/* 페이징 ajax */
	$("document").ready(function(){
 		approvalPageList(1);
 	});
 	function approvalPageList(page){
 		
 		$.ajax({
 			url : "${pageContext.request.contextPath }/approvalPageList",
 			data : "page=" + page,
 			success : function(data){
 				var htmlArr = data.split("================seperator================");
 				$("#deptListTbody").html(htmlArr[0]);
 				$("#pagination").html(htmlArr[1]);
 			}
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

	/* 선택 승인취소*/
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
		
		
		$("#update_frm").submit();
	}
	
	/* 상세보기  */
	 $("document").ready(function() {
			
			$("#deptListTbody").on("click", ".detailView1", function(){
				
				$("#slipnumber_d").val($(this).data().detail_slipnumber);
				$("#slipdate_d").val($(this).data().detail_slipdate_d);
				$("#jukyo_d").val($(this).data().detail_jukyo);
				$("#total_d").val($(this).data().detail_total);
				$("#departmentname_d").val($(this).data().detail_departmentname);
				
			});
	 	});
	 
	
	/* 날짜  */
 	 $("document").ready(function(){
 	
       $(function() {
           //input을 datepicker로 선언
           $("#before_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });                    
           
           //초기값을 오늘 날짜로 설정
           $('#before_slipDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
       });
       
       $(function() {
           //input을 datepicker로 선언
           $("#after_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });                    
           
           //초기값을 오늘 날짜로 설정
           $('#after_slipDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
       });
 	 });
 	
 	/* 날짜검색*/ 
 	$("#serachBtn").on("click", function(){
   	 	$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchAjax",
       		data 	: "before_slipDate=" + $("#before_slipDate").val() +  "&" + "after_slipDate=" + $("#after_slipDate").val(),
       		success : function(data){
       			
       			
       			var htmlArr = data.split("================seperator================");
       			
       			$("#deptListTbody").html("");
       			$("#deptListTbody").html(htmlArr[0]);
       			$("#pagination").html("");
       			$("#pagination").html(htmlArr[1]);
        	}
        });
 	});
	</script>
	

 	
