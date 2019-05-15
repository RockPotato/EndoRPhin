<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">

	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h4>
			<i class="fa fa-calculator"></i> 신용카드 상세정보
		</h4>
		<table class="table table-striped">
			<tr>
				<td><label class="detail_name">신용카드코드(*) </label></td>
				<td><input style="width: 388px;" type="text"
					value="${cards.cardCode}" readonly /></td>

			</tr>
			<tr>
				<td><label class="detail_card">법 인 / 개인카드 </label></td>
				<td><input type="radio" value="${cards.cardSortation}"
					<c:if test="${cards.cardSortation==0}">checked="checked"</c:if>>법인
					<input type="radio" value="${cards.cardSortation}"
					<c:if test="${cards.cardSortation==1}">checked="checked"</c:if>>개인
				</td>
			</tr>

			<tr>
				<td><label class="detail_name">카 드 번 호 (*) </label></td>
				<td><input style="width: 388px;" type="text" name="cardNumber1"
					id="cardNumber1" value="${cards.cardNumber}" readonly>
				<td>
			</tr>
			<tr>
				<td><label class="detail_name">카 드 명 (*) </label></td>
				<td><input style="width: 388px;" type="text" name="cardName1"
					id="cardName1" value="${cards.cardNumber}" readonly></td>
			</tr>
			<tr>
				<td><label class="detail_name">메
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모&nbsp;</label></td>
				<td><textarea style="width: 388px" id="memo" readonly>${cards.memo}</textarea>
				<td>
			</tr>
		</table>
		<button type="button" class="bttn-simple bttn-md bttn-warning"
			onclick="history.back(-1);">뒤로가기</button>
		<button type="button" id="" class="bttn-simple bttn-md bttn-warning"
			data-toggle="modal" data-target="#my80sizeCenterModal">수정</button>
	</div>
</div>

<!-------------- 신용카드 수정 모달창 띄우기  ------------>

<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="my80sizeCenterModal"
	tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<label>거래처 수정</label>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="form-group">
					<!-- 여기부터 로직작성 -->
					<label>신용카드코드(*)</label> <input type="text" id="cardCode"
						name="cardCode" value="${cards.cardCode}" readonly>
				</div>
				<div class="form-group">
					<label>법인/개인카드</label> <input type="radio" name="cardSortation"
						id="cardSortation" value="0" checked />법인 <input type="radio"
						name="cardSortation" id="cardSortation" value="1" />개인
				</div>
				<div class="form-group">
					<label>카드번호(*) </label> <input style="width: 388px;" type="text"
						name="cardNumber" id="cardNumber" placeholder="카드번호를 입력하세요">
				</div>
				<div class="form-group">
					<label>카 드 명 (*) </label> <input style="width: 388px;" type="text"
						name="cardName" id="cardName" placeholder="카드명을 입력하세요">
				</div>
				<div class="form-group">
					<label>메 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						모&nbsp;</label>
					<textarea style="width: 388px" id="memo" placeholder="메모">
						</textarea>
				</div>
			</div>
			<div class="modal-footer">
				<c:if test="${cards.status == 0}">
					<button id="yes_Btn" name="yes_Btn" class="btn btn-default"
						data-dismiss="modal" value="1"
						style="background: #486068; color: #ffffff">사용</button>
				</c:if>
				<c:if test="${cards.status == 1}">
					<button id="no_btn" name="no_btn" class="btn btn-default"
						data-dismiss="modal" value="0"
						style="background: #ff8e77; color: #ffffff">미사용</button>
				</c:if>
				<button type="button" id="modifyBtn" class="btn btn-default"
					data-dismiss="modal">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-------------------------------------------->

<form id="updateFrm"
	action="${pageContext.request.contextPath }/updateCards">
	<input type="hidden" id="frmcardCode" name="frmcardCode" /> <input
		type="hidden" id="frmcardSortation" name="frmcardSortation" /> <input
		type="hidden" id="frmcardNumber" name="frmcardNumber" /> <input
		type="hidden" id="frmcardName" name="frmcardName" /> <input
		type="hidden" id="frmmemo" name="frmmemo" /> <input type="hidden"
		id="status" name="status" value="${cards.status}">
</form>

<form id="useFrm" action="${pageConext.request.contextPath }/UseCards">
	<input type="hidden" id="use_status" name="use_status"> <input
		type="hidden" id="use_cardCode" name="use_cardCode">
</form>
<!-------------------------------------------->

<script>
	/* 수정  */
	$("#modifyBtn").on("click", function() {

		var cardCode = $("#cardCode").val();
		var cardSortation = $("#cardSortation").val();
		var cardNumber = $("#cardNumber").val();
		var cardName = $("#cardName").val();
		var memo = $("#memo").val();
		var status = $("#status").val();

		$("#frmcardCode").val(cardCode);
		$("#frmcardSortation").val(cardSortation);
		$("#frmcardNumber").val(cardNumber);
		$("#frmcardName").val(cardName);
		$("#frmmemo").val(memo);
		$("#status").val(status);

		if ($("#cardNumber").val().trim() == "") {
			alert("카드번호을 입력하세요");
			$("#cardNumber").focus();
			return false;
		}
		if ($("#cardName").val().trim() == "") {
			alert("카드이름을 입력하세요");
			$("#cardName").focus();
			return false;
		}

		$("#updateFrm").submit();

	});
	$("#yes_Btn").on("click", function() {

		var cardCode = $("#cardCode").val();
		var status = $("#yes_Btn").val();

		$("#use_cardCode").val(cardCode);
		$("#use_status").val(status);

		$("#useFrm").submit();
	});
	$("#no_btn").on("click", function() {

		var cardCode = $("#cardCode").val();
		var status = $("#no_btn").val();

		$("#use_cardCode").val(cardCode);
		$("#use_status").val(status);

		$("#useFrm").submit();
	});
</script>
