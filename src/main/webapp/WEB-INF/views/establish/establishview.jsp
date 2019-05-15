<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">

<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
	
	<h2><i class="fa fa-calculator"></i>계정과목 관리</h2>
	<table>
	<tr>
		<td>계정과목명  :&nbsp;</td>
		<td><input class="search-query form-control" id="sArea" name="sArea" type="text" placeholder="Search "/></td>
		<td><input id="sBtn" name="sBtn"  class="bttn-fill bttn-md bttn-warning" type="button" value="검색" />
			<input id="aBtn" name="aBtn"  class="bttn-fill bttn-md bttn-warning" type="button" value="전체조회" /></td>
	</tr>
	</table>
	<table class="table table-hover">
		<thead class="thead">
			<tr>
				<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td>
				<th>계정과목코드</th>
				<th>계정과목명(한글)</th>
				<th>계정과목명(영어)</th>
				<th>계정과목유형</th>
				<th>사용가능여부</th>
			</tr>
		</thead>
		<tbody id="establishListTbody">
		</tbody>
	</table>




	<c:set var="lastPage"
		value="${Integer(establishCnt/pageSize + (establishCnt%pageSize > 0 ? 1 : 0))}" />

			<nav style="text-align: center;">
				<ul id="pagination" class="pagination">
				</ul>
			</nav>
	
			<button type="button"  class="bttn-jelly bttn-md bttn-warning" data-toggle="modal" data-target="#my80sizeCenterModal">등록</button>
			<button type="button" id="establishDeleteBtn" class="bttn-jelly bttn-md bttn-warning" value="선택삭제" onclick="myclick()" >삭제</button>
	</div>
</div>


<form id="del_frm_establish" action="${pageContext.request.contextPath }/deleteEstablish" method="get">
	<input type="hidden" id="delCode" name="delCode" />
</form>


<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal"
		tabindex="3" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
		<div class="modal-dialog modal-80size modal-center" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">계정과목 등록</h4>
					<span id="head"></span>
				</div>
				
				<!-- 여기부터 로직작성 -->
				<div class="modal-body">
					<div class="form-group">
					<!-- 여기부터 로직작성 -->
						<label for="inputName">계 정 과 목 코 드&nbsp;</label> 
						<input type="text" id="esCode" placeholder="코드를 입력하세요"> 
						<input type="button" class="btn btn-default" id="duplCheck" name="duplCheck" value="중복체크" /> 
						<br />
						<span id="duplicate"></span>
					</div>
					
					<div class="form-group">
						<label for="InputEmail">계정과목명(한글)</label> 
						<input type="text" id="esNameKor" placeholder="계정과목명을 입력하세요."> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">계정과목명(영어)</label> 
						<input type="text" id="esNameEng" placeholder="계정과목명을 입력하세요."> 
					</div>
					
					<div class="form-group">
						<label for="InputEmail">유&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;형&nbsp;</label> 
						<select name="esStatus">
							<option value="자산" selected="selected">자산</option>
							<option value="자본">자본</option>
							<option value="부채">부채</option>
							<option value="비용">비용</option>
							<option value="수익">수익</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="InputEmail">전표입력관리여부&nbsp;&nbsp;</label> 
						<select name="esSlipStatus">
							<option value="Y" selected="selected">Y</option>
							<option value="N">N</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="InputEmail">거래처관리여부&nbsp;&nbsp;&nbsp;</label> 
						<select name="esClientStatus">
							<option value="Y" selected="selected">Y</option>
							<option value="N">N</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="InputEmail">사용가능여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
						<select name="esUseStatus">
							<option value="1" selected="selected">Y</option>
							<option value="0">N</option>
						</select>
					</div>
					
				</div>
				<!-- 여기까지 -->
				<div class="modal-footer">
					<button type="button" id="esInsertBtn" class="btn btn-default" data-dismiss="modal">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	

<form id="esInsert" action="${pageContext.request.contextPath }/insertEstablish" method="post">
	<input type="hidden" id="frmEsCode" name="frmEsCode"/>
	<input type="hidden" id="frmEsNameKor" name="frmEsNameKor"/>
	<input type="hidden" id="frmEsNameEng" name="frmEsNameEng"/>
	<input type="hidden" id="frmEsStatus" name="frmEsStatus"/>
	<input type="hidden" id="frmEsSlipStatus" name="frmEsSlipStatus"/>
	<input type="hidden" id="frmEsClientStatus" name="frmEsClientStatus"/>
	<input type="hidden" id="frmEsUseStatus" name="frmEsUseStatus"/>
</form>

<form id="esUpdate" action="${pageContext.request.contextPath }/updateEatablish" method="post">
	<input type="hidden" id="frm2EsCode" name="frm2EsCode"/>
	<input type="hidden" id="frm2EsNameKor" name="frm2EsNameKor"/>
	<input type="hidden" id="frm2EsNameEng" name="frm2EsNameEng"/>
	<input type="hidden" id="frm2EsStatus" name="frm2EsStatus"/>
	<input type="hidden" id="frm2EsSlipStatus" name="frm2EsSlipStatus"/>
	<input type="hidden" id="frm2EsClientStatus" name="frm2EsClientStatus"/>
	<input type="hidden" id="frm2EsUseStatus" name="frm2EsUseStatus"/>
</form>


