<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="modal" id="attitudeEdit" aria-hidden="true"
	style="display: none; z-index: 1100;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">근태이력 수정</h4>
			</div>
			<div class="container"></div>
			<div class="modal-body">


				<form action="${cp}/attitudeRecord/attitudeRecordUpdate"
					method="post">


					<div class="row-0">
						<div class="col-0-0">
							<ul style="border-spacing: 5 px;">
								<li>근태 항목 <select id="attitudecodeRecordEdit"
									name="attitudecode">
										<option value="1">연차휴가</option>
										<option value="2">예비군훈련</option>
										<option value="3">여름휴가</option>
								</select>
								</li>
								<li id="hiddenUser" style="margin-top: 20px"><input
									class="inputCla" type="text" id="afterStartdayInsertRecordEdit"
									name="afterStartday">~ <input type="hidden"
									id="startDateInsertRecordEdit" name="startday"> <input
									type="hidden" id="useridInsertRecordEdit" name="userid">
									<input class="inputCla" type="text"
									id="endDateInsertRecordEdit" name="endday" onchange="call()">

									<input style="margin-left: 60px;" type="text"
									id="basedaysRecordEdit">일수 <input
									style="margin-left: 60px;" type="text"
									id="attitudememoRecordEdit" name="attitudememo">메모</li>
							</ul>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">저장</button>
				</form>
				<a href="#" data-dismiss="modal" class="btn">취소</a>
			</div>
		</div>
	</div>
</div>







<script>
	$(function() {
		$("#afterStartdayInsertRecordEdit")
				.datepicker(
						// inputbox 의 id 가 startDate 이겠죠.
						{
							dateFormat : 'yy-mm-dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
							,
							showOn : 'button' // 우측에 달력 icon 을 보인다.
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" // 우측 달력 icon 의 이미지 패스 
							,
							buttonImageOnly : true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
							,
							changeMonth : true // 월선택 select box 표시 (기본은 false)
							,
							changeYear : true // 년선택 selectbox 표시 (기본은 false)
							,
							showButtonPanel : true
						// 하단 today, done  버튼기능 추가 표시 (기본은 false)
						});

		$("#endDateInsertRecordEdit")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
							showOn : 'button',
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
							buttonImageOnly : true,
							changeMonth : true,
							changeYear : true,
							showButtonPanel : true
						});

	});

	function call() {

		var sdd = document.getElementById("afterStartdayInsertRecordEdit").value;
		var edd = document.getElementById("endDateInsertRecordEdit").value;

		var arr1 = sdd.split('-');
		var arr2 = edd.split('-');

		var dt1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dt2 = new Date(arr2[0], arr2[1], arr2[2]);
		var diff = dt2 - dt1;

		var day = 1000 * 60 * 60 * 24;

		$("#basedaysRecordEdit").val((parseInt(diff / day)));

	}
</script>
