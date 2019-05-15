<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
	display: table;
	height: 80px;
	position: relative;
}

.table td {
	display: table-cell;
	vertical-align: middle !important;
}
</style>
<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
			<h3>
				<strong><i class="fa fa-calculator"></i>급여항목 등록</strong>
			</h3>
			<form action="/addProduct" id="searchFrm">
				<input type="hidden" name="deprostatus" value="1" />
				<table>
					<tr>
						<td>급여명 검색 :</td>
						<td><div class="group">
								<input type="text" class="form-control"
									id="searchPay" name="searchDeductName" placeholder="Search" />
							</div></td>
						<td>
							<button class="bttn-fill bttn-md bttn-warning" type="button"
								id="searchBtn">
								<span class=" glyphicon glyphicon-search">검색</span>
							</button>
						</td>
					</tr>
				</table>
			</form>
			<form action="/delDeproduct" id="deleteFrm">
				<input type="hidden" name="deprostatus" value="1" />
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkAll" /></th>
								<th>급여코드</th>
								<th>항목명</th>
								<th>과세여부</th>
								<th>상여대상여부</th>
								<th>사용구분</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${allDe_product_div}" var="vo">
								<tr class="payTr" data-decd="${vo.deductCode }">
									<td><input type="checkbox" class="check" /><input
										type="hidden" class="valPay"></td>
									<td><a data-transition="pop" href="#detailLayer"
										class="bttn-stretch bttn-md bttn-warning deductDetail">${vo.deductCode }</a></td>
									<td>${vo.deductName}</td>
									<c:if test="${vo.taxStatus==1}">
										<td>과세 대상</td>
									</c:if>
									<c:if test="${vo.taxStatus==2}">
										<td>과세 비대상</td>
									</c:if>
									<c:if test="${vo.bonusStatus==1}">
										<td>상여 대상</td>
									</c:if>
									<c:if test="${vo.bonusStatus==2}">
										<td>상여 비대상</td>
									</c:if>
									<c:if test="${vo.useStatus==1}">
										<td>사용</td>
									</c:if>
									<c:if test="${vo.useStatus==2}">
										<td>미사용</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="btn_btm">
					<input class="bttn-jelly bttn-md bttn-warning" type="button"
						id="delPayBtn" value="선택 삭제">
					<button type="button" class="bttn-jelly bttn-md bttn-warning"
						data-toggle="modal" style="margin-left: 20px"
						data-target="#my80sizeModal">신규등록</button>
				</div>
			</form>
		</div>
		</div>

<!-- 80% size Modal  등록 모달 창-->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog"
	aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">급여 등록</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form action="${cp}/addDeproduct" method="post" id="modalAddFrm">
						<input type="hidden" name="deprostatus" value="1" /> <label
							for="inputName">급여코드</label> <input type="text"
							class="form-control" name="deductCode"
							placeholder="급여코드를 입력해 주세요">
						<button type="button" class="btn btn-default"
							id="addModalCheckBtn">중복여부</button>
				</div>
				<div class="form-group">
					<label for="InputEmail">급여명</label> <input type="text"
						class="form-control" name="deductName" placeholder="급여명을 입력해주세요">
				</div>


				<div class="form-group">
					<table>
						<tr>
							<td><label for="inputPassword">과세여부</label></td>
							<td><select name="taxStatus" class="form-control">
									<option value="1">예</option>
									<option value="2">아니오</option>
							</select></td>

							<td><label for="inputPassword">상여여부</label></td>
							<td><select name="bonusStatus" class="form-control">
									<option value="1">예</option>
									<option value="2">아니오</option>
							</select></td>
						</tr>
					</table>
				</div>


				<div class="form-group">
					<label for="inputPassword">사용여부</label> <select name="useStatus"
						class="form-control">
						<option value="1">예</option>
						<option value="2">아니오</option>
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalAddBtn" type="button" class="btn btn-default">등록</button>
				</form>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<!-- 상세조회 모달창 -->

<form action="/delDeproduct" id="dialogFrm">
	<div class="dialog">
		<input type="hidden" name="deprostatus" value="1" /> <span
			class="dialog__close">&#x2715;</span> <label for="inputName">급여코드</label>
		<input type="hidden" name="deductCode" id="dialog_deductCode" /> <label
			for="inputName" class="dialog_deductCode"></label><br /> <label
			for="InputEmail">급여명</label> <input type="text"
			class="search-query form-control dialog_deductName" name="deductName"
			placeholder="급여명을 입력해주세요"><br /> <label for="inputPassword">과세여부</label>
		<select name="taxStatus" class="form-control" id="dialog_taxStatus">
			<option value="1">예</option>
			<option value="2">아니오</option>
		</select> <label for="inputPassword">상여여부</label> <select name="bonusStatus"
			class="form-control" id="dialog_bonusStatus">
			<option value="1">예</option>
			<option value="2">아니오</option>
		</select> <label for="inputPassword">사용여부</label> <select name="useStatus"
			class="form-control" id="dialog_useStatus">
			<option value="1">예</option>
			<option value="2">아니오</option>
		</select>
		<button id="updDeduct" class="btn btn-default dialog__action">수정</button>
		<button id="dialog_delBtn" class="btn btn-default dialog__action">삭제</button>
	</div>