<script>



	$("document").ready(function() {
		
		$("#sArea").focus();
		
		
		getEstablishListHtml(1);
		
		
		$("#establishListTbody").on("click", ".detailView", function(){
			$("#modalCode").val($(this).data().establishcode);
			$("#modalNameKor").val($(this).data().establishnamekor);
			$("#modalNameEng").val($(this).data().establishnameeng);
			$("#nowStatus").val($(this).data().status);
		
			
		});

		
		$("#modalUpdateBtn").on("click", function(){
			
			$("#frm2EsCode").val($("#modalCode").val());
			$("#frm2EsNameKor").val($("#modalNameKor").val());
			$("#frm2EsNameEng").val($("#modalNameEng").val());
			$("#frm2EsStatus").val($("select[name=modalStatus]").val());
			$("#frm2EsSlipStatus").val($("select[name=modalSlipStatus]").val());
			$("#frm2EsClientStatus").val($("select[name=modalClientStatus]").val());
			$("#frm2EsUseStatus").val($("select[name=modalUseStatus]").val());
			
			$("#esUpdate").submit();
			
		});
		
		
		
	});
	
	$("#sArea").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#sBtn").click();
		}

	});
	
	
	$("#aBtn").on("click", function(){
		getEstablishListHtml(1);
	});
	
	
	
	$("#sBtn").on("click", function(){
		
		
		$.ajax({
			url : "${pageContext.request.contextPath }/searchEstablishBtn",
			data : "establishNameKor=" + $("#sArea").val() ,
			success : function(data){
				$("#sArea").val("");
				$("#establishListTbody").html(data);
				$("#pagination").html("");
			}
		});
		
		
		
	});
	
	
	
	
	
	
	$("#esInsertBtn").on("click", function(){
		$("#frmEsCode").val($("#esCode").val());
		$("#frmEsNameKor").val($("#esNameKor").val());
		$("#frmEsNameEng").val($("#esNameEng").val())
		$("#frmEsStatus").val($("select[name=esStatus]").val());
		$("#frmEsSlipStatus").val($("select[name=esSlipStatus]").val());
		$("#frmEsClientStatus").val($("select[name=esClientStatus]").val());
		$("#frmEsUseStatus").val($("select[name=esUseStatus]").val());
		
		$("#esInsert").submit();
		
	});
	
	
	
	function getEstablishPageList(page){
		$.ajax({
			url : "${pageContext.request.contextPath }/getEstablishPageList",
			data : "page=" + page,
			success : function(data){
				
				var htmlArr = data
				.split("================seperator================");

				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);
				
			}
		});
		
	}
		

	function getEstablishListHtml(page) {

		$.ajax({
			url : "${pageContext.request.contextPath }/establishAjaxHtml",
			data : "page=" + page,
			success : function(data) {

				var htmlArr = data
						.split("================seperator================");

				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);

			}

		});

	}
	
	
	
	function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}

	/* 선택체크 */
	function myclick() {
		var checkRow = '';
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
			$("#delCode").val(checkRow);
			
			
			if(checkRow === ""){		
				alert("삭제할 대상을 선택하세요");
				return false;
			}
			
		$("#del_frm_establish").submit();
		
	}
	
	
	
	
</script>


	<div class="modal fade" id="esDetail" role="esDetail" aria-hidden="true"> 
   		<div class="modal-dialog">
   			 <div class="modal-content"> 
	   			<div class="modal-header"> 
	   				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	   				<h4 class="modal-title" id="myModalLabel">계정과목 상세정보</h4>
	   			</div> 
	   			
	   			<div class="modal-body"> 
	   				<div class="form-group">
	   					<label for="InputEmail">계정과과목코드&nbsp;&nbsp;&nbsp;</label> 
	   					<input type="text" id="modalCode" name="modalCode" />
	   				</div>
	   				
	   				<div class="form-group">
	   					<label for="InputEmail">계정과목명(한글)</label> 
	   					<input type="text" id="modalNameKor" name="modalNameKor" />
	   				</div>
	   				
	   				<div class="form-group">
	   					<label for="InputEmail">계정과목명(영어)</label> 
	   					<input type="text" id="modalNameEng" name="modalNameEng" />
	   				</div>
	   				
	   				
	   				<div class="form-group">
	   					<label for="InputEmail">현&nbsp;&nbsp;&nbsp;재&nbsp;&nbsp;&nbsp;유&nbsp;&nbsp;&nbsp;형&nbsp;&nbsp;&nbsp;&nbsp;</label> 
	   					<input type="text" id="nowStatus" name="nowStatus" readonly/>
	   					<label for="InputEmail">변경유형</label> 
						<select name="modalStatus">
							<option value="자산" selected="selected">자산</option>
							<option value="자본">자본</option>
							<option value="부채">부채</option>
							<option value="비용">비용</option>
							<option value="수익">수익</option>
						</select>
	   				</div>
	   				
	   				<div class="form-group">
	   					<label for="InputEmail">전표입력관리여부&nbsp;&nbsp;</label> 
						<select name="modalSlipStatus">
							<option value="Y" selected="selected">Y</option>
							<option value="N">N</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="InputEmail">거래처관리여부&nbsp;</label> 
						<select name="modalClientStatus">
							<option value="Y" selected="selected">Y</option>
							<option value="N">N</option>
						</select>
	   				</div>
	   				
	   					<div class="form-group">
	   					<label for="InputEmail">사용가능여부</label> 
	   					<select name="modalUseStatus">
							<option value="1" selected="selected">사용가능</option>
							<option value="0">사용불가</option>
						</select>
	   				</div>
	   			</div> 
	   			
	   			<div class="modal-footer">
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   				</div> 
   				
   			</div> 
   		</div> 
   </div>
