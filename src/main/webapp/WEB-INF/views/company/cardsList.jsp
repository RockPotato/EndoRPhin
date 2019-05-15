<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

.thead{
color : white;
background-color: #6E6867;
}

</style>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i> 신용카드 등록</h2>
		<div class="form-group">
		<!--테이블 리스트출력  -->
		<table>
			<tr>
				<td><strong>카드번호 :</strong></td>
				<td> <input class="search-query form-control" name="cardNumber1" id="cardNumber1" type="text" /></td>
				<td><strong>카드명 : </strong> </td>
				<td><input class="search-query form-control" name="cardName1" id="cardName1" type="text" /></td>
				<td><input class="bttn-fill bttn-md bttn-warning" type="button" id="seachBtn" value="검색"	onclick="seachBtn()" /><br>
				</td>
			</tr>
		</table>
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<td><input type="checkbox" name="allCheck" id="th_allCheck"
						onclick="allCheck();"></td>
					<th>카드 코드</th>
					<th>카드번호</th>
					<th>카드명</th>
					<th>카드구분</th>
					<th>메모</th>
					<th>사용구분</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cardsList }" var="vo">
					<input type="hidden" class="cardCode" name="cardCode"
						value="${vo.cardCode }" />
					<tr>
						<td><input type="checkbox" name="checkRow"
							value="${vo.cardCode }"></td>
						<td><a class="bttn-stretch bttn-md bttn-warning"
							href="${pageContext.request.contextPath}/cardsDetail?cardCode=${vo.cardCode }">${vo.cardCode }</a></td>
						<td>${vo.cardNumber }</td>
						<td>${vo.cardName }</td>
						<c:choose>
							<c:when test="${vo.cardSortation == 1 }">
								<td>개인</td>
							</c:when>
							<c:otherwise>
								<td>법인</td>
							</c:otherwise>
						</c:choose>
						<td>${vo.memo }</td>
						<c:choose>
							<c:when test="${vo.status == 1}">
								<td>사용</td>
							</c:when>

							<c:otherwise>
								<td><font color="red"> 미사용</font></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!--------------(삭제,등록) 버튼 ------------------->

		<div class="modal-footer">
			<input name="delect_btn" id="delect_btn" type="button" value="선택삭제" class="bttn-jelly bttn-warning"
				onclick="myclick()" />
			<button type="button" class="bttn-jelly bttn-warning" data-toggle="modal" 
				data-target="#my80sizeCenterModal">등록</button>
		</div>
		</div>
	</div>
</div>				
	<!-------------- 신용카드 등록 모달창 띄우기  ------------>
	
	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>거래처 등록</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
					<!-- 여기부터 로직작성 -->
						<label>신용카드코드(*)</label> 
						<input type="text" id="cardCode" placeholder="코드를 입력하세요"> 
						<input type="button" value="중복체크" class="btn btn-default" id="duplCheckbtn" name="duplCheckbtn"/> 
						<div id="dupleCode"></div>
					</div>
					<div class="form-group">
						<label>법인/개인카드</label>
						<input type="radio" name="cardSortation" value="0" checked="checked" />법인 
						<input type="radio" name="cardSortation" value="1"/>개인
					</div>				
					<div class="form-group">
						<label>카드번호(*) </label> 
						<input style="width: 388px;" type="text" name="cardNumber" id="cardNumber" placeholder="카드번호를 입력하세요"> 
					</div>	
						<div class="form-group">
						<label>카 드 명 (*) </label> 
						<input style="width: 388px;" type="text" name="cardName" id="cardName" placeholder="카드명을 입력하세요"> 
					</div>	
						<div class="form-group">
						<label>메 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 모&nbsp;</label> 
						<textarea style="width: 388px" id="memo" placeholder="메모">
						</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!----------------등록, 검색, 삭제 ---------------->
	
	<form id="insertFrm" action="${pageContext.request.contextPath }/insertCards">
		<input type="hidden" id="frmcardCode" name="frmcardCode" />
		<input type="hidden" id="frmcardSortation" name="frmcardSortation" />
		<input type="hidden" id="frmcardNumber" name="frmcardNumber" />
		<input type="hidden" id="frmcardName" name="frmcardName" />
		<input type="hidden" id="frmmemo" name="frmmemo" />
	</form>
	
	<form id="frm1" action="${pageContext.request.contextPath }/serachCards" >
		<input type="hidden" name="card_num" id="card_num" />
		<input type="hidden" name="card_name" id="card_name" />
	</form>
 	
 	<form id="del_frm" action="${pageContext.request.contextPath }/deleteCards">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		
 		
	<!-------------------------------------------->
 	
	<script>
	    /* 등록  */
		$("#insertBtn").on("click", function(){
			
			var cardCode 		= $("#cardCode").val();
			var cardSortation   = $("#cardSortation").val();
			var cardNumber		= $("#cardNumber").val();
			var cardName 		= $("#cardName").val();
			var memo 			= $("#memo").val();
			
			$("#frmcardCode").val(cardCode);
			$("#frmcardSortation").val(cardSortation);
			$("#frmcardNumber").val(cardNumber);
			$("#frmcardName").val(cardName);
			$("#frmmemo").val(memo);
			
			if($("#cardNumber").val().trim()==""){
				alert("카드번호을 입력하세요");
				$("#cardNumber").focus();
				return false;
			}
			if($("#cardName").val().trim()==""){
				alert("카드이름을 입력하세요");
				$("#cardName").focus();
				return false;
			}
		     
			$("#insertFrm").submit();
		
	});
	    /* 카드코드 중복체크 ajax */
 	    $("#duplCheckbtn").on("click", function(){
	    	
	    	$.ajax({
	    		url 	: "${pageContext.request.contextPath }/DupleCards",
	    		method  : "post",
	    		data 	: "cardCode="+$("#cardCode").val(),
	    		success : function(dupleCode){
	    			transDupl(dupleCode);
	    		}
	    	});
	    }); 
	
		var dupleCode ="";
	    function transDupl(dupleCode){
	    	if(dupleCode == "0"){
	    		dupleCode ="<b><font color='blue'>사용가능한 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>중복된 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>카드 코드를 입력하세요.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}
	    }  
	    
		/* 검색 */
		function seachBtn(){
			var cardNumber = $("#cardNumber1").val();
			var cardName   = $("#cardName1").val();
			
			$("#card_num").val(cardNumber);
			$("#card_name").val(cardName);
			
			if(cardNumber === "" && cardName === ""){
				alert("카드번호와 카드명을 입력하세요.");
				$("card_num1").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#cardNumber1").val(cardNumber);
				$("#cardName1").val(cardName);

				$("#frm1").submit();		
			}
		}
		
		/* 전체선택 삭제 */
		function allCheck() {
			if ($("#th_allCheck").is(':checked')) {
					$("input[name=checkRow]").prop("checked", true);
				} else {
					$("input[name=checkRow]").prop("checked", false);
				}
			}

		/* 선택삭제  */
		function myclick() {
			var checkRow = '';
			$("input[name=checkRow]:checked").each(function() {
				checkRow += $(this).val()+",";
			});
				checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
				$("#checkRow").val(checkRow);
				
			if(checkRow === ""){		
				alert("삭제할 대상을 선택하세요");
				return false;
			}
			
			
 				$("#del_frm").submit();
		}
	
	</script>
	

 	
