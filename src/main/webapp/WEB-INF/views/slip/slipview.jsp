<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.overScroll::-webkit-scrollbar { 
    display: none !important;
  }

</style>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i>전표 관리</h2>

<div style="text-align: right;">
	<input type="button" class="bttn-fill bttn-warning" id="insertSlipBtn"
		name="insertSlipBtn" value="전표작성" />
</div>

<div id="insertArea"></div>

	<table class="table table-hover">
		<thead class="thead">
			<tr>
				<td><input type="checkbox" name="allCheck" id="th_allCheck"
					onclick="allCheck();"></td>
				<th>전표번호</th>
				<th>분개금액</th>
				<th>작성일</th>
				<th>사용부서</th> 
				<th>메모</th>
				<th>승인여부</th>
			</tr>
		</thead>
			<tbody id="establishListTbody"></tbody>
	</table>

	<c:set var="lastPage"
		value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		</ul>
	</nav>
</div>
</div>



<!-- 상세보기 모달 -->
<!-- Search Establish Modal Window  -->
<div class="modal fade" id="detailSlipView" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content modal-lg">
			<div class="modal-header modalSketchedHeader">
				<h4 class="modal-title" id="myModalLabel">전표상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="input-group">
					<span>전표번호</span> <input style="width: 50px !important;" type="text" class="form-control"
						id="modal_detail_slipNumber" readonly />
				</div>

				<div class="form-group">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<td>상세번호</td>
								<td>계정과목</td>
								<td>거래처</td>
								<td>차변</td>
								<td>대변</td>
							</tr>
						</thead>
						<tbody id="detailBody">
						</tbody>
					</table>
				</div>


			</div>

			<div class="modal-footer"></div>

		</div>
	</div>
</div>

<script>
	$("document").ready(function() {
		getSlipPageList(1);
	});

	function getSlipPageList(page) {
		$.ajax({
			url : "${pageContext.request.contextPath }/getSlipPageList",
			data : "page=" + page,
			success : function(data) {

				var htmlArr = data
						.split("================seperator================");

				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);

			}
		});
	}

	var insertFlag = 0;
	$("#insertSlipBtn").on("click", function() {

		$("#insertSlipBtn").attr("disabled", true);

		if (insertFlag === 0) {
			$.ajax({
				url : "${pageContext.request.contextPath }/getSlipInsertBtn",
				success : function(data) {
					$("#insertArea").html(data);
				}

			});

			insertFlag = 1;
		} else if (insertFlag === 1) {
			$("#insertArea").html("");

			insertFlag = 0;

		}
	});
</script>