</form>


<script>
	var modalAddCheck = false;

	$(document).ready(function() {
		dialog();
	});

	$("#updDeduct").click(function() {
		$("#dialogFrm").attr("action", "/updDeduct");
	})

	function dialog() {

		var dialogBox = $('.dialog'), deductDetail = $('.deductDetail'), dialogClose = $('.dialog__close'), dialog_deductCode = $('.dialog_deductCode'), dialog_deductName = $('.dialog_deductName'), dialog_taxStatus = $('#dialog_taxStatus');
		dialog_bonusStatus = $('#dialog_bonusStatus');
		dialog_useStatus = $('#dialog_useStatus');

		// Open the dialog
		deductDetail.on('click', function(e) {
			dialogBox.toggleClass('dialog--active');

			$.ajax({
				method : "post",
				url : "/findDeductCode",
				data : "deductCode=" + $(this).parents(".payTr").data("decd"),
				success : function(data) {
					$("#dialog_deductCode").val(data.deductCode);
					$(".dialog_deductCode").html(data.deductCode);
					$(".dialog_deductName").val(data.deductName);
					$("#dialog_taxStatus").val(data.taxStatus);
					$("#dialog_bonusStatus").val(data.bonusStatus);
					$("#dialog_useStatus").val(data.useStatus);
					if (data.taxStatus == null) {
						$("#dialog_taxStatus").val("");
					}
					if (data.bonusStatus == null) {
						$("#dialog_bonusStatus").val("");
					}
					if (data.useStatus == null) {
						$("#dialog_useStatus").val("");
					}
				}
			});
			e.stopPropagation()
		});

		// Close the dialog - click close button
		dialogClose.on('click', function() {
			dialogBox.removeClass('dialog--active');
		});

		// Close the dialog - press escape key // key#27
		$(document).keyup(function(e) {
			if (e.keyCode === 27) {
				dialogBox.removeClass('dialog--active');
			}
		});

		// Close dialog - click outside
		$(document).on(
				"click",
				function(e) {
					if ($(e.target).is(dialogBox) === false
							&& $(e.target).is(dialog_deductCode) === false
							&& $(e.target).is(dialog_deductName) === false
							&& $(e.target).is(dialog_taxStatus) === false
							&& $(e.target).is(dialog_bonusStatus) === false
							&& $(e.target).is(dialog_useStatus) === false) {
						dialogBox.removeClass("dialog--active");
					}
				});

	};

	$("#addModalCheckBtn").on("click", function() {
		$.ajax({
			type : "get",
			url : "/findDeductCode",
			data : {
				deductCode : $("input[name=deductCode]").val()
			},
			success : function(data) {
				if (data == 1) {
					modalAddCheck = true;
					alert("사용가능한 급여코드입니다.");
				} else {
					modalAddCheck = false;
					alert("사용 불가능한 급여코드입니다.");
				}
			}
		});
	})

	$("#checkAll").on("click", function() {
		if (this.checked == false) {
			$("input[class=check]").each(function() {
				this.checked = false;
			});
		} else {
			$("input[class=check]").each(function() {
				this.checked = true;
			});
		}
	});
	$("#modalAddBtn").on("click", function() {
		if ($("input[name=deductCode]").val() == "") {
			alert("급여코드를 입력해주세요.");
		} else if ($("input[name=deductName]").val() == "") {
			alert("급여명를 입력해주세요.");
		} else if (modalAddCheck == false) {
			alert("중복검사를 하지 않으셨습니다.");
		} else {
			$("#modalAddFrm").submit();
		}
	});
	$("#searchBtn").on("click", function() {
		if ($("#searchPay").val() != "") {
			$("#searchFrm").submit();
		} else
			alert("문자를 입력하세요!")
	})
	$("#delPayBtn").on(
			"click",
			function() {
				if ($("input[class=check]:checked").length == 0) {
					alert("삭제할 급여항목을 선택하세요");
					return false;
				}
				$("input[class=check]:checked").each(
						function() {
							$(this).siblings(".valPay").attr("value",
									$(this).parents('.payTr').data('decd'));
							$(this).siblings('.valPay').attr("name",
									"deductCode");
						});
				$("#deleteFrm").submit();
			})
</script